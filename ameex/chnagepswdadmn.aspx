<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chnagepswdadmn.aspx.cs" Inherits="chnagepswdadmn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
     .auto-style1
        {
            height: 38px;
        }
        #Panel1
        {
            height:300px;

        }
        .auto-style3
        {
            height: 55px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="240px" > 
        <fieldset class="fled">
                <legend>Change Your Password
                </legend>
                <table class="tabl">
            
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label20" runat="server" Text="Old Password"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="You can't skip this field.Enter  Password." ControlToValidate="TextBox16" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
                    <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="New Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You can't skip this field.Enter Confirm password." ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label21" runat="server" Text="confirm Password"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Should be same as the above password" ControlToCompare="TextBox1" ControlToValidate="TextBox17" ForeColor="Red"></asp:CompareValidator>
                    
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="You can't skip this field.Enter Confirm password." ControlToValidate="TextBox17" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                </table>
                </fieldset><asp:Button ID="Button5" runat="server"  style="z-index: 1; left: 246px; top: 360px; position: absolute; width: 102px; height: 26px;" Text="Save" OnClick="Button5_Click1" />
         <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" style="z-index: 1; left: 355px; top: 361px; position: absolute; width: 112px; height: 26px;" Text="Back" CausesValidation="False" />
     </asp:Panel>
</asp:Content>

