using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_AddAuthor : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindRepeater();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert  into tbl_AuthorMaster(AuthorId, AuthorName) values(@AuthorId, @AuthorName)", dbcon.GetCon());
        cmd.Parameters.Add("AuthorId", SqlDbType.VarChar).Value=txtID.Text;
        cmd.Parameters.Add("AuthorName", SqlDbType.VarChar).Value = txtAuthorName.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Saved Successfully','success')", true);
            clrcontrol();
            BindRepeater();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Inserted...Try Again','error')", true);
        }
    }

    private void BindRepeater()
    {
        cmd = new SqlCommand("select AuthorId, AuthorName from tbl_AuthorMaster", dbcon.GetCon());
        DataTable dt = new DataTable();
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        dbcon.CloseCon();
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }

    private void clrcontrol()
    {
        txtID.Text = txtAuthorName.Text = "";
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            SearchDataforUpdate(id);
        }
        else if (e.CommandName == "delete")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            cmd = new SqlCommand("delete from tbl_AuthorMaster where AuthorId=@AuthorId", dbcon.GetCon());
            cmd.Parameters.Add("AuthorId", SqlDbType.VarChar).Value = id;
            if (dbcon.InsertUpdateData(cmd))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Deleted Successfully','success')", true);
                clrcontrol();
                BindRepeater();
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
                btnCancel.Visible = false;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Deleted ...Try Again','error')", true);
            }

        }
    }

    private void SearchDataforUpdate(string idd)
    {
        cmd = new SqlCommand("select AuthorId, AuthorName from tbl_AuthorMaster where AuthorId=@AuthorId", dbcon.GetCon());
        cmd.Parameters.Add("AuthorId",SqlDbType.VarChar).Value=idd;
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dbcon.CloseCon();
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["AuthorID"] = ds.Tables[0].Rows[0]["AuthorId"].ToString();
            txtID.Text = ds.Tables[0].Rows[0]["AuthorId"].ToString();
            txtAuthorName.Text = ds.Tables[0].Rows[0]["AuthorName"].ToString();
            txtID.Enabled = false;
            btnAdd.Visible = false;
            btnUpdate.Visible = true;
            btnCancel.Visible = true;
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! No Record Found. Try Again...','error')", true);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update tbl_AuthorMaster set AuthorName=@AuthorName where AuthorId=@AuthorId", dbcon.GetCon());
        cmd.Parameters.Add("AuthorId", SqlDbType.VarChar).Value = txtID.Text;
        cmd.Parameters.Add("AuthorName", SqlDbType.VarChar).Value = txtAuthorName.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Updated Successfully','success')", true);
            clrcontrol();
            BindRepeater();
            txtID.Enabled = true;
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
        else
        {
            dbcon.CloseCon();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Updated...Try Again','error')", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAuthor.aspx");
    }
}