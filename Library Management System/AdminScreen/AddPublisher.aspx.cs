using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_AddPublisher : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindrecord();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            insertpublisher();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error! Please enter Valid Data ...Try Again','error')", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddPublisher.aspx");
    }

    protected void Bindrecord()
    {
        cmd = new SqlCommand("select PublisherId, PublisherName from tbl_PublisherMaster", dbcon.GetCon());
        DataTable dt = new DataTable();
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        dbcon.CloseCon();
        rptPublisher.DataSource = dt;
        rptPublisher.DataBind();
    }

    protected void insertpublisher()
    {
        cmd = new SqlCommand("insert  into tbl_PublisherMaster(PublisherId, PublisherName) values(@PublisherId, @PublisherName)", dbcon.GetCon());
        cmd.Parameters.Add("PublisherId", SqlDbType.VarChar).Value = txtpublisherID.Text;
        cmd.Parameters.Add("PublisherName", SqlDbType.VarChar).Value = txtpublisherName.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Saved Successfully','success')", true);
            clrcontrol();
            Bindrecord();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Inserted ...Try Again','error')", true);
        }
    }

    protected void clrcontrol()
    {
        txtpublisherName.Text = txtpublisherID.Text = String.Empty;
        txtpublisherID.Focus();
    }

    protected void SearchRecordBy_ID(string idd)
    {
        cmd = new SqlCommand("select PublisherId, PublisherName from tbl_PublisherMaster where PublisherId=@PublisherId", dbcon.GetCon());
        cmd.Parameters.Add("PublisherId", SqlDbType.VarChar).Value = idd;
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        da.Fill(ds, "dt");
        dbcon.CloseCon();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtpublisherID.Text = ds.Tables[0].Rows[0]["PublisherId"].ToString();
            txtpublisherName.Text = ds.Tables[0].Rows[0]["PublisherName"].ToString();
            btnAdd.Visible = false;
            txtpublisherID.Enabled = false;
            btnUpdate.Visible = true;
            btnCancel.Visible = true;
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! No Record Found. Try Again...','error')", true);
        }
    }

    protected void rptPublisher_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            SearchRecordBy_ID(id);
        }
        if (e.CommandName == "delete")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            cmd = new SqlCommand("delete from tbl_PublisherMaster where PublisherId=@PublisherId", dbcon.GetCon());
            cmd.Parameters.Add("PublisherId",SqlDbType.VarChar).Value=id;
            if (dbcon.InsertUpdateData(cmd))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Deleted Successfully','success')", true);
                clrcontrol();
                Bindrecord();
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update tbl_PublisherMaster set PublisherName=@PublisherName where PublisherId=@PublisherId", dbcon.GetCon());
        cmd.Parameters.Add("PublisherId", SqlDbType.VarChar).Value = txtpublisherID.Text;
        cmd.Parameters.Add("PublisherName", SqlDbType.VarChar).Value = txtpublisherName.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Updated Successfully','success')", true);
            clrcontrol();
            Bindrecord();
            txtpublisherID.Enabled = true;
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Updated...Try Again','error')", true);
        }
    }
}