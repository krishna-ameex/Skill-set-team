<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="newtechnology.aspx.cs" Inherits="newtechnology" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
           .new
        {
                height:400px;
    background-color:#D7DFDF;
    margin-top:0;
    width:650px;
    margin-left:190px;

        }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 309px; top: 195px; position: absolute; width: 380px" Text="ADD NEW TECHNOLGY.."></asp:Label>
    <fieldset class="new">
        <legend>New Technology</legend>

        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 326px; top: 283px; position: absolute; width: 135px" Text="Technology"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 461px; top: 284px; position: absolute; width: 140px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 413px; top: 358px; position: absolute; width: 69px; height: 26px" Text="ADD" />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 753px; top: 191px; position: absolute; height: 52px; width: 86px" />

    </fieldset>

</asp:Content>

