using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (CheckDuplicateMemberExist())
        {
            Response.Write("<script>alert('Member already exists with this ID  or Email')</script>");
        }
        else
        {
            CreateAccount();
        }
    }

    private void CreateAccount()
    {
        string QueryString = " insert into tbl_MemberMaster(MemberId, Name, DOB, ContactNo, Email, State, City, "+
                             " PinCode, Address, Password, Status) values(@MemberId, @Name, @DOB, @ContactNo, "+
                             " @Email, @State, @City, @PinCode, @Address, @Password, @Status) ";

        cmd = new SqlCommand(QueryString, dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
        cmd.Parameters.Add("Name", SqlDbType.VarChar).Value = txtFullName.Text;
        cmd.Parameters.Add("Email", SqlDbType.VarChar).Value = txtMemberID.Text;

        if (txtDOB.Text == string.Empty)
        {
            cmd.Parameters.Add("DOB", SqlDbType.DateTime).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDOB.Text);
        }

        if (txtContactNo.Text == string.Empty)
        {
            cmd.Parameters.Add("ContactNo", SqlDbType.BigInt).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("ContactNo", SqlDbType.BigInt).Value = Convert.ToInt64(txtContactNo.Text);
        }

        cmd.Parameters.Add("State", SqlDbType.VarChar).Value = ddlState.SelectedItem.Text;
        cmd.Parameters.Add("City", SqlDbType.VarChar).Value = txtCity.Text;

        if (txtPinCode.Text == string.Empty)
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = Convert.ToInt64(txtPinCode.Text);
        }

        cmd.Parameters.Add("Address", SqlDbType.VarChar).Value = txtAddress.Text;
        cmd.Parameters.Add("Password", SqlDbType.VarChar).Value = txtPassword.Text;
        cmd.Parameters.Add("Status", SqlDbType.VarChar).Value = "Pending";
        
        if (dbcon.InsertUpdateData(cmd))
        {
            //Response.Write("<script>alert('Account Created Successfully')</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Account Created Successfully','success')", true);
        }
        else
        {
            //Response.Write("<script>alert('Error! Try Again...')</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Inserted. Try Again...','error')", true);
        }

        clrcontrol();
    }

    private void clrcontrol()
    {
        txtMemberID.Text = txtMemberID.Text = txtDOB.Text = txtContactNo.Text = txtCity.Text = txtCity.Text = txtAddress.Text = txtPassword.Text="";
        ddlState.SelectedIndex = -1;
    }

    protected bool CheckDuplicateMemberExist()
    {
        string QueryString = "select * from tbl_MemberMaster where MemberId=@MemberId or Email=@Email";
        cmd = new SqlCommand(QueryString, dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
        cmd.Parameters.Add("Email", SqlDbType.VarChar).Value = txtEmail.Text;
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count >= 1)
        {
            dbcon.CloseCon();
            return true;
        }
        else
        {
            dbcon.CloseCon();
            return false;
        }
    }
}