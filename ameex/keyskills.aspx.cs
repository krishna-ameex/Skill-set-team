using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class keyskills : System.Web.UI.Page
{
    /// <summary>
    /// load the page with keyskills
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
            con.Open();
            SqlCommand mycomma = new SqlCommand("select *  from skillstab where skilltype='keyskill'", con);         
            SqlDataReader reader = null;
            reader = mycomma.ExecuteReader();
           
            CheckBoxList1.Items.Clear();

            while (reader.Read())
            {
                var item = new ListItem();
                item.Text = reader["skillname"].ToString();
                item.Value = reader["skillid"].ToString().Replace(" ", "");
                CheckBoxList1.Items.Add(item);
            }
            reader.Close();
            con.Close();
        }
    }
    /// <summary>
    /// Add the employee keyskills into Database
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand myCommand = new SqlCommand("select eid from regi where mail='" + val + "'", con);
        SqlDataReader myReader = myCommand.ExecuteReader();
       string str = null;
        if (myReader.Read())
        {
            str = myReader["eid"].ToString();
        }
        myReader.Close();

        foreach (ListItem skill in CheckBoxList1.Items)
        {
            if (skill.Selected)
            {
                var Trained_check = getFormValue(skill.Value + "-Trained-Checkbox");
                var Certified_check = getFormValue(skill.Value + "-Certified-Checkbox");
                var Experienced_check = getFormValue(skill.Value + "-Experienced-Checkbox");
                var Experience_Description = getFormValue(skill.Value + "-Experience-Description");
                var Experience_month = getFormValue(skill.Value + "-Experience-Month");
                var Experience_year = getFormValue(skill.Value + "-Experience-Year");
                int exp = 0;
                int.TryParse(Experience_year, out exp);
                string Exp_level;
                if (exp > 5)
                {
                    Exp_level = "Expert";
                }
                else if (exp > 3)
                {
                    Exp_level = "Intermediate";
                }
                else
                {
                    Exp_level = "Entry level";
                }
                try
                {
                SqlCommand mycommand = new SqlCommand("Insert into emploskills (skillid,eid,trained,certified,skill_experience,experiancelevel,description,expyear,expmonth) values (@skillid,@eid,@trained,@certified,@skill_experience,@experiancelevel,@description,@expyear,@expmonth)", con);
                    mycommand.Parameters.AddWithValue("@skillid", skill.Value);
                    mycommand.Parameters.AddWithValue("@eid", str);
                    mycommand.Parameters.AddWithValue("@trained", Trained_check);
                    mycommand.Parameters.AddWithValue("@certified", Certified_check);
                    mycommand.Parameters.AddWithValue("@skill_experience", Experienced_check);
                    mycommand.Parameters.AddWithValue("@experiancelevel", Exp_level);
                    mycommand.Parameters.AddWithValue("@description", Experience_Description);
                    mycommand.Parameters.AddWithValue("@expyear", Experience_year);
                    mycommand.Parameters.AddWithValue("@expmonth", Experience_month);
                    mycommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                   //s ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('you are trying to add the same value')</script>");
                }
            }
        }
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('key skills added successfully')</script>");
  
        con.Close();
    }
    /// <summary>
    /// return the name of the checklist box
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    protected string getFormValue(string key)
    {
        if (Request.Form[key] != null) return Request.Form[key].ToString();
        else
            return string.Empty;
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckBoxList1.SelectedItem.ToString();

    }
    /// <summary>
    /// return to home page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand myCommand = new SqlCommand("select eid,desig from regi where mail='" + val + "'", con);
        SqlDataReader myReader = myCommand.ExecuteReader();
        string str = null;
        string desig = null;
        if (myReader.Read())
        {
            str = myReader["eid"].ToString();
            desig = myReader["desig"].ToString();
        }
        myReader.Close();
        if (desig.Equals("Project Manager") || desig.Equals("Delivery Manager") || desig.Equals("Tech Lead"))
        {
            Response.Redirect("adminmenu.aspx");
        }
        else
        {
            Response.Redirect("resourcemenu.aspx");
        }
    }
}