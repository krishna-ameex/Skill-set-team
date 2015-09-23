using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class searchform : System.Web.UI.Page
{  
    #region Global variable
    int count = 0;
    public List<int> emp_list = new List<int>();
    public List<DataRow> search_list = new List<DataRow>();
    public static string[] name = new string[100];
    #endregion
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query2 = "select *  from skillstab where skilltype='keyskill'";
            var userresult = GetData(sqlConnection, query2);
            DropDownList1.Items.Clear();
            if (userresult != null ? userresult.Rows.Count > 0 : false)
            {
                foreach (DataRow dr in userresult.Rows)
                {
                    var item = new ListItem();
                    item.Text = dr["skillname"] != null ? dr["skillname"].ToString() : string.Empty;
                    item.Value = dr["skillname"] != null ? dr["skillname"].ToString() : string.Empty;
                    DropDownList1.Items.Add(item);

                }
            }
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }


    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        GridViewRow row = GridView1.Rows[index];
        Label id = GridView1.Rows[index].FindControl("view") as Label;
        Session["mail"] = name[index];
        //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + name[index] + " ')</script>");
        Response.Redirect("viewpersonalinfoLOGIN.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int i = 0;
        string query2 = "select distinct r.mail,r.ename,r.platform,r.jobexperiance from emploskills e join skillstab s on e.skillid=s.skillid join regi r on e.eid=r.eid where  s.skillname='" + DropDownList1.SelectedValue + "' and e.expyear='" + DropDownList2.SelectedValue + "' and e.experiancelevel='" + DropDownList3.SelectedValue + "'";
        var userresult = GetData(sqlConnection, query2);

        if (userresult != null ? userresult.Rows.Count > 0 : false)
        {
            GridView1.DataSource = userresult;
            GridView1.DataBind();
           
        }
        else 
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('there is no suc"+name[2]+" a match')</script>");
        }
        Label7.Text = userresult.Rows.Count.ToString();

        foreach (DataRow n in userresult.Rows)
        {
            string nam = n["mail"] != null ? n["mail"].ToString() : string.Empty;
            name[i] = nam;
            i++;
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
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button2_Click(object sender, EventArgs e)
    {
    
        string query1 = "select * from regi r join emploskills e on r.eid=e.eid join skillstab s on s.skillid=e.skillid";
        var userresult = GetData(sqlConnection, query1);
        DataTable table = new DataTable();
        table.Columns.Add("ename", typeof(string));
        table.Columns.Add("platform", typeof(string));
        table.Columns.Add("jobexperiance", typeof(string));
        int i = 0;
        if (userresult != null ? userresult.Rows.Count > 0 : false)
        {    
            foreach (DataRow dr in userresult.Rows)
            {    
                object[] a=dr.ItemArray;
                List<Object> temp = new List<object>();
                foreach (object s in a)
                {
                    temp.Add(s);
                }
                if(temp.Contains(TextBox1.Text))
                {
                    string[] temp1 = new string[3];
                     temp1[0] = (dr["ename"] != null ? dr["ename"] : 0).ToString();
                     temp1[1] = (dr["platform"] != null ? dr["platform"] : 0).ToString();
                     temp1[2] = (dr["jobexperiance"] != null ? dr["jobexperiance"] : 0).ToString();
                     table.Rows.Add(temp1);
                     count++;
                     string nam = dr["mail"] != null ? dr["mail"].ToString() : string.Empty;
                     name[i] = nam;
                     i++;
                }
                
            }
           
            //foreach (DataRow n in userresult.Rows)
            //{
               
            //}
            Label7.Text = count.ToString();
            }
        GridView1.DataSource = table;
        GridView1.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminmenu.aspx");
    }
    
}