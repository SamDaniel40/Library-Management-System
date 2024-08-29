using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_BookIssueReturn : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
        }
    }

    protected void FillGrid()
    {
        cmd = new SqlCommand("select MemberId, MemberName, BookId, BookName, Convert(Varchar,IssueDate,103) as IssueDate, Convert(Varchar,DueDate,103) as DueDate from tbl_BookIssue", dbcon.GetCon());
        GridView1.DataSource = dbcon.Load_Data(cmd);
        GridView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            GetMemName();
            GetBookName();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error! Member ID or Book ID not Present ...Try Again','error')", true);
        }
    }

    protected void GetBookName()
    {
        cmd = new SqlCommand("select BookName from tbl_BookMaster where BookId=@BookId", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            txtBookName.Text = dt.Rows[0]["BookName"].ToString();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid Book ID ...Try Again','error')", true);
        }
    }

    protected void GetMemName()
    {
        cmd = new SqlCommand("select Name from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            txtMemName.Text = dt.Rows[0]["Name"].ToString();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid Member ID ...Try Again','error')", true);
        }
    }

    protected void btnIssue_Click(object sender, EventArgs e)
    {
        if (IsBookExist() && IsMemberExist())
        {
            if (IsIssueEntryExist())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','This Member already have this Book Issued...Try Again','error')", true);
            }
            else
            {
                issueBook();
                FillGrid();
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid Book ID or Member ID...Try Again','error')", true);
        }
    }

    protected void issueBook()
    {
        cmd = new SqlCommand("insert into tbl_BookIssue(MemberId, MemberName, BookId, BookName, IssueDate, DueDate) values(@MemberId, @MemberName, @BookId, @BookName, @IssueDate, @DueDate) ", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        cmd.Parameters.Add("MemberName", SqlDbType.VarChar).Value = txtMemName.Text;
        cmd.Parameters.Add("BookName", SqlDbType.VarChar).Value = txtBookName.Text;
        cmd.Parameters.Add("IssueDate", SqlDbType.DateTime).Value = DateTime.Parse(txtIssueDate.Text);
        cmd.Parameters.Add("DueDate", SqlDbType.DateTime).Value = DateTime.Parse(txtDueDate.Text);
        if (dbcon.InsertUpdateData(cmd))
        {
            updateBookStock();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Updated ...Try Again','error')", true);
        }
    }

    protected void updateBookStock()
    {
        if (IsIssueEntryExist())
            cmd = new SqlCommand("update tbl_BookMaster set CurrentStock=CurrentStock-1 where BookId=@BookId", dbcon.GetCon());
        else
            cmd = new SqlCommand("update tbl_BookMaster set CurrentStock=CurrentStock+1 where BookId=@BookId", dbcon.GetCon());
        
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            if(IsIssueEntryExist())
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Books Issued Successfully','success')", true);
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Books Returned Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Current Stock not Updated ...Try Again','error')", true);
        }
    }

    protected bool IsIssueEntryExist()
    {
        cmd = new SqlCommand("select * from tbl_BookIssue where BookId=@BookId and MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected bool IsBookExist()
    {
        cmd = new SqlCommand("select * from tbl_BookMaster where BookId=@BookId and CurrentStock>0", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected bool IsMemberExist()
    {
        cmd = new SqlCommand("select * from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        if (IsBookExist() && IsMemberExist())
        {
            if (IsIssueEntryExist())
            {
                if (CheckFine())
                {
                    returnBook();
                    FillGrid();
                }
                else
                {
                    Response.Redirect("BookFineEntry.aspx?bid=" + txtBookID.Text + "&mid=" + txtMemID.Text + "&day=" + Session["day"].ToString());
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','This Member does not have this Book Issued...Try Again','error')", true);
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Invalid Book ID or Member ID...Try Again','error')", true);
        }
    }

    protected void returnBook()
    {
        cmd = new SqlCommand("delete from tbl_BookIssue where MemberId=@MemberId and BookId=@BookId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            updateBookStock();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record not Updated ...Try Again','error')", true);
        }
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

    protected bool CheckFine()
    {
        int days;
        cmd = new SqlCommand("select datediff(day, Convert(Date,DueDate),Convert(Date,GetDate())) as NoOfDays from tbl_BookIssue where BookId=@BookId and MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemID.Text;
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            days = Convert.ToInt32(dt.Rows[0]["NoOfDays"].ToString());
            Session["day"] = days;
            if (days <= 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    } 
}