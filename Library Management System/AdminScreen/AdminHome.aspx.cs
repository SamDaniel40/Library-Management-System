﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_AdminHome : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminrole"] != null && Session["Adminrole"].ToString() == "Admin")
        {
            if (Session["Adminusername"].ToString() == "" || Session["Adminusername"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("~/SignOut.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    GetIssueBook();
                    GetTotalBook();
                    GetTotalFine();
                }
            }
        }
        else
        {
            Response.Redirect("../Pages/SignOut.aspx");
        }
    }

    protected void GetTotalFine()
    {
        cmd = new SqlCommand("select sum(FineAmount) as tot from tbl_FineRecord", dbcon.GetCon());
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            lblamount.Text = " " + dt.Rows[0]["tot"].ToString();
        }
        else
        {
            lblamount.Text = "0";
        }
    }

    protected void GetTotalBook()
    {
        cmd = new SqlCommand("select count(*) as Totalbook from tbl_BookMaster", dbcon.GetCon());
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            lblTotalbooks.Text = dt.Rows[0]["Totalbook"].ToString();
        }
        else
        {
            lblTotalbooks.Text = "0";
        }
    }

    protected void GetIssueBook()
    {
        cmd = new SqlCommand("select count(*) as Issuebook from tbl_BookIssue", dbcon.GetCon());
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            lblIssuebook.Text = dt.Rows[0]["Issuebook"].ToString();
        }
        else
        {
            lblIssuebook.Text = "0";
        }
    }
}