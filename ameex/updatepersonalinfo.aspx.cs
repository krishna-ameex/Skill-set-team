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
    #region
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    string str;
    static string mail = null;
    static string auth = null;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string val = null;
        if (Session["mail"] != null )
        {
            val = Session["mail"].ToString();
          

        }

        mail = val;
        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        
        DataTable dt = new DataTable();
        con1.Open();
        try
        {
            SqlCommand myCommand = new SqlCommand("select username,ename,eid,skype,mail,mob,desig,platform,jobexperiance,expinmonth from regi where mail='" + val + "'", con1);

            SqlDataReader myReader = myCommand.ExecuteReader();

            if (myReader.Read())
            {
                TextBox1.Text = (myReader["username"].ToString());
                TextBox2.Text = (myReader["ename"].ToString());
                TextBox3.Text = (myReader["eid"].ToString());
                TextBox4.Text = (myReader["skype"].ToString());
                TextBox5.Text = (myReader["mail"].ToString());
                TextBox6.Text = (myReader["mob"].ToString());
                DropDownList2.SelectedItem.Text = (myReader["desig"].ToString());
                DropDownList3.SelectedItem.Text = (myReader["jobexperiance"].ToString());
                DropDownList1.SelectedItem.Text = (myReader["platform"].ToString());
                DropDownList4.SelectedItem.Text = (myReader["expinmonth"].ToString());


            }
            myReader.Close();
            con1.Close();
        }
        catch (Exception exe)
        {
 
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
    protected void Button3_Click(object sender, EventArgs e)
    {

        //try
        //{
        //    SqlConnection con1 = new SqlConnection();
        //    con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        //    SqlCommand cmd = new SqlCommand("update regi set username=@username, ename = @ename, eid = @eid, skype = @skype, mail = @mail, mob = @mob, desig = @desig,platform=@platform, jobexperiance = @jobexperiance expinmonth=@expinmonth where eid=@eid", con1);
        //    con1.Open();
        //    cmd.Parameters.AddWithValue("@username", TextBox1.Text);
        //    cmd.Parameters.AddWithValue("@ename", TextBox2.Text);
        //    cmd.Parameters.AddWithValue("@eid", TextBox3.Text);
        //    cmd.Parameters.AddWithValue("@skype", TextBox4.Text);
        //    cmd.Parameters.AddWithValue("@mail", TextBox5.Text);
        //    cmd.Parameters.AddWithValue("@mob", TextBox6.Text);
        //    cmd.Parameters.AddWithValue("@desig", DropDownList2.Text);
        //    cmd.Parameters.AddWithValue("@platform", DropDownList1.Text);
        //    cmd.Parameters.AddWithValue("@jobexperiance", DropDownList3.Text);
        //    cmd.Parameters.AddWithValue("@expinmonth", DropDownList4.Text);


        //    cmd.ExecuteNonQuery();

        //    con1.Close();
        //}
        //catch (Exception exception)
        //{
 
        //}
        //    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Updated')</script>");
        ////if (IsPostBack)
        ////{
        ////    Response.Redirect("~/updatepersonalinfo.aspx");
        ////}
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


    }
  
    protected void Button2_Click1(object sender, EventArgs e)
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
    protected void Button3_Click1(object sender, EventArgs e)
    {
         try
        {
            SqlConnection con1 = new SqlConnection();
            con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand("update regi set username=@username, ename = @ename, eid = @eid, skype = @skype, mail = @mail, mob = @mob, desig = @desig,platform=@platform, jobexperiance = @jobexperiance expinmonth=@expinmonth where eid=@eid", con1);
            con1.Open();
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ename", TextBox2.Text);
            cmd.Parameters.AddWithValue("@eid", TextBox3.Text);
            cmd.Parameters.AddWithValue("@skype", TextBox4.Text);
            cmd.Parameters.AddWithValue("@mail", TextBox5.Text);
            cmd.Parameters.AddWithValue("@mob", TextBox6.Text);
            cmd.Parameters.AddWithValue("@desig", DropDownList2.Text);
            cmd.Parameters.AddWithValue("@platform", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@jobexperiance", DropDownList3.Text);
            cmd.Parameters.AddWithValue("@expinmonth", DropDownList4.Text);


            cmd.ExecuteNonQuery();

            con1.Close();
        }
        catch (Exception exception)
        {
 
        }
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Updated')</script>");
        //if (IsPostBack)
        //{
        //    Response.Redirect("~/updatepersonalinfo.aspx");
        //}
    }
    }
