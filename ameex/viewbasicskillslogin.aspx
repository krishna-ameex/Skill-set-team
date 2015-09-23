<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewbasicskillslogin.aspx.cs" Inherits="basicskilsupdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/basicskilupdate.css" rel="stylesheet" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
   
      <script>
          $(document).ready(function () {

              $(".basik img").click(function () {
                  $(".basik table").toggle();
              });
          });
    </script>
    <style type="text/css">
        .basik
        {
            height:900px;
    background-color:#D7DFDF;
    margin-top:0;
    width:950px;
    margin-left:190px;
        }
        .drop
        {
            width:200px;
            height: 760px;
            float:left;
        }
        .addit
        {
            margin-left:200px;
            height:790px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <fieldset class="basik">
        <asp:Label ID="Label1" runat="server" Text="VIEW BASIC SKILLS" style="z-index: 1; left: 523px; top: 149px; width: 316px; position: absolute;" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666"></asp:Label>
        <legend></legend>
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
                
        

        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 1055px; top: 198px; position: absolute; height: 52px; width: 86px" />
</fieldset>

        <asp:GridView ID="GridView1" runat="server" style="z-index: 1; left: 523px; top: 457px; position: absolute; height: 133px; width: 353px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
       
</asp:Content>

