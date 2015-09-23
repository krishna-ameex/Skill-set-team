using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label23.Text = DateTime.Now.ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();

        try
        {
            SqlCommand cmd = new SqlCommand("Insert into regi (ename,eid,skype,mail,mob,desig,platform,jobexperiance,expinmonth,username,pass,confirm )values (@ename,@eid,@skype,@mail,@mob,@desig,@platform,@jobexperiance,@expinmonth,@username,@pass,@confirm)", con);
            cmd.Parameters.AddWithValue("@ename", TextBox6.Text);
            cmd.Parameters.AddWithValue("@eid", TextBox11.Text.ToString());
            cmd.Parameters.AddWithValue("@skype", TextBox12.Text);
            cmd.Parameters.AddWithValue("@mail", TextBox13.Text);
            cmd.Parameters.AddWithValue("@mob", TextBox14.Text.ToString());
            cmd.Parameters.AddWithValue("@desig", DropDownList2.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@platform", DropDownList1.SelectedItem.ToString());

            cmd.Parameters.AddWithValue("@jobexperiance", DropDownList3.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@expinmonth", DropDownList4.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@username", TextBox15.Text);
            cmd.Parameters.AddWithValue("@pass", TextBox16.Text);
            cmd.Parameters.AddWithValue("@confirm", TextBox17.Text);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Account Created Successfullly');window.location='login.aspx';", true);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception excep)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('User Already Exists with this ID!!')</script>");

        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox6.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox14.Text = "";
         DropDownList2.SelectedIndex=0;
         DropDownList3.SelectedIndex=0;
         DropDownList1.SelectedIndex = 0;
        TextBox15.Text="";
        TextBox16.Text="";
        TextBox17.Text="";


    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}