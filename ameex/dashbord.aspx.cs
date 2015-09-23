using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashbord : System.Web.UI.Page
{
    #region sql connection
    string sqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
    Dictionary<int, int> skill_count = new Dictionary<int, int>(); 
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        buildTechnologyGraph();
    }
     protected void buildTechnologyGraph()
        {
            var values = formDictionay();            
            string format = @"<tr><td>{0}</td><td>{1}</td></tr>";
            foreach (var key in values.Keys)
                ltlTechVsEmp.Text += string.Format(format, key, values[key]);
        }

        protected Dictionary<string, int> formDictionay()
        {
            //Step 0: Pull values from DB -> For Kentico / User Count
            Dictionary<string, int> values = new Dictionary<string, int>();
            Dictionary<int, int> temp = new Dictionary<int, int>();
            temp = ResourceCount();
            foreach (var t in temp)
            {
                int skillid= t.Key;
                int empcount = t.Value;
                string Empskillidquery = "select skillname from skillstab where skillid=" + skillid + "";
                var empid = GetData(sqlConnection, Empskillidquery);
                string skillname = null;
                int[] skillcount = new int[20];
                if (empid != null ? empid.Rows.Count > 0 : false)
                {
                    foreach (DataRow dr in empid.Rows)
                    {
                        skillname = dr["skillname"] != null ? dr["skillname"].ToString() : string.Empty;
                    }

                }
                values[skillname] = empcount;
                 
            }
          
            //Finally Return
            return values;
        }
    /// <summary>
    /// it return the skillid and count as dictionary
    /// </summary>
    /// <returns></returns>
        protected Dictionary<int,int> ResourceCount()
        {
           
            String Empskillidquery = "select *  from skillstab where skilltype='keyskill'";
            var empid = GetData(sqlConnection, Empskillidquery);
         int  str =0;
         int[] skillcount = new int[20];
            if (empid != null ? empid.Rows.Count > 0 : false)
            {
                foreach (DataRow dr in empid.Rows)
                {                 
                      str = (int)dr["skillid"] != null ? (int)dr["skillid"] :0;
                      String query = "select count(eid) from emploskills where skillid=" + str + "";                                      
                      var eidcount = GetData(sqlConnection, query);                  
                      Object[] a=eidcount.Rows[0].ItemArray;
                      skill_count.Add(str, (int)a[0]);                 
                }

            }
            return skill_count;
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
    }

