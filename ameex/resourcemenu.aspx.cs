using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class resourcemenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }

        String s = "Welcome";

        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select username from regi where mail='" + val + "'", con);
        SqlDataReader myReader = cmd.ExecuteReader();

        if (myReader.Read())
        {
            Label2.Text = s + " " + myReader[0].ToString();
        }
        myReader.Close();
        con.Close();
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("change.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}