using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserScreen_User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"].ToString() == "" || Session["username"] == null)
        {
            Response.Redirect("../Pages/Login.aspx");
        }
        if (Session["role"] != null && Session["role"].ToString() == "User")
        {
            if (!IsPostBack)
            {
                lblUserName.Text = "Hi," + Session["fullname"].ToString();
            }
        }
        else
        {
            Response.Redirect("../Pages/SignOut.aspx");
        }
    }
}
