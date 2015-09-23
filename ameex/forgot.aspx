<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgot.aspx.cs" Inherits="forgot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .mail
        {
            height:300px;
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="mail">
    <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 265px; top: 296px; position: absolute" Text="Enter your Mail id"></asp:Label>
    <asp:TextBox ID="Email" runat="server" style="z-index: 1; left: 416px; top: 290px; position: absolute; width: 249px; right: 417px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 706px; top: 284px; position: absolute" Text="submit" />
        </div>
</asp:Content>

