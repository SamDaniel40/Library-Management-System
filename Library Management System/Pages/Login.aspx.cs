using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //For Member Login
        string QueryString = " select Name, MemberId, Password, Status from tbl_MemberMaster "+
                             " where MemberId=@MemberId and Password=@Password and Status='Active' ";

        cmd = new SqlCommand(QueryString, dbcon.GetCon());
        dbcon.OpenCon();
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
        cmd.Parameters.Add("Password", SqlDbType.VarChar).Value = txtPassword.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        dbcon.CloseCon();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                //Response.Write("<script> alert('Login Successfull');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Login Successfull','success')", true);
                Session["role"] = "User";
                Session["fullname"] = dr.GetValue(0).ToString();
                Session["username"] = dr.GetValue(1).ToString();
                Session["status"] = dr.GetValue(3).ToString();
                Session["mid"] = txtMemberID.Text;
            }
            Response.Redirect("../UserScreen/UserHome.aspx");
        }
        else
        {
            //Response.Write("<script> alert('Invalid Credentials...Try Again'); </script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Login Credentials...Try Again','error')", true);
        }
    }

    protected void btnAdminLogin_Click(object sender, EventArgs e)
    {
        //For Admin Login
        string QueryString = " select UserName, Password, FullName from tbl_AdminLogin " +
                             " where UserName=@UserName and Password=@Password ";

        cmd = new SqlCommand(QueryString, dbcon.GetCon());
        dbcon.OpenCon();
        cmd.Parameters.Add("UserName", SqlDbType.VarChar).Value = txtAdminID.Text;
        cmd.Parameters.Add("Password", SqlDbType.VarChar).Value = txtAdminPass.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        dbcon.CloseCon();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                //Response.Write("<script> alert('Login Successfull');</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Login Successfull','success')", true);
                Session["Adminrole"] = "Admin";
                Session["Adminfullname"] = dr.GetValue(2).ToString();
                Session["Adminusername"] = dr.GetValue(0).ToString();
                Session["mid"] = txtAdminID.Text;
            }
            Response.Redirect("../AdminScreen/AdminHome.aspx");
        }
        else
        {
            //Response.Write("<script> alert('Invalid Credentials...Try Again'); </script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Login Credentials...Try Again','error')", true);
        }
    }
}