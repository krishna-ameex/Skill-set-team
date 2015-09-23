using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ExtensionMethods;

public partial class keyskillsupdate : System.Web.UI.Page
{
    #region sql connection
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    #endregion

      static  string mail = null;
      static string auth = null; 
    /// <summary>
    /// load the page with keyskills with updated employeeskill 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string val = null;
      
        if (Session["eid"] != null)
        {
            val = Session["eid"].ToString();
        }
        Session["eid"] = val;
        if (Session["mail"] != null)
        {
            mail= Session["mail"].ToString();
        }
        Session["mail"] = mail;

        if (!IsPostBack)
        {
                  
       string query="select s.skillname,e.trained,e.certified,e.skill_experience from emploskills e join skillstab s on e.skillid=s.skillid   where   s.skilltype='keyskill' and e.eid="+val+" ";
       var userresult = GetData(sqlConnection, query);
       if (userresult != null ? userresult.Rows.Count > 0 : false)
       {
           GridView1.DataSource = userresult;
           GridView1.DataBind();

       }
       else
       {
           GridView1.DataSource = null;
           GridView1.DataBind();
           ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('there is no such a match')</script>");
       }                          
        }

       
            string query1 = "select desig from regi where mail='"+ mail +"'";
            var userresult1 = GetData(sqlConnection, query1);
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
        //catch (Exception excep)
        //{
        //    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('there" + mail + " no such a match')</script>");
        //}
    }
    
    #region SQLHelper
    public static DataTable GetData(string ConnectionString, string query)
    {
           
        SqlConnection connection = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        adapter.SelectCommand.CommandText = query;
        DataTable datatable = new DataTable();
        adapter.Fill(datatable);
        return datatable;
    }
    #endregion
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

          
                   if(auth.Equals("admin"))
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