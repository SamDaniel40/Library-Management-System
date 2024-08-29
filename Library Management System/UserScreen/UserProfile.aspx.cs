using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserScreen_UserProfile : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == "" || Session["username"] == null)
        {
            Response.Write("<script>alert('Session Expired Login Again');</script>");
            Response.Redirect("../Pages/SignOut.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                SearchMember();
                FillGrid();
            }
        }
    }

    protected void SearchMember()
    {
        cmd = new SqlCommand("select MemberId, Name, left(Convert(Varchar, DOB, 120), 10) as Dob, ContactNo, Email, State, City, PinCode, Address, Password, Status from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = Session["mid"].ToString();
        DataTable dt = new DataTable();
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            txtFullName.Text = dt.Rows[0]["Name"].ToString();
            txtDOB.Text = dt.Rows[0]["Dob"].ToString();
            txtContact.Text = dt.Rows[0]["ContactNo"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            ddlState.SelectedValue = dt.Rows[0]["State"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString().Trim();
            txtPincode.Text = dt.Rows[0]["PinCode"].ToString();
            txtFullAddress.Text = dt.Rows[0]["Address"].ToString();
            txtUserID.Text = dt.Rows[0]["MemberId"].ToString();
            txtOldPassword.Text = dt.Rows[0]["Password"].ToString();
            Session["pwd"] = dt.Rows[0]["Password"].ToString();
            lblStatus.Text = dt.Rows[0]["Status"].ToString();

            if (dt.Rows[0]["Status"].ToString().Trim() == "Active")
            {
                lblStatus.Attributes.Add("class", "badge badge-pill badge-success");
            }
            else if (dt.Rows[0]["Status"].ToString().Trim() == "Pending")
            {
                lblStatus.Attributes.Add("class", "badge badge-pill badge-warning");
            }
            else if (dt.Rows[0]["Status"].ToString().Trim() == "DeActive")
            {
                lblStatus.Attributes.Add("class", "badge badge-pill badge-danger");
            }
            else
            {
                lblStatus.Attributes.Add("class", "badge badge-pill badge-info");
            }

        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Member ID ...Try Again','error')", true);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == "" || Session["username"] == null)
        {
            Response.Write("<script>alert('Session Expired Login Again');</script>");
            Response.Redirect("../Pages/Login.aspx");
        }
        else
        {
            if (IsValid)
            {
                UpdateUserProfile();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error! ...Try Again','error')", true);
            }
        }
    }

    protected void UpdateUserProfile()
    {
        cmd = new SqlCommand("update tbl_MemberMaster set Name=@Name, DOB=@DOB, ContactNo=@ContactNo, Email=@Email, State=@State, City=@City, PinCode=@PinCode, Address=@Address, Password=@Password where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("Name", SqlDbType.VarChar).Value = txtFullName.Text;

        if (txtDOB.Text == string.Empty)
        {
            cmd.Parameters.Add("DOB", SqlDbType.DateTime).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDOB.Text);
        }

        if (txtContact.Text == string.Empty)
        {
            cmd.Parameters.Add("ContactNo", SqlDbType.BigInt).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("ContactNo", SqlDbType.BigInt).Value = Convert.ToInt64(txtContact.Text);
        }

        cmd.Parameters.Add("Email", SqlDbType.VarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("State", SqlDbType.VarChar).Value = ddlState.SelectedItem.Text;
        cmd.Parameters.Add("City", SqlDbType.VarChar).Value = txtCity.Text;

        if (txtPincode.Text == string.Empty)
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = Convert.ToInt64(txtPincode.Text);
        }

        cmd.Parameters.Add("Address", SqlDbType.VarChar).Value = txtFullAddress.Text;
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = Session["mid"].ToString();

        if (txtNewPassword.Text != string.Empty)
        {
            cmd.Parameters.Add("Password", SqlDbType.VarChar).Value=txtNewPassword.Text;
        }
        else
        {
            cmd.Parameters.Add("Password", SqlDbType.VarChar).Value = txtOldPassword.Text;
        }

        if (dbcon.InsertUpdateData(cmd))
        {
            Response.Redirect("UserHome.aspx");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Your Profile Updated Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Inserted ...Try Again','error')", true);
        }
    }

    protected void FillGrid()
    {
        cmd = new SqlCommand("select MemberId, MemberName, BookId, BookName, Convert(Varchar,IssueDate,103) as IssueDate, Convert(Varchar,DueDate,103) as DueDate from tbl_BookIssue where MemberId=@MemberId order by IssueDate desc", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value=Session["mid"].ToString();

        GridView1.DataSource = dbcon.Load_Data(cmd);
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DateTime dt = DateTime.ParseExact(e.Row.Cells[5].Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime today = DateTime.Today;
            if (today > dt)
            {
                e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
            }
        }
    }
}