<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="inputl">
    <legend>Sign in</legend>
    <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 52px; top: 42px; position: absolute; width: 89px; right: 259px; height: 27px; margin-top: 2px;" Text="User  Mail ID"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 170px; top: 45px; position: absolute; width: 192px; height: 26px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 56px; top: 103px; position: absolute; height: 26px; width: 77px; right: 267px" Text="Password"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 57px; top: 154px; position: absolute; height: 26px; width: 93px" Text="SIGN IN" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgot.aspx" style="z-index: 1; top: 218px; position: absolute; height: 21px; width: 143px; right: 246px;" Font-Underline="True">Forgot Password?</asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registration.aspx" style="z-index: 1; left: 238px; top: 251px; position: absolute; height: 25px; width: 148px" Font-Underline="True">Sign Up Now</asp:HyperLink>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 172px; top: 98px; position: absolute; height: 28px; width: 191px" TextMode="Password"></asp:TextBox>
        <br />
    <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 172px; top: 152px; position: absolute; width: 109px; height: 27px" Text="RESET" OnClick="Button2_Click" />
    <asp:Label ID="Label3" runat="server" ForeColor="Red" style="z-index: 1; left: 46px; top: 191px; position: absolute; height: 22px; width: 341px"></asp:Label>
        <asp:Image ID="Image4" runat="server" ImageUrl="images/login.jpg" style="z-index: 1; left: 413px; top: -5px; position: absolute; width: 212px; height: 285px" />
       </fieldset>
 </asp:Content>

