using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("resourcemenu.aspx");
    }
    

    protected void Button5_Click1(object sender, EventArgs e)
    {
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;

       // DataTable dt = new DataTable();
        con1.Open();
      //  SqlCommand cmnd = new SqlCommand("select *from regi where mail=@mail", con1);

        // SqlDataReader myReader = null;
        SqlCommand cmd = new SqlCommand("update regi set pass=@pass where mail='" + val + "'", con1);
        cmd.Parameters.AddWithValue("@mail", TextBox1.Text);
        cmd.Parameters.AddWithValue("@pass", TextBox17.Text);
        cmd.ExecuteNonQuery();

        con1.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Your New password updated')</script>");
    }
}