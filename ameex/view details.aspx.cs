using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ExtensionMethods;
public partial class view_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string val = null;
        if (Session["mail"] != null)
        {
            val = Session["mail"].ToString();
        }
        

        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;

        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader2 = null;
        SqlCommand myCommand = new SqlCommand("select username,ename,eid,skype,mail,mob,desig,platform,jobexperiance from regi where mail='" + val + "'", con1);

        myReader2 = myCommand.ExecuteReader();

        if (myReader2.Read())
        {
            Label8.Text = (myReader2["username"].ToString());
            Label9.Text = (myReader2["ename"].ToString());
            Label10.Text = (myReader2["eid"].ToString());
            Label25.Text = (myReader2["skype"].ToString());
            Label20.Text = (myReader2["mail"].ToString());
            Label21.Text = (myReader2["mob"].ToString());
            Label22.Text = (myReader2["desig"].ToString());
            Label23.Text = (myReader2["jobexperiance"].ToString());
            Label24.Text = (myReader2["platform"].ToString());


        }
        myReader2.Close();
        


                //string vaal = null;
                //if (Session["mail"] != null)
                //{
                //    vaal = Session["mail"].ToString();
                //}
                //if (!IsPostBack)
                //{
                //    SqlConnection con = new SqlConnection();
                //    con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
                //    con.Open();
                    SqlCommand myComand = new SqlCommand("select eid from regi where mail='" + val + "'", con1);
                    SqlDataReader myReader1 = myComand.ExecuteReader();
                    string str = null;
                    if (myReader1.Read())
                    {
                        str = myReader1["eid"].ToString();
                    }
                    myReader1.Close();
                    SqlCommand mycomma = new SqlCommand("select skillid,skillname from skillstab where   skilltype='keyskill' ", con1);
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
                    //con.Close();
                    con1.Close();

                    populateData(str);
                //}
            }
            protected void populateData(string currentUserId)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + currentUserId + "')</script>");
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
                    empSkill.SkillName = reader["basicskill"].ToString();
                    empSkills.Add(empSkill);
                }
            }
            protected string getFormValue(string key)
            {
                if (Request.Form[key] != null) return Request.Form[key].ToString();
                else
                    return string.Empty;
            }

   
}