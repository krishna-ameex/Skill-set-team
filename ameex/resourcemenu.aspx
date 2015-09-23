<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resourcemenu.aspx.cs" Inherits="resourcemenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .menu
        {
          width:100px;
        margin-top:20px;
        }

        .blck
        {
            height:500px;
            width:980px;
           
        }
    .menu ul li
    {
        border: 1px solid white;
        background-color: gray;
        text-decoration: none;
        padding: 10px;
        margin: 13px;
    }
 
    .menu ul li a
    {
        color: blue;
    }
 
    .menu ul li a:hover
    {
        color:red;
       
    }
        .admn
        {
            height:226px;
            margin-left:150px;
           
        }
        .menu
        {
            z-index: 1;
            left: 60px;
            top: 184px;
            position: absolute;
            height: 175px;
            width: 136px;
            margin-left:130px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admn">
    <fieldset class="blck">
        <legend>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/emplo.jpg" style="z-index: 1; left: 351px; top: 238px; position: absolute; height: 331px" />
        </legend>
        <asp:Menu ID="resource_menu" Orientation="Vertical" runat="server" CssClass="menu">
     <Items>
          <asp:MenuItem Text="Add skills "  NavigateUrl="keyskills.aspx" />
         <asp:MenuItem Text="View Profile "  NavigateUrl="viewpersonalinfoLOGIN.aspx" />
        <asp:MenuItem Text="Update Profile " NavigateUrl="~/updatepersonalinfo.aspx"></asp:MenuItem>
         
    </Items>

        </asp:Menu>
       

            <asp:Button ID="Button4" runat="server" BackColor="#CCFF33" Font-Bold="True" ForeColor="#006666" style="z-index: 1; left: 1051px; top: 192px; position: absolute; width: 100px; height: 33px" Text="Logout" OnClick="Button4_Click" />
    
        
        <asp:Button ID="Button2" runat="server" BackColor="#CCFF33" Font-Bold="True" Font-Italic="False" ForeColor="#006666" style="z-index: 1; left: 919px; top: 190px; position: absolute; width: 128px; height: 35px" Text="Change Password" OnClick="Button2_Click" />
    
        
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 345px; top: 200px; position: absolute; width: 393px"></asp:Label>
       

    </fieldset></div>
</asp:Content>

