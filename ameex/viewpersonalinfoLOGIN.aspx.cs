using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class updatepersonalinfo : System.Web.UI.Page
{
    #region Global variable and sql connection 
    static string mail = null;
    static string auth = null;
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

        string val = null;
        if ( Session["mail"] != null)
        {
         val = Session["mail"].ToString();               
        }
        if (Session["mail"] != null)
        {
            mail = Session["mail"].ToString();
        }
        Session["mail"] = mail;

        
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        
        DataTable dt = new DataTable();
        con1.Open();
       
        SqlCommand myCommand = new SqlCommand("select username,ename,eid,skype,mail,mob,desig,platform,jobexperiance,expinmonth from regi   where mail='" + val+ "'", con1);

        SqlDataReader myReader = myCommand.ExecuteReader();

        if (myReader.Read())
        {
            Label1.Text = (myReader["username"].ToString());
            Label4.Text = (myReader["ename"].ToString());
            Label5.Text = (myReader["eid"].ToString());
            Label6.Text = (myReader["skype"].ToString());
            Label7.Text = (myReader["mail"].ToString());
            Label8.Text = (myReader["mob"].ToString());
            Label25.Text = (myReader["desig"].ToString());        
            Label26.Text = (myReader["platform"].ToString());
            Label27.Text = (myReader["jobexperiance"].ToString());
            Label28.Text = (myReader["expinmonth"].ToString());
            Session["eid"] = (myReader["eid"].ToString());        
        }
       // ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + myReader["eid"].ToString() + "')</script>");
        myReader.Close();
        con1.Close();

        string query1 = "select desig from regi where mail='" + mail + "'";
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

    }
   
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("~/login.aspx");
    }
   
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("adminmenu.aspx");
    }
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
}