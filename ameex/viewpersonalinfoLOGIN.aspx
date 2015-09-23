<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewpersonalinfoLOGIN.aspx.cs" Inherits="updatepersonalinfo" %>

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
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 1045px; top: 212px; position: absolute; height: 52px; width: 86px" />
        <fieldset class="fld">
    <legend>ViewDetails</legend>
            <br />
            <br />

        <fieldset>
            <legend></legend>
        <ul>
            <li>
                <a href="viewpersonalinfoLOGIN.aspx">Personal Info</a>
                <a href="viewkeyskillupdatelogin.aspx">KeySkills</a>
                <a href="viewbasicskillslogin.aspx">Basic Skills</a>
            </li>
        </ul>
            </fieldset>
        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 461px; top: 160px; position: absolute; width: 526px" Text="VIEW PROFILE INFORMATION.."></asp:Label>
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
                <td class="auto-style2">
                    <asp:Label ID="Label14" runat="server" Text="Employee ID"></asp:Label>
                </td>
                <td class="auto-style2"> 
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>  
                <td class="auto-style2">
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
                     <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Platform"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Experiance"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label></td>
                <td>
                     <asp:Label ID="Label9" runat="server" Text="Experiance in month"></asp:Label>
                     <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label></td>
            </tr>
             </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skillsetConnectionString %>" SelectCommand="SELECT * FROM [reg]"></asp:SqlDataSource>
       
           
       
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" style="z-index: 1; left: 418px; top: 654px; position: absolute; width: 84px; height: 33px" Text="Back" CausesValidation="False" />
                
           
       
        
                
           
       
    </fieldset>
   
</asp:Content>

