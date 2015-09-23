<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewpersonalinfoLOGINadmin.aspx.cs" Inherits="updatepersonalinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/updateinfo.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1
        {
            height: 42px;
        }
        .auto-style2
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="fld">
    <legend>Update your Details</legend>
        <fieldset>
            <legend></legend>
        <ul>
            <li>
                <a href="viewpersonalinfoLOGINadmin.aspx">Personal Info</a>
                <a href="viewkeyskillupdatelogin.aspx">KeySkills</a>
                <a href="viewbasicskillslogin.aspx">Basic Skills</a>
            </li>
        </ul>
            </fieldset>
        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 440px; top: 251px; position: absolute; width: 526px" Text="VIEW PROFILE INFORMATION.."></asp:Label>
      <br />
        <br />
        
          <table class="tab">
           
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Username" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                  </td>
                
                <td>
                    &nbsp;</td>
            <tr>
               <td>
                   <asp:Label ID="Label13" runat="server" Text="Employee Name" ></asp:Label>
               </td>
                <td>
                     <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Employee ID"></asp:Label>
                </td>
                <td> 
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>  
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Skype ID"></asp:Label>

                </td>
                <td>
                     <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                <td>
                    &nbsp;</td>
             
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Mail ID"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label16" runat="server" Text="Mobile No."></asp:Label>
                </td>
                <td >
                     <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Designation"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Platform"></asp:Label>
                </td>
                <td class="auto-style2">
                    
                  <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Experiance"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                <td>
                     <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
            </tr>
             </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skillsetConnectionString %>" SelectCommand="SELECT * FROM [reg]"></asp:SqlDataSource>
       
           
       
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" style="z-index: 1; left: 418px; top: 654px; position: absolute; width: 84px; height: 33px" Text="Back" CausesValidation="False" />
                
           
       
        
                
           
       
    </fieldset>
   
</asp:Content>

