﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("../default.aspx");
    }
}