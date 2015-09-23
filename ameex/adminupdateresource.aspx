<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminupdateresource.aspx.cs" Inherits="adminupdateresource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script src="js/jquery-1.11.0.js"></script>
    <style>
        .keyup
        {
           height:900px;
    background-color:#D7DFDF;
    margin-top:0;
    width:950px;
    margin-left:190px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="keyup">
        <div id="root">
             <fieldset class="fld">
                    <legend></legend>
                    <ul>
            <li>
                <a href="updatepersonalinfo.aspx">Personal Info</a>
                <a href="keyskillsupdate.aspx">KeySkills</a>
                <a href="basicskilsupdate.aspx">Basic Skills</a>
            </li>
        </ul>
                </fieldset>
            <div id="skills">

                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666"  Text="UPDATE KEY SKILLS.." style="z-index: 1; left: 419px; top: 241px; position: absolute; width: 448px"></asp:Label>
                <br />
                <br />
                <fieldset class="skil">
                   
                <asp:Label ID="Label2" runat="server" Text="Click Here to Select  Below  Skills" Font-Bold="True"></asp:Label>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/leftarow.jpg" style="z-index: 1; left: 632px; top: 298px; position: absolute; height: 26px; width: 49px" />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" selectionmode="multiple">
                </asp:CheckBoxList>
                <br />
                    <br />
                     <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Add the New  Technology:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click"/>
                 </fieldset>
                
                
                
            </div>

            <asp:HiddenField ID="hdnValue" runat="server" />
        </div>
    </div>


</asp:Content>

