using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class newtechnology : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminmenu.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        List<string> emp_skill_list = new List<string>();
        SqlConnection con = new SqlConnection();
        string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.ConnectionString = sqlConnection;
        con.Open();
        string query = "select skillid,skillname from skillstab where   skilltype='keyskill' ";
        var userresult = GetData(sqlConnection, query);
        if (userresult != null ? userresult.Rows.Count > 0 : false)
        {
            foreach (DataRow dr in userresult.Rows)
            {
                string skillname = (dr["skillname"] != null ? dr["skillname"].ToString() : null);
                emp_skill_list.Add(skillname);

            }
        }
        if ((!string.IsNullOrEmpty(TextBox1.Text) && !emp_skill_list.Contains(TextBox1.Text)))
        {
            SqlCommand cmd = new SqlCommand("Insert into skillstab(skillname,skilltype) values(@skillname,@skilltype)", con);
            cmd.Parameters.AddWithValue("@skillname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@skilltype", "keyskill");
            cmd.ExecuteNonQuery();
          

           ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('New Technology Added Successfully')</script>");

        }
        con.Close();
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