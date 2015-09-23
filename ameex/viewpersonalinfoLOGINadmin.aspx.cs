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
    
    protected void Page_Load(object sender, EventArgs e)
    {

        string val = null;
        if ( Session["mail"] != null)
        {
         val = Session["mail"].ToString();
        //    mail = Session["eid"].ToString();

           
        }
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('"+val+"')</script>");
        
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        
        DataTable dt = new DataTable();
        con1.Open();
       // SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select username,ename,eid,skype,mail,mob,desig,platform,jobexperiance,expinmonth from regi where mail='" + val+ "'", con1);

        SqlDataReader myReader = myCommand.ExecuteReader();

        if (myReader.Read())
        {
            Label1.Text = (myReader["username"].ToString());
            Label4.Text = (myReader["ename"].ToString());
            Label5.Text = (myReader["eid"].ToString());
            Label6.Text = (myReader["skype"].ToString());
            Label7.Text = (myReader["mail"].ToString());
            Label8.Text = (myReader["mob"].ToString());
            Label9.Text = (myReader["desig"].ToString());
           
            Label20.Text = (myReader["platform"].ToString());
            Label10.Text = (myReader["expinmonth"].ToString());
            Label11.Text = (myReader["jobexperiance"].ToString());
            
        }
        myReader.Close();
        con1.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //SqlConnection con1 = new SqlConnection();
        //con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        //SqlCommand cmd = new SqlCommand("update regi set username=@username, ename = @ename, eid = @eid, skype = @skype, mail = @mail, mob = @mob, desig = @desig,platform=@platform, jobexperiance = @jobexperiance expinmonth=@expinmonth where eid=@eid", con1);
        //con1.Open();
        //cmd.Parameters.AddWithValue("@username", TextBox2.Text);
        //cmd.Parameters.AddWithValue("@ename", TextBox6.Text);
        //cmd.Parameters.AddWithValue("@eid", TextBox11.Text);
        //cmd.Parameters.AddWithValue("@skype", TextBox12.Text);
        //cmd.Parameters.AddWithValue("@mail", TextBox13.Text);
        //cmd.Parameters.AddWithValue("@mob", TextBox14.Text);
        //cmd.Parameters.AddWithValue("@desig", DropDownList2.Text);
        //cmd.Parameters.AddWithValue("@platform", DropDownList1.Text);
        //cmd.Parameters.AddWithValue("@jobexperiance", DropDownList3.Text);
        //cmd.Parameters.AddWithValue("@expinmonth", DropDownList4.Text);
        
        
        //cmd.ExecuteNonQuery();
       
        //con1.Close();
        //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Updated')</script>");
        //if (IsPostBack)
        //{
        //    Response.Redirect("~/updatepersonalinfo.aspx");
        //}
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("~/login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
        //Label1.Text = "";
        //Label4.Text = "";
        //Label5.Text = "";
        //Label6.Text = "";
        //Label7.Text = "";
        //Label8.Text = "";
        //DropDownList2.SelectedIndex = 0;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("resourcemenu.aspx");
    }
}