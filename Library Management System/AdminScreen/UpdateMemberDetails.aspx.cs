using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_UpdateMemberDetails : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
        }
    }

    private void FillGrid()
    {
        cmd = new SqlCommand("select MemberId, Name, Convert(Varchar,DOB,103) as DOB, ContactNo, Email, State, City, PinCode, Address, Status from tbl_MemberMaster order by MemberId", dbcon.GetCon());
        rptMember.DataSource = dbcon.Load_Data(cmd);
        rptMember.DataBind();
    }

    protected void btnSearchMember_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Search_memberRecord(txtMemberID.Text);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record Not Found...Try Again','error')", true);
        }
    }

    private void Search_memberRecord(String idd)
    {
        cmd = new SqlCommand("select Name, left(Convert(Varchar,DOB,120),10) as DOB, ContactNo, Email, State, City, PinCode, Address from tbl_MemberMaster where MemberId=@MemberId ", dbcon.GetCon());
        cmd.Parameters.Add("MemberId",SqlDbType.VarChar).Value=idd;
        dbcon.OpenCon();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtMemberID.Text = idd;
                txtName.Text = dr.GetValue(0).ToString();
                txtDOB.Text = dr.GetValue(1).ToString();
                txtContactNo.Text = dr.GetValue(2).ToString();
                txtEmail.Text = dr.GetValue(3).ToString();
                ddlState.SelectedItem.Text = dr.GetValue(4).ToString();
                txtCity.Text = dr.GetValue(5).ToString();
                txtPIN.Text = dr.GetValue(6).ToString();
                txtAddress.Text = dr.GetValue(7).ToString();
                txtMemberID.Enabled = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record Not Found...Try Again','error')", true);
        }
        dbcon.CloseCon();
    }

    protected void BtnActiveMember_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            UpdateMemberStatus_ByID("Active");
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error...Try Again','error')", true);
        }
    }

    private void UpdateMemberStatus_ByID(string varStatus)
    {
        if (CheckMemberExist_OR_Not())
        {
            SqlCommand cmd = new SqlCommand("update tbl_MemberMaster set Status=@Status where MemberID=@MemberID ", dbcon.GetCon());
            cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
            cmd.Parameters.Add("Status", SqlDbType.VarChar).Value = varStatus;
            if (dbcon.InsertUpdateData(cmd))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Member Status Updated Successfully','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record not Updated...Try Again','error')", true);
            }
            FillGrid();
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Record Not Found...try again','error')", true);
        }
    }

    private bool CheckMemberExist_OR_Not()
    {
        dbcon.OpenCon();
        cmd = new SqlCommand("select * from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        dbcon.CloseCon();
        if (dt.Rows.Count >= 1)
            return true;
        else
            return false;
    }

    protected void btnPendingMember_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            UpdateMemberStatus_ByID("Pending");
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error...Try Again','error')", true);
        }
    }

    protected void btnDeActiveMember_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            UpdateMemberStatus_ByID("DeActive");

        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Validation Error...Try Again','error')", true);
        }
    }

    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView1.PageIndex = e.NewPageIndex;
    //    FillGrid();
    //}

    //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    GridView1.EditIndex = -1;
    //    FillGrid();
    //}

    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    GridView1.EditIndex = e.NewEditIndex;
    //    FillGrid();
    //}

    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");

    //    TextBox updatetxtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditName");
    //    TextBox updatetxtdob = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditdob");
    //    TextBox updatetxtcontact = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditContact");
    //    TextBox updatetxtemail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
    //    DropDownList updateddlstate = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlEditState");
    //    TextBox updatetxtcity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditcity");
    //    TextBox updatetxtpincode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditpincode");
    //    TextBox updatetxtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");

    //    cmd = new SqlCommand("update tbl_MemberMaster set MemberId=@MemberId,Name= @Name, DOB=@DOB, ContactNo@ContactNo, " +
    //                         " Email=@Email, State=@State, City=@City, PinCode=@PinCode, Address=@Address", dbcon.GetCon());
    //    cmd.Parameters.Add("Name", SqlDbType.VarChar).Value = updatetxtName.Text;
    //    cmd.Parameters.Add("DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(updatetxtdob.Text);
    //    cmd.Parameters.Add("ContactNo", SqlDbType.BigInt).Value = Convert.ToInt64(updatetxtcontact.Text);
    //    cmd.Parameters.Add("Email", SqlDbType.VarChar).Value = updatetxtemail.Text;
    //    cmd.Parameters.Add("State", SqlDbType.VarChar).Value = updateddlstate.SelectedItem.Text;
    //    cmd.Parameters.Add("City", SqlDbType.VarChar).Value = updatetxtcity.Text;
    //    cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = Convert.ToInt64(updatetxtpincode.Text);
    //    cmd.Parameters.Add("Address", SqlDbType.VarChar).Value = updatetxtAddress.Text;

    //    cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = mid;
    //    dbcon.InsertUpdateData(cmd);
    //    GridView1.EditIndex = -1;
    //    FillGrid();
    //}

    //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
    //    cmd = new SqlCommand("delete from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
    //    cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = mid;
    //    dbcon.InsertUpdateData(cmd);
    //    FillGrid();
    //}

    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
    //    {
    //        DropDownList ddlEditState_value = (DropDownList)e.Row.FindControl("ddlEditState");
    //        Label lblstat = (Label)e.Row.FindControl("lblEditState");
    //        ddlEditState_value.SelectedValue = lblstat.Text;
    //    }
    //}

    //protected void GridView1_DataBound(object sender, EventArgs e)
    //{
    //    for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
    //    {
    //        Label lblparent = (Label)GridView1.Rows[i].Cells[9].Controls[0]; ;
    //        if (lblparent.Text == "Active")
    //        {
    //            GridView1.Rows[i].Cells[9].BackColor = Color.Green;
    //            lblparent.ForeColor = Color.Black;
    //        }
    //        else if (lblparent.Text == "Pending")
    //        {
    //            GridView1.Rows[i].Cells[9].BackColor = Color.Yellow;
    //            lblparent.ForeColor = Color.Black;
    //        }
    //        else if (lblparent.Text == "DeActive")
    //        {
    //            GridView1.Rows[i].Cells[9].BackColor = Color.DarkRed;
    //            lblparent.ForeColor = Color.White;
    //        }
    //    }
    //}

    protected void rptMember_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            Search_memberRecord(id);
        }
        if (e.CommandName == "delete")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            cmd = new SqlCommand("delete from tbl_MemberMaster where MemberId=@MemberId", dbcon.GetCon());
            cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = id;
            if (dbcon.InsertUpdateData(cmd))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Deleted Successfully','success')", true);
                clrcontrol();
                Bindrecord();
                btnUpdate.Visible = false;
                btnCancel.Visible = false;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Deleted ...Try Again','error')", true);
            }
        }
    }

    protected void Bindrecord()
    {
        cmd = new SqlCommand("select MemberId, Name, Convert(Varchar,DOB,103) as DOB, ContactNo, Email, State, City, PinCode, Address, Status from tbl_MemberMaster order by MemberId", dbcon.GetCon());
        DataTable dt = new DataTable();
        dbcon.OpenCon();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        dbcon.CloseCon();
        rptMember.DataSource = dt;
        rptMember.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update tbl_MemberMaster set Name=@Name, DOB=@DOB, ContactNo=@ContactNo, " +
                             " Email=@Email, State=@State, City=@City, PinCode=@PinCode, Address=@Address where MemberId=@MemberId", dbcon.GetCon());

        cmd.Parameters.Add("Name", SqlDbType.VarChar).Value = txtName.Text;

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

        cmd.Parameters.Add("Email", SqlDbType.VarChar).Value = txtEmail.Text;
        cmd.Parameters.Add("State", SqlDbType.VarChar).Value = ddlState.SelectedItem.Text;
        cmd.Parameters.Add("City", SqlDbType.VarChar).Value = txtCity.Text;

        if (txtPIN.Text == string.Empty)
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("PinCode", SqlDbType.BigInt).Value = Convert.ToInt64(txtPIN.Text);
        }

        cmd.Parameters.Add("Address", SqlDbType.VarChar).Value = txtAddress.Text;
        cmd.Parameters.Add("MemberId", SqlDbType.VarChar).Value = txtMemberID.Text;
        if (dbcon.InsertUpdateData(cmd))
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Record Updated Successfully','success')", true);
            clrcontrol();
            Bindrecord();
            txtMemberID.Enabled = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Updated...Try Again','error')", true);
        }
    }

    protected void clrcontrol()
    {
        txtName.Text= txtDOB.Text= txtContactNo.Text=txtEmail.Text= txtCity.Text= txtPIN.Text=txtAddress.Text= txtMemberID.Text = String.Empty;
        ddlState.SelectedValue = "Select";
        txtMemberID.Focus();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateMemberDetails.aspx");
    }

    protected void rptMember_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    TableCell cell = (TableCell)e.Item.FindControl("lblstatus");
        //    if (cell.Text == "Active")
        //    {
        //        cell.BackColor = Color.Green;
        //        cell.ForeColor = Color.Black;
        //    }
        //    else if (cell.Text == "Pending")
        //    {
        //        cell.BackColor = Color.Yellow;
        //        cell.ForeColor = Color.Black;
        //    }
        //    else if (cell.Text == "DeActive")
        //    {
        //        cell.BackColor = Color.DarkRed;
        //        cell.ForeColor = Color.White;
        //    }
        //}
    }
}