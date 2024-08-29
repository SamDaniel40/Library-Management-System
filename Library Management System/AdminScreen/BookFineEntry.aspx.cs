using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_BookFineEntry : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["mid"] != null && Request.QueryString["mid"] != string.Empty)
            {
                GetMemName(Request.QueryString["mid"]);
            }
            if (Request.QueryString["day"] != null && Request.QueryString["day"] != string.Empty)
            {
                Calculatebookfine(Request.QueryString["day"]);
            }
            lblredirectMsg.Visible = false;
        }
    }

    protected void GetMemName(string mmid)
    {
        cmd = new SqlCommand("select Name, Email, Address, City, State, PinCode from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value=mmid;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            lblMembername.Text = dt.Rows[0]["Name"].ToString();
            txtFullName.Text = dt.Rows[0]["Name"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            txtaddress.Text = dt.Rows[0]["Address"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtstate.Text = dt.Rows[0]["State"].ToString();
            txtzip.Text = dt.Rows[0]["PinCode"].ToString();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid Member ID ...Try Again','error')", true);
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        A1.Visible = false;
        A2.Visible = true;
        btnNext.Visible = false;
    }

    protected void Calculatebookfine(string d)
    {
        int days = Convert.ToInt32(d);
        double fine;
        if (days <= 0)
        {
            fine = 0.0;
        }
        else if (days > 0 && days <= 5)
        {
            fine = days * 0.5;
        }
        else if (days > 5 && days <= 10)
        {
            fine = (days - 5) * 1 + 5 * 0.5;
        }
        else if (days > 10 && days <= 30)
        {
            fine = (days - 10) * 1.5 + 5 * 1 + 5 * 0.5;
        }
        else
        {
            fine = (days - 30) * 2 + 20 * 1.5 + 5 * 1 + 5 * 0.5;
        }
        lblfine.Text = "" + fine;
        txtAmount.Text = fine.ToString();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            InsertBookFine();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Validation Issue ...Try Again','error')", true);
        }
    }

    private void InsertBookFine()
    {
        cmd = new SqlCommand("insert into tbl_FineRecord(BookId, MemberId, Name, FineAmount, FinePayDate, EmailId, Address, City, "+
                             "State, PinCode, PayOption, NameOnCard, CardNo, ExpMonth, ExpYear, CVV, FineStatus) values(@BookId, "+
                             "@MemberId, @Name, @FineAmount, GetDate(), @EmailId, @Address, @City, @State, @PinCode, @PayOption, "+
                             "@NameOnCard, @CardNo, @ExpMonth, @ExpYear, @CVV, @FineStatus)", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value=Request.QueryString["bid"];
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = Request.QueryString["mid"];
        cmd.Parameters.Add("Name", SqlDbType.VarChar).Value = lblMembername.Text;
        cmd.Parameters.Add("FineAmount", SqlDbType.Decimal).Value = Decimal.Parse(txtAmount.Text);
        cmd.Parameters.Add("EmailId", SqlDbType.VarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("Address", SqlDbType.VarChar).Value = txtaddress.Text;
        cmd.Parameters.Add("City", SqlDbType.VarChar).Value = txtCity.Text;
        cmd.Parameters.Add("State", SqlDbType.VarChar).Value = txtstate.Text;

        if (string.IsNullOrEmpty(txtzip.Text))
            cmd.Parameters.Add("PinCode", SqlDbType.Int).Value = DBNull.Value;
        else
            cmd.Parameters.Add("PinCode", SqlDbType.Int).Value = int.Parse(txtzip.Text);

        cmd.Parameters.Add("PayOption", SqlDbType.VarChar).Value = ddlPayOption.SelectedItem.Text;
        cmd.Parameters.Add("NameOnCard", SqlDbType.VarChar).Value = txtNameOnCard.Text;

        if(string.IsNullOrEmpty(txtcardNumber.Text))
            cmd.Parameters.Add("CardNo", SqlDbType.Int).Value = DBNull.Value;
        else
            cmd.Parameters.Add("CardNo", SqlDbType.Int).Value = Int64.Parse(txtcardNumber.Text);
        
        cmd.Parameters.Add("ExpMonth", SqlDbType.VarChar).Value = txtExpmonth.Text;

        if (string.IsNullOrEmpty(txtexpyear.Text))
            cmd.Parameters.Add("ExpYear", SqlDbType.Int).Value = DBNull.Value;
        else
            cmd.Parameters.Add("ExpYear", SqlDbType.Int).Value = int.Parse(txtexpyear.Text);

        if (string.IsNullOrEmpty(txtcvv.Text))
            cmd.Parameters.Add("CVV", SqlDbType.Int).Value = DBNull.Value;
        else
            cmd.Parameters.Add("CVV", SqlDbType.Int).Value = int.Parse(txtcvv.Text);

        cmd.Parameters.Add("FineStatus", SqlDbType.VarChar).Value = "Paid";
        if (dbcon.InsertUpdateData(cmd))
        {
            ReturnBook();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Books Fine Paid and Book Returned Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Updated ...Try Again','error')", true);
        }
    }
    private void ReturnBook()
    {
        cmd = new SqlCommand("delete from tbl_BookIssue where BookId=@BookId and MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = Request.QueryString["bid"];
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = Request.QueryString["mid"];
        if (dbcon.InsertUpdateData(cmd))
        {
            A2.Visible = false;
            lblredirectMsg.Visible = true;
            updateBookStock();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Book Returned Successfully','success')", true);

            Response.AddHeader("REFRESH", "5;URL=AdminHome.aspx");
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Updated ...Try Again','error')", true);
        }
    }

    protected void updateBookStock()
    {
        cmd = new SqlCommand("update tbl_BookMaster set CurrentStock=CurrentStock+1 where BookId=@BookId", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = Request.QueryString["bid"];
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Books Returned Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Current Stock not Updated ...Try Again','error')", true);
        }
    }

    protected void ddlPayOption_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayOption.SelectedItem.Text == "Card")
        {
            rfvNameonCard.Enabled = rfvDebitCreditNo.Enabled = rfvExpyear.Enabled = rfvExpmonth.Enabled = rfvcvv.Enabled = true;
        }
    }
}