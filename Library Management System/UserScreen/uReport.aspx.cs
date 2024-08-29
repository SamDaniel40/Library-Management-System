using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserScreen_uReport : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == "" || Session["username"] == null)
        {
            Response.Redirect("~/Pages/SignOut.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
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