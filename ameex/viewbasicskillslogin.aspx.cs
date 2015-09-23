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
    #region
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    string str;
    static string mail = null;
    static string auth = null;
    #endregion

    public  List<int> emp_skill_list = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {
      

        if (!IsPostBack)
        {
            string val = null;
          
            if (Session["eid"] != null)
            {
                val = Session["eid"].ToString();

            }
            if (Session["mail"] != null)
            {
                mail = Session["mail"].ToString();
            }
            Session["mail"] = mail;
            Session["eid"] = val;
            string query1 = "select s.skillname,e.filename from emploskills e join skillstab s on e.skillid=s.skillid   where   s.skilltype='basicskill' and e.eid=" + val + " ";
         
            var userresult = GetData(sqlConnection, query1);
            if (userresult != null ? userresult.Rows.Count > 0 : false)
            {
                GridView1.DataSource = userresult;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource =null;
                GridView1.DataBind();
            }
        }
        string query2 = "select desig from regi where mail='" + mail + "'";
        var userresult1 = GetData(sqlConnection, query2);
        if (userresult1 != null ? userresult1.Rows.Count > 0 : false)
        {
            foreach (DataRow dr1 in userresult1.Rows)
            {
                string des = dr1["desig"] != null ? dr1["desig"].ToString() : string.Empty;
                if (des.Equals("Project Manager") || des.Equals("Delivery Manager") || des.Equals("Tech Lead"))
                {
                    auth = "admin";
                }
                else
                {
                    auth = "resource";
                }

            }

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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        try
        {


            if (auth.Equals("admin"))
            {
                Response.Redirect("adminmenu.aspx");
            }
            else
            {
                Response.Redirect("resourcemenu.aspx");
            }


        }
        catch (Exception ex)
        {

        }
    }
}
