using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;

public partial class forgot : System.Web.UI.Page
{
    /// <summary>
    /// load the page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    /// <summary>
    /// pass information to user the password is sent to your mail
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pswd=null;
        SqlConnection con = new SqlConnection();
       
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["skillsetConnectionString"].ConnectionString;
            con.Open();
            
            SqlCommand cmd = new SqlCommand("select pass from regi", con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                pswd = rd[0].ToString();
            }
            con.Close();
           
       
        Sendemail(Email.Text,pswd);
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Verify you mail,we have to sent your password.activate that link in your mail.');window.location='login.aspx';</script>");
        
    }
    /// <summary>
    /// pass the password to user mail if the it match 
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pswd"></param>
    public void Sendemail(string id,string pswd)
    {
        string ActivationUrl;
        try
        {
            
                MailMessage message = new MailMessage();
                message.From = new MailAddress("ananth.ameex@gmail.com", "venu");
                message.To.Add(id);
                message.Subject = "Verification Email";
                ActivationUrl = Server.HtmlEncode("http://localhost:51304/login.aspx");
                message.Body = "Password:"+pswd+"<a href='" + ActivationUrl + "'>Click Here to verify your acount</a>";
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("ananth.ameex@gmail.com", "jeyalakshmi");
                smtp.EnableSsl = true;
                smtp.Send(message);
            
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}