using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_ViewBooks : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindRepeater();
            FillGrid();
        }
    }

    //protected void BindRepeater()
    //{
    //    cmd = new SqlCommand("select BookId, BookName, Genre, AuthorName, PublisherName, PublisherDate, Language, Edition, BookCost, NoOfPages, BookDescription, ActualStock, CurrentStock, BookImg from tbl_BookMaster", dbcon.GetCon());
    //    Repeater1.DataSource = dbcon.Load_Data(cmd);
    //    Repeater1.DataBind();
    //}

    protected void FillGrid()
    {
        cmd = new SqlCommand("select BookId, BookName, Genre, (select AuthorName from tbl_AuthorMaster where AuthorId=BM.AuthorId) as AuthorName, (select PublisherName from tbl_PublisherMaster where PublisherId=BM.PublisherId) as PublisherName, Convert(Varchar,PublishDate,103) as PublishDate, Language, Edition, BookCost, NoOfPages, BookDescription, ActualStock, CurrentStock, BookImg from tbl_BookMaster BM", dbcon.GetCon());
        GridView1.DataSource = dbcon.Load_Data(cmd);
        GridView1.DataBind();
    }

}