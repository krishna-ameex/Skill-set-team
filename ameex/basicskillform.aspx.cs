using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.IO;
public partial class basicskillform : System.Web.UI.Page
{
    /// <summary>
    /// Loading  the Existing basic skills
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
            con.Open();
            SqlCommand mycomma = new SqlCommand("select skillname from skillstab where skilltype='basicskill'", con);
         
            SqlDataReader reader = null;

            reader = mycomma.ExecuteReader();
            
            CheckBoxList1.Items.Clear();
            while (reader.Read())
            {
                
                var item = new ListItem();
                item.Text = reader["skillname"].ToString();
                item.Value = reader["skillname"].ToString();
               
                CheckBoxList1.Items.Add(item);
            }
            reader.Close();
            con.Close();
        }

    }
    /// <summary>
    /// inserting the user basic skills
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
           
        }
        
        List<Object> list = new List<Object>();
        
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();

        SqlCommand myCommand = new SqlCommand("select eid from regi where mail='" + val + "'", con);
        SqlDataReader myReader = myCommand.ExecuteReader();
        string str = null;
        if (myReader.Read())
        {
            str = myReader["eid"].ToString();         
        }
        myReader.Close();
      foreach (ListItem skill in CheckBoxList1.Items)
        {

            if (skill.Selected)
            {
                list.Add(skill.Value);
                SqlCommand myCommand1 = new SqlCommand("select skillid from skillstab where skillname='" + skill.Value + "'", con);
                SqlDataReader myReader1 = myCommand1.ExecuteReader();
                int str1 = 0;
                if (myReader1.Read())
                {
                    str1 = (int)(myReader1["skillid"]);
                }
                myReader1.Close();
                try
                {
                    SqlCommand cmd = new SqlCommand("Insert into emploskills (eid,skillid)values (@eid,@skillid)", con);
                    cmd.Parameters.AddWithValue("@skillid", str1);
                    cmd.Parameters.Add("@eid", SqlDbType.NChar).Value = (str);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception excep)
                { 
                }
            }

         }
               
        con.Close();
        ResumeUpload(str,list);
    }
    /// <summary>
    /// upload the resume 
    /// </summary>
    /// <param name="str"></param>
    /// <param name="list"></param>

       protected void ResumeUpload(string str, List<Object> list)
         {
             SqlConnection conn = new SqlConnection();
             conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
             conn.Open();
             if (!list.Contains(TextBox1.Text) && !string.IsNullOrEmpty(TextBox1.Text))
             {
                 if (string.Equals(TextBox1.Text, "Kentico", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Sitecore", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Sharepoint", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Ektron", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "EPIServer", StringComparison.CurrentCultureIgnoreCase))
                 {
                     SqlCommand cmd = new SqlCommand("Insert into skillstab(skillname,skilltype) values (@skillname,@skilltype)", conn);
                     cmd.Parameters.AddWithValue("@skillname", TextBox1.Text);
                     cmd.Parameters.AddWithValue("@skilltype", "keyskill");
                     cmd.ExecuteNonQuery();
                 }
                 else
                 {
                     SqlCommand cmd = new SqlCommand("Insert into skillstab(skillname,skilltype) values (@skillname,@skilltype)", conn);
                     cmd.Parameters.AddWithValue("@skillname", TextBox1.Text);
                     cmd.Parameters.AddWithValue("@skilltype", "basicskill");
                     cmd.ExecuteNonQuery();

                 }
             }
             SqlCommand myCommand1 = new SqlCommand("select skillid from skillstab where skillname='" + TextBox1.Text + "'", conn);
             SqlDataReader myReader1 = myCommand1.ExecuteReader();
             int str1 = 0;
             if (myReader1.Read())
             {
                 str1 = (int)(myReader1["skillid"]);
             }
             myReader1.Close();

             string filePath = FileUpload1.PostedFile.FileName;

             string filename = Path.GetFileName(filePath);

             string ext = Path.GetExtension(filename);

             string contenttype = String.Empty;



             //Set the contenttype based on File Extension

             switch (ext)
             {

                 case ".doc":

                     contenttype = "application/vnd.ms-word";

                     break;

                 case ".docx":

                     contenttype = "application/vnd.ms-word";

                     break;

                 case ".xls":

                     contenttype = "application/vnd.ms-excel";

                     break;

                 case ".xlsx":

                     contenttype = "application/vnd.ms-excel";

                     break;

                 case ".jpg":

                     contenttype = "image/jpg";

                     break;

                 case ".png":

                     contenttype = "image/png";

                     break;

                 case ".gif":

                     contenttype = "image/gif";

                     break;

                 case ".pdf":

                     contenttype = "application/pdf";

                     break;

             }

             if (contenttype != String.Empty)
             {



                 Stream fs = FileUpload1.PostedFile.InputStream;

                 BinaryReader br = new BinaryReader(fs);

                 Byte[] bytes = br.ReadBytes((Int32)fs.Length);


                 try
                 {
                     SqlCommand cmd = new SqlCommand("Insert into emploskills (eid,skillid,filename, Contenttype, data)values (@eid,@skillid,@filename, @Contenttype, @data)", conn);
                     cmd.Parameters.Add("@eid", SqlDbType.NChar).Value = (str);
                     cmd.Parameters.Add("@filename", SqlDbType.VarChar).Value = filename;
                     cmd.Parameters.Add("@Contenttype", SqlDbType.VarChar).Value = contenttype;
                     cmd.Parameters.AddWithValue("@skillid", str1);
                     cmd.Parameters.Add("@data", SqlDbType.Binary).Value = bytes;
                     cmd.ExecuteNonQuery();
                     conn.Close();
                     InsertUpdateData(cmd);
                 }
                 catch (Exception e)
                 {
                     ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('your trying to update the same value')</script>");
                  }
                 ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Basic Skills Added')</script>");
                 }

             else
             {

               

                 Label6.Text = "File format not recognised." + " Upload Image/Word/PDF/Excel formats";

             }
         }
         private Boolean InsertUpdateData(SqlCommand cmd)
         {         
             SqlConnection con = new SqlConnection();
             con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
             cmd.CommandType = CommandType.Text;

             cmd.Connection = con;

             try
             {

                 con.Open();

                 cmd.ExecuteNonQuery();

                 return true;

             }

             catch (Exception ex)
             {

                 Response.Write(ex.Message);

                 return false;

             }

             finally
             {

                 con.Close();

                 con.Dispose();

             }
         }
         protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
         {
             Response.Redirect("~/resourcemenu.aspx");
         }
}