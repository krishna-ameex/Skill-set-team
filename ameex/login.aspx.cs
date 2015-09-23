using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["mail"] = TextBox1.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlDataReader rd = null;
        
        SqlCommand cmd = new SqlCommand("select desig from regi where mail=@mail and pass=@pass", con);
        cmd.Parameters.AddWithValue("@mail",TextBox1.Text);
        cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
        rd = cmd.ExecuteReader();

        if(rd.Read())
        {
            if (rd[0].ToString() == "Project Manager")
                Response.Redirect("adminmenu.aspx");
            else if (rd[0].ToString() == "Delivery Manager")
                Response.Redirect("adminmenu.aspx");
            else if(rd[0].ToString()=="Junior Developer")
                Response.Redirect("resourcemenu.aspx");
                else if(rd[0].ToString()=="Senior Developer")
                Response.Redirect("resourcemenu.aspx");
            else if (rd[0].ToString() == "Tech Lead")
                Response.Redirect("adminmenu.aspx");
            
            else if (rd[0].ToString() == "Support")
                Response.Redirect("resourcemenu.aspx");
        }
            else
                Label3.Text = "Your login attempt was not successful. Please try again.";
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";

    }
}