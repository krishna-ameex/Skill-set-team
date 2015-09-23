using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class adminmenu : System.Web.UI.Page
{
    
    /// <summary>
    /// Login page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }

        String s = "Welcome";
        string sess_id=null;

        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select username,eid from regi where mail='" + val + "'", con);
      SqlDataReader myReader = cmd.ExecuteReader();

      if (myReader.Read())
      {
          Label2.Text  =s+" "+ myReader[0].ToString();
          sess_id = myReader["eid"].ToString();
      }
      Session["eid"] = sess_id;
    //  ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('"+sess_id+"')</script>");
      myReader.Close();
      con.Close();
    }
    /// <summary>
    /// user name Password mismatch
    /// redirect to login page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("login.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("changepswdadmn.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/chnagepswdadmn.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}