using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_Fine : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminusername"].ToString() == "" || Session["Adminusername"] == null)
        {
            Response.Redirect("../Pages/SignOut.aspx");

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
        cmd = new SqlCommand("select t1.MemberId, t1.Name, t1.BookId, t2.BookName, t1.FineAmount, Convert(Varchar,t1.FinePayDate,103) as FinePayDate, t1.FineStatus from tbl_FineRecord t1 inner join tbl_BookMaster t2 on t1.BookId=t2.BookId", dbcon.GetCon());
        GridView1.DataSource = dbcon.Load_Data(cmd);
        GridView1.DataBind();
    }
}