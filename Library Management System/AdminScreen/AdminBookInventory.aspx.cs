using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminScreen_AdminBookInventory : System.Web.UI.Page
{
    DBConnect dbcon = new DBConnect();
    SqlCommand cmd;
    static int actualstock, currstock, issuedstock;
    static string filepath;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAuthorPublisher();
            FillGridBooks();
        }
    }

    private void FillGridBooks()
    {
        cmd = new SqlCommand("select BookId, BookName, Genre, (select AuthorName from tbl_AuthorMaster where AuthorId=BM.AuthorId) as AuthorName, "+
                             "(select PublisherName from tbl_PublisherMaster where PublisherId=BM.PublisherId) as PublisherName, "+
                             "Convert(Varchar,PublishDate,103) as PublishDate, Language, Edition, BookCost, NoOfPages, BookDescription, ActualStock, CurrentStock, " +
                             "BookImg from tbl_BookMaster BM", dbcon.GetCon());
        GridView1.DataSource = dbcon.Load_Data(cmd);
        GridView1.DataBind();
    }

    private void BindAuthorPublisher()
    {
        cmd = new SqlCommand("select AuthorId, AuthorName from tbl_AuthorMaster", dbcon.GetCon());
        ddlAuthor.Items.Clear();
        ddlAuthor.DataSource = dbcon.Load_Data(cmd);
        ddlAuthor.DataValueField = "AuthorId";
        ddlAuthor.DataTextField = "AuthorName";
        ddlAuthor.DataBind();
        ddlAuthor.Items.Insert(0, new ListItem("-- Select --","0"));

        cmd = new SqlCommand("select PublisherId, PublisherName from tbl_PublisherMaster", dbcon.GetCon());
        ddlPublisherName.DataSource = dbcon.Load_Data(cmd);
        ddlPublisherName.DataValueField = "PublisherId";
        ddlPublisherName.DataTextField = "PublisherName";
        ddlPublisherName.DataBind();
        ddlPublisherName.Items.Insert(0, new ListItem("--Select--","0"));
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        if (checkDuplicateBook())
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Book Already Exists ...Try Some Other Book ID','error')", true);
        }
        else
        {
            AddBooks();
            FillGridBooks(); ;
        }
    }

    private void AddBooks()
    {
        string genres = "", filePath = "";

        if (ListBoxGenre.GetSelectedIndices().Length > 0)
        {
            foreach (int i in ListBoxGenre.GetSelectedIndices())
            {
                genres = genres + ListBoxGenre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1);
        }

        if (FileUpload1.HasFiles == true)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string folderPath = Server.MapPath("../BookImg/");

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            filePath = Path.Combine(folderPath, filename);
        }

        cmd = new SqlCommand("insert into tbl_BookMaster(BookId, BookName, Genre, AuthorId, PublisherId, " +
                             "PublishDate, Language, Edition, BookCost, NoOfPages, BookDescription, ActualStock, "+
                             "CurrentStock, BookImg) values(@BookId, @BookName, @Genre, @AuthorId, " +
                             "@PublisherId, @PublishDate, @Language, @Edition, @BookCost, @NoOfPages, " +
                             "@BookDescription, @ActualStock, @CurrentStock, @BookImg) ", dbcon.GetCon());

        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        cmd.Parameters.Add("BookName", SqlDbType.VarChar).Value = txtBookName.Text;
        cmd.Parameters.Add("Genre", SqlDbType.VarChar).Value = genres;
        cmd.Parameters.Add("AuthorId", SqlDbType.VarChar).Value = ddlAuthor.SelectedValue;
        cmd.Parameters.Add("PublisherId", SqlDbType.VarChar).Value = ddlPublisherName.SelectedValue;

        if (txtPublishDate.Text == String.Empty)
        {
            cmd.Parameters.Add("PublishDate", SqlDbType.DateTime).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("PublishDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtPublishDate.Text);
        }

        cmd.Parameters.Add("Language", SqlDbType.VarChar).Value = ddlLanguage.SelectedItem.Text;

        if (txtEdition.Text == String.Empty)
        {
            cmd.Parameters.Add("Edition", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("Edition", SqlDbType.Int).Value = Convert.ToInt32(txtEdition.Text);
        }

        if (txtbookCost.Text == String.Empty)
        {
            cmd.Parameters.Add("BookCost", SqlDbType.Decimal).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("BookCost", SqlDbType.Decimal).Value = Convert.ToDecimal(txtbookCost.Text);
        }

        if (txtPages.Text == String.Empty)
        {
            cmd.Parameters.Add("NoOfPages", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("NoOfPages", SqlDbType.Int).Value = Convert.ToInt32(txtPages.Text);
        }

        cmd.Parameters.Add("BookDescription", SqlDbType.VarChar).Value = txtBookDesc.Text;

        if (txtActualStock.Text == String.Empty)
        {
            cmd.Parameters.Add("ActualStock", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("ActualStock", SqlDbType.Int).Value = txtActualStock.Text;
        }

        if (txtCurrentStock.Text == String.Empty)
        {
            cmd.Parameters.Add("CurrentStock", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("CurrentStock", SqlDbType.Int).Value = txtCurrentStock.Text;
        }

        cmd.Parameters.Add("BookImg", SqlDbType.VarChar).Value = filePath;

        if (dbcon.InsertUpdateData(cmd))
        {
            if (FileUpload1.HasFiles == true)
                FileUpload1.SaveAs(filePath);
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Book Added Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Inserted ...Try Again','error')", true);
        }

        clrControl();
    }

    private void clrControl()
    {
        txtBookID.Text = txtBookName.Text = txtActualStock.Text = txtbookCost.Text = txtBookDesc.Text = txtCurrentStock.Text = txtEdition.Text = txtIssuedBooks.Text = txtPages.Text = txtPublishDate.Text = "";
        ddlAuthor.SelectedIndex = -1;
        ddlPublisherName.SelectedIndex = -1;
        ListBoxGenre.ClearSelection();
        FileUpload1.PostedFile.InputStream.Dispose();
        ImgPhoto.ImageUrl = "../Imgs/default.png";
    }

    private bool checkDuplicateBook()
    {
        cmd = new SqlCommand("select * from tbl_BookMaster where BookId=@BookId", dbcon.GetCon());
        cmd.Parameters.Add("BookId",SqlDbType.VarChar).Value=txtBookID.Text;
        DataTable dt = new DataTable();
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (checkDuplicateBook())
            UpdateBooks();
        else
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Book ID...Try Again ','error')", true);
    }

    private void UpdateBooks()
    {
        string genres = "", F_path = "";

        int A_stock = Convert.ToInt32(txtActualStock.Text);
        int C_stock = Convert.ToInt32(txtCurrentStock.Text);
        if (actualstock == A_stock)
        {

        }
        else
        {
            if (A_stock < actualstock)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Actual Stock Value cannot be less than the Issued Books','error')", true);
                return;
            }
            else
            {
                currstock = actualstock - issuedstock;
                txtCurrentStock.Text = C_stock + "";
            }
        }

        if (ListBoxGenre.GetSelectedIndices().Length > 0)
        {
            foreach (int i in ListBoxGenre.GetSelectedIndices())
            {
                genres = genres + ListBoxGenre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1);
        }
        
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        if (filename != "" || filename != null)
        {
            F_path = "../BookImg/" + filename;
        }

        cmd = new SqlCommand("update tbl_BookMaster set BookName=@BookName, Genre=@Genre, AuthorId=@AuthorId, PublisherId=@PublisherId, " +
                             "PublishDate=@PublishDate, Language=@Language, Edition=@Edition, BookCost=@BookCost, NoOfPages=@NoOfPages, " +
                             "BookDescription=@BookDescription, ActualStock=@ActualStock, CurrentStock=@CurrentStock, BookImg=@BookImg "+
                             "where BookId=@BookId", dbcon.GetCon());

        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        cmd.Parameters.Add("BookName", SqlDbType.VarChar).Value = txtBookName.Text;
        cmd.Parameters.Add("Genre", SqlDbType.VarChar).Value = genres;
        cmd.Parameters.Add("AuthorId", SqlDbType.VarChar).Value = ddlAuthor.SelectedValue;
        cmd.Parameters.Add("PublisherId", SqlDbType.VarChar).Value = ddlPublisherName.SelectedValue;

        if (txtPublishDate.Text == String.Empty)
        {
            cmd.Parameters.Add("PublishDate", SqlDbType.DateTime).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("PublishDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtPublishDate.Text);
        }

        cmd.Parameters.Add("Language", SqlDbType.VarChar).Value = ddlLanguage.SelectedItem.Text;

        if (txtEdition.Text == String.Empty)
        {
            cmd.Parameters.Add("Edition", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("Edition", SqlDbType.Int).Value = Convert.ToInt32(txtEdition.Text);
        }

        if (txtbookCost.Text == String.Empty)
        {
            cmd.Parameters.Add("BookCost", SqlDbType.Decimal).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("BookCost", SqlDbType.Decimal).Value = Convert.ToDecimal(txtbookCost.Text);
        }

        if (txtPages.Text == String.Empty)
        {
            cmd.Parameters.Add("NoOfPages", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("NoOfPages", SqlDbType.Int).Value = Convert.ToInt32(txtPages.Text);
        }

        cmd.Parameters.Add("BookDescription", SqlDbType.VarChar).Value = txtBookDesc.Text;

        if (txtActualStock.Text == String.Empty)
        {
            cmd.Parameters.Add("ActualStock", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("ActualStock", SqlDbType.Int).Value = txtActualStock.Text;
        }

        if (txtCurrentStock.Text == String.Empty)
        {
            cmd.Parameters.Add("CurrentStock", SqlDbType.Int).Value = DBNull.Value;
        }
        else
        {
            cmd.Parameters.Add("CurrentStock", SqlDbType.Int).Value = txtCurrentStock.Text;
        }
        
        cmd.Parameters.Add("BookImg", SqlDbType.VarChar).Value = F_path;
        
        if (dbcon.InsertUpdateData(cmd))
        {
            if (filename != "" || filename != null)
                FileUpload1.SaveAs(Server.MapPath("../BookImg/" + filename));
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Books Updated Successfully','success')", true);
        }
        else
        { 
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! record not Updated ...try again','error')", true);
        }

        clrControl();
        FillGridBooks();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (checkDuplicateBook())
            DeleteBooks();
        else
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Book ID...Try Again ','error')", true);
    }

    private void DeleteBooks()
    {
        //cmd = new SqlCommand("select BookImg from tbl_BookMaster where BookId=@BookId", dbcon.GetCon());
        //cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        //DataTable dt = new DataTable();
        //dt = dbcon.Load_Data(cmd);
        //if (dt.Rows[0]["BookImg"].ToString() != String.Empty)
        //{
        //    File.Delete(dt.Rows[0]["BookImg"].ToString());
        //}

        cmd = new SqlCommand("delete from tbl_BookMaster where BookId=@BookId and CurrentStock=ActualStock", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        dbcon.OpenCon();
        if (cmd.ExecuteNonQuery()>0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success','Book Deleted Successfully','success')", true);
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Record Not Deleted, Book is Still Issued ...Try Again','error')", true);
        }

        dbcon.CloseCon();
        clrControl();
        FillGridBooks();
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        SearchBooks();
    }

    private void SearchBooks()
    {
        cmd = new SqlCommand("select BookName, PublishDate, Edition, BookCost, NoOfPages, ActualStock, CurrentStock, BookDescription, "+
                             "Language, PublisherId, AuthorId, Genre, BookImg from tbl_BookMaster where BookId=@BookId", dbcon.GetCon());
        cmd.Parameters.Add("BookId", SqlDbType.VarChar).Value = txtBookID.Text;
        DataTable dt = new DataTable();
        dt = dbcon.Load_Data(cmd);
        if (dt.Rows.Count >= 1)
        {
            txtBookName.Text = dt.Rows[0]["BookName"].ToString();
            txtPublishDate.Text = dt.Rows[0]["PublishDate"].ToString();
            txtEdition.Text = dt.Rows[0]["Edition"].ToString();
            txtbookCost.Text = dt.Rows[0]["BookCost"].ToString();
            txtPages.Text = dt.Rows[0]["NoOfPages"].ToString();
            txtActualStock.Text = dt.Rows[0]["ActualStock"].ToString();
            txtCurrentStock.Text = dt.Rows[0]["CurrentStock"].ToString();
            txtBookDesc.Text = dt.Rows[0]["BookDescription"].ToString();
            txtIssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["ActualStock"].ToString()) - Convert.ToInt32(dt.Rows[0]["CurrentStock"].ToString()));

            ddlLanguage.SelectedValue = dt.Rows[0]["Language"].ToString();
            ddlPublisherName.SelectedValue = dt.Rows[0]["PublisherId"].ToString();
            ddlAuthor.SelectedValue = dt.Rows[0]["AuthorId"].ToString();

            ListBoxGenre.ClearSelection();

            string[] genre = dt.Rows[0]["Genre"].ToString().Split(',');
            for (int i = 0; i < genre.Length; i++)
            {
                for (int j = 0; j < ListBoxGenre.Items.Count; j++)
                {
                    if (ListBoxGenre.Items[j].ToString() == genre[i])
                    {
                        ListBoxGenre.Items[j].Selected = true;

                    }
                }
            }
            actualstock = Convert.ToInt32(dt.Rows[0]["ActualStock"].ToString());
            currstock = Convert.ToInt32(dt.Rows[0]["CurrentStock"].ToString());
            issuedstock = actualstock - currstock;
            filepath = dt.Rows[0]["BookImg"].ToString();
            if (filepath != "" || filepath != null)
            {
                ImgPhoto.ImageUrl = filepath;
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error','Error! Invalid Book ID...Try Again ','error')", true);
            clrControl();
        }
    }

    protected void txtActualStock_TextChanged(object sender, EventArgs e)
    {
        if (txtCurrentStock.Text == String.Empty)
        {
            txtCurrentStock.Text = txtActualStock.Text;
        }
        else
        {
            if (Convert.ToInt32(txtCurrentStock.Text)+Convert.ToInt32(txtIssuedBooks.Text)!=Convert.ToInt32(txtActualStock.Text))
            {
                txtCurrentStock.Text = "" + (Convert.ToInt32(txtCurrentStock.Text) + (Convert.ToInt32(txtActualStock.Text) - (Convert.ToInt32(txtCurrentStock.Text) + Convert.ToInt32(txtIssuedBooks.Text))));
            }
        }
    }
}