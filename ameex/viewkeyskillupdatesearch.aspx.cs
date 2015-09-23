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

    /// <summary>
    /// load the page with keyskills with updated employeeskill 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = null;
       
        if (Session["eid"] != null)
        {          
            id = Session["eid"].ToString();    
        }
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
            con.Open();    
            SqlCommand mycomma = new SqlCommand("select skillid,skillname from skillstab where   skilltype='keyskill' ", con);
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
            populateData(id);
          
        }
    }
    /// <summary>
    /// update the employee keyskills
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        string val = null;
        List<int> emp_skill_list = new List<int>();
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
        string query2 = "select skillid from emploskills where eid='"+str+"'";
         var userresult = GetData(sqlConnection, query2);
        if (userresult != null ? userresult.Rows.Count > 0 : false)
        {
            foreach (DataRow dr in userresult.Rows)
            {
                int skillid = (int)(dr["skillid"] != null ? dr["skillid"] : 0);
                emp_skill_list.Add(skillid);

            }
        }
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
                if (exp >= 4)
                {
                    Exp_level = "Expert";
                }
                else if (exp >= 2)
                {
                    Exp_level = "Intermediate";
                }
                else
                {
                    Exp_level = "entry level";
                }


                if (emp_skill_list.Contains(Int32.Parse(skill.Value)))
                {
                    try
                    {
                        SqlCommand mycommand = new SqlCommand("update emploskills set trained=@trained,certified=@certified,skill_experience=@experiance,experiancelevel=@experiancelevel,description=@description,expyear=@expyear,expmonth=@expmonth  where  eid='" + str + "'and skillid=@skillid", con);
                        mycommand.Parameters.AddWithValue("@skillid", skill.Value);
                        mycommand.Parameters.AddWithValue("@eid", val);
                        mycommand.Parameters.AddWithValue("@trained", Trained_check);
                        mycommand.Parameters.AddWithValue("@certified", Certified_check);
                        mycommand.Parameters.AddWithValue("@skill_experience", Experienced_check);
                        mycommand.Parameters.AddWithValue("@experiancelevel", Exp_level);
                        mycommand.Parameters.AddWithValue("@description", Experience_Description);
                        mycommand.Parameters.AddWithValue("@expyear", Experience_year);
                        mycommand.Parameters.AddWithValue("@expmonth", Experience_month);
                        mycommand.ExecuteNonQuery();
                    }
                    catch (Exception a)
                    {
 
                    }
                }
                else
                {
                    try
                    {
                        SqlCommand mycommand = new SqlCommand("Insert into emploskills (skillid,eid,trained,certified,experiance,experiancelevel,description,expyear,expmonth) values (@skillid,@eid,@trained,@certified,@experiance,@experiancelevel,@description,@expyear,@expmonth)", con);
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
                    catch(Exception e1)
                    {

                    }
                }
             }
        }
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Updated your keyskills')</script>");

        con.Close();
    }
    /// <summary>
    /// To populate the skills which already user having 
    /// </summary>
    /// <param name="currentUserId"></param>
    protected void populateData(string currentUserId)
    {
      
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand skillcmd = new SqlCommand(@"select u.*,s.skillname from  emploskills u join 
   skillstab s on s.skillid = u.skillid where eid='" + currentUserId + "'", con);
        SqlDataReader reader = skillcmd.ExecuteReader();
        List<EmployeeSkills> empSkills = new List<EmployeeSkills>();
        while (reader.Read())
        {
            EmployeeSkills empSkill = new EmployeeSkills();
          
            empSkill.Certified = reader["certified"].ToString();
            empSkill.EmpId = reader["eid"].ToString();
            empSkill.Trained = reader["trained"].ToString();
            empSkill.Experienced = reader["skill_experience"].ToString();
            empSkill.Description = reader["description"].ToString();
            empSkill.ExpLevel = reader["experiancelevel"].ToString();
            empSkill.ExpYears = reader["expyear"].ToString();
            empSkill.ExpMonths = reader["expmonth"].ToString();
            empSkill.SkillId = reader["skillid"].ToString();
            empSkills.Add(empSkill);
        }
        reader.Close();
        con.Close();
        hdnValue.Value = empSkills.ToJSON();
    }

    protected string getFormValue(string key)
    {
        if (Request.Form[key] != null) return Request.Form[key].ToString();
        else
            return string.Empty;
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