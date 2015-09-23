<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminmenu.aspx.cs" Inherits="adminmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/dashboard.css" rel="stylesheet" />

    <style type="text/css">
        .menu
        {
          width:100px;
        margin-top:20px;
        }
  
    .menu ul li
    {
        border: 1px solid white;
        background-color: gray;
        text-decoration: none;
        padding: 13px;
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
        .admin
        {
            height:500px;
            background-color:#8B8B6F;
        }
        .admn
        {
            height: 539px;
            margin-top:-10px;
            margin-left:50px;
            width: 1011px;
        }
        #Admin_menu
        {
            margin-top:40px;
        }
        .menu
        {
            z-index: 1;
            left: 60px;
            top: 255px;
            position: absolute;
            height: 433px;
            width: 160px;
        }
        #second
        {
            margin-left:780px;
            margin-top:160px;
        }
         .side
        {
          width:100px;
        margin-top:20px;
        }
  
    .side ul li
    {
        border: 1px solid white;
        background-color: gray;
        text-decoration: none;
        padding: 13px;
        margin: 13px;
    }
 
    .side ul li a
    {
        color: blue;
    }
 
    .side ul li a:hover
    {
        color:red;
       
    }
        .fltRight
        {
            float: right;
            margin-right: 263px;
            margin-top: -420px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admn">
       
            <asp:Button ID="Button4" runat="server" BackColor="#CCFF33" Font-Bold="True" ForeColor="#006666" style="z-index: 1; left: 1123px; top: 203px; position: absolute; width: 100px; height: 33px" Text="Logout" OnClick="Button4_Click" />
      
        <asp:Menu ID="Admin_menu" Orientation="Vertical" runat="server" CssClass="menu">
     <Items>
          
         <asp:MenuItem Text="ADD SKILLS"  NavigateUrl="keyskills.aspx" />
         
         
         <asp:MenuItem Text="VIEW MY PROFILE "  NavigateUrl="viewpersonalinfoLOGIN.aspx" />
        <asp:MenuItem Text="UPDATE MY PROFILE " NavigateUrl="~/updatepersonalinfo.aspx"></asp:MenuItem>
       
        
    </Items>
        </asp:Menu>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 995px; top: 139px; position: absolute; width: 313px"></asp:Label>
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/adminmenu.jpg" style="z-index: 1; left: 279px; top: 275px; position: absolute; height: 330px; width: 706px" />
    <div class="fltRight">
        <asp:Menu ID="second" Orientation="Vertical" runat="server" CssClass="side">
            
            <Items>
                
                <asp:MenuItem Text="DASH BOARD "  NavigateUrl="dashbord.aspx" />
                 <asp:MenuItem Text="ADD NEW TECHNOLOGY"  NavigateUrl="newtechnology.aspx" />
                 <asp:MenuItem Text="SEARCH"  NavigateUrl="searchform.aspx" />
                 <asp:MenuItem Text="UPDATE & DELETE RESOURCE PROFILE" NavigateUrl="updateresource.aspx" />
            </Items>
        </asp:Menu>
        <asp:Button ID="Button2" runat="server" BackColor="#CCFF33" Font-Bold="True" Font-Italic="False" ForeColor="#006666" style="z-index: 1; left: 976px; top: 200px; position: absolute; width: 128px; height: 37px" Text="Change Password" OnClick="Button2_Click" />
    
        
    </div>
    </asp:Content>

