using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class updateresource : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            gvbind();
        }
    }
    protected void gvbind()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("Select u.ename as [name],u.eid as [eid], u.skype,u.mail,u.mob,u.desig,u.platform,u.jobexperiance from regi u  where u.desig='Junior Developer' OR  u.desig='Senior Developer' OR  u.desig='Support'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }

    }






    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        string confirmationValue = Request.Form["confirmValue"];
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        GridViewRow row = GridView1.Rows[index];
        if (e.CommandName == "View")
        {
            Label id = GridView1.Rows[index].FindControl("lblInvoice") as Label;
            Session["eid"] = id.Text;
            Response.Redirect("viewpersonalinfo.aspx");

        }
        else if (e.CommandName == "delete_id")
        {
          
            if (confirmationValue.Equals("Yes"))
            {
                GridView1.Rows[index].Visible = false;
            }
       
            }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        gvbind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("Select u.ename as [name],u.eid as [eid], u.skype,u.mail,u.mob,u.desig,u.platform,u.jobexperiance from regi u where u.ename='" + TextBox1.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();

            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                //GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        catch (Exception excep)
        {
 
        }
    }

}