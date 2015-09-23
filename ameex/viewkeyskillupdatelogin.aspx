<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewkeyskillupdatelogin.aspx.cs" Inherits="keyskillsupdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/keyupdate.css" rel="stylesheet" />
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
        
       
        #ContentPlaceHolder1_GridView1
        {
            margin-left:370px;
            margin-top:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="keyup">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 1038px; top: 183px; position: absolute; height: 45px; width: 86px" />
        <asp:Label ID="Label1" runat="server" Text="VIEW KEY SKILLS." Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 547px; top: 149px; position: absolute"></asp:Label>
        <div id="root">
           <br />
            <br />
             <fieldset class="fld">
                    <legend>
                
                    </legend>
                    <ul>
            <li>
                <a href="viewpersonalinfoLOGIN.aspx">Personal Info</a>
                <a href="viewkeyskillupdatelogin.aspx">KeySkills</a>
                <a href="viewbasicskillslogin.aspx">Basic Skills</a>
            </li>
        </ul>
                </fieldset>
            <div id="skills">

               
                
                
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="124px" Width="396px">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>

               
                
                
            </div>

            <asp:HiddenField ID="hdnValue" runat="server" />
        </div>
    </div>
</asp:Content>

