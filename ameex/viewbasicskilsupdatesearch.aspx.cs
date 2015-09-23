using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.IO;



public partial class basicskilsupdate : System.Web.UI.Page
{
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    string str;
    public  List<int> emp_skill_list = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            string id = null;
           
            if (Session["eid"] != null)
            {
              
                id = Session["eid"].ToString();

              //  ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + id + "')</script>");
            }

            Session["eid"] = id;
        
            string query1 = "select skillid,skillname from skillstab where skilltype='basicskill'";
            string query2 = "select skillid,filename from emploskills where eid='" + id + "' ";
            
            var result = GetData(sqlConnection, query1);
            var userresult = GetData(sqlConnection, query2);
                 string filename =null;
            if (userresult != null ? userresult.Rows.Count > 0 : false)
            {
                foreach (DataRow dr in userresult.Rows)
                {
                    int skillid = (int)(dr["skillid"] != null ? dr["skillid"] : 0);
                    if (String.IsNullOrEmpty(filename))
                    {
                        filename = dr["filename"] != null ? dr["filename"].ToString() : string.Empty;
                    }
                    emp_skill_list.Add(skillid);

                }
            }
            if (result != null ? result.Rows.Count > 0 : false)
            {
                CheckBoxList1.Items.Clear();
                foreach (DataRow dr in result.Rows)
                {
                    int skillid = (int)(dr["skillid"] != null ? dr["skillid"] : 0);
                    string lName = dr["skillname"] != null ? dr["skillname"].ToString() : string.Empty;
                    var item = new ListItem();
                    if (emp_skill_list.Contains(skillid))
                    {
                        item.Selected = true;
                    }
                    item.Text = lName.ToString(); 
                    item.Value = skillid.ToString();
                    CheckBoxList1.Items.Add(item);
                }
                Label6.Text = filename;
            }
        }
    }
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
        string query2 = "select skillid from emploskills where eid='" + str + "' ";
        var userresult = GetData(sqlConnection, query2);
        if (userresult != null ? userresult.Rows.Count > 0 : false)
        {
            foreach (DataRow dr in userresult.Rows)
            {
                int skillid = (int)(dr["skillid"] != null ? dr["skillid"] : 0);
                emp_skill_list.Add(skillid);

            }
        }
        foreach (ListItem skill in CheckBoxList1.Items)
        {

            if (skill.Selected)
            {
                list.Add(skill.Value);
                SqlCommand myCommand1 = new SqlCommand("select skillid from skillstab where skillname='" + skill.Value + "'", con);
                SqlDataReader myReader1 = myCommand1.ExecuteReader();
                int skillid = 0;
                if (myReader1.Read())
                {
                    skillid = (int)(myReader1["skillid"]);
                }
                myReader1.Close();
                if (!emp_skill_list.Contains(skillid))
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("Insert into emploskills (eid,skillid)values (@eid,@skillid)", con);
                        cmd.Parameters.AddWithValue("@skillid", skillid);
                        cmd.Parameters.Add("@eid", SqlDbType.NChar).Value = (str);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ee)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('updated successfully')</script>");
                    }
                    }
            }

        }

        con.Close();
        Button2call(str);
    }


    protected void Button2call(string str)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        conn.Open();
        if (!string.IsNullOrEmpty(TextBox1.Text))
        {
            if (string.Equals(TextBox1.Text, "Kentico", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Sitecore", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Sharepoint", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "Ektron", StringComparison.CurrentCultureIgnoreCase) || string.Equals(TextBox1.Text, "EPI Server", StringComparison.CurrentCultureIgnoreCase))
            {
                SqlCommand cmd = new SqlCommand("Insert into skillstab(skillname,type) values (@skillname,@skilltype)", conn);
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
                SqlCommand cmd = new SqlCommand("update  emploskills set filename=@filename, Contenttype=@Contenttype, data=@data  where eid=@eid and skillid=@skillid", conn);
                cmd.Parameters.Add("@eid", SqlDbType.NChar).Value = (str);
                cmd.Parameters.Add("@filename", SqlDbType.VarChar).Value = filename;
                cmd.Parameters.Add("@Contenttype", SqlDbType.VarChar).Value = contenttype;
                cmd.Parameters.AddWithValue("@skillid", str1);
                cmd.Parameters.Add("@data", SqlDbType.Binary).Value = bytes;
                cmd.ExecuteNonQuery();
                conn.Close();
                InsertUpdateData(cmd);
            }
            catch (Exception exception)
            { 
            }
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Updated')</script>");
        }

        else if (!string.IsNullOrEmpty(contenttype))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('File format not recognised." + " Upload Image/Word/PDF/Excel formats')</script>");
          //  Label6.Text = "File format not recognised." + " Upload Image/Word/PDF/Excel formats";

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

    #region SQLHelper
    public static DataTable GetData(string ConnectionString, string query)
    {
        //Enter the connection string.       
        SqlConnection connection = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        adapter.SelectCommand.CommandText = query; //enter the sql select command string.
        DataTable datatable = new DataTable();
        adapter.Fill(datatable);
        return datatable;
    }
    #endregion
}
