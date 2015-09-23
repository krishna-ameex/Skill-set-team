<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewbasicskilsupdatesearch.aspx.cs" Inherits="basicskilsupdate" %>

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
    <fieldset class="basik">
        <legend></legend>
        <fieldset class="fld">
                    <legend></legend>
                    <ul>
            <li>
                <a href="viewpersonalinfo.aspx">Personal Info</a>
                <a href="viewkeyskillupdatesearch.aspx">KeySkills</a>
                <a href="viewbasicskilsupdatesearch.aspx">Basic Skills</a>
            </li>
        </ul>
                </fieldset>
        <asp:Label ID="Label1" runat="server" Text="UPDATE  RESOURCE'S BASIC SKILLS" style="z-index: 1; left: 418px; top: 236px; position: absolute; width: 478px;" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666"></asp:Label>
        <br />
        <br />

        <fieldset class="drop">

            <legend>Select the Basic Skills</legend>
        
        
            <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
       </fieldset>
       <fieldset class="addit">  
           <legend>Additional</legend>
          
             <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 580px; top: 369px; position: absolute; width: 185px; "></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style="z-index: 1; left: 452px; top: 336px; position: absolute" Text="If your basic skill is not in that list means,just add in below box:"></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="z-index: 1; left: 453px; top: 405px; position: absolute" Text="Upload your Resume Here."></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" style="z-index: 1; left: 584px; top: 436px; position: absolute" />
        <asp:Button ID="Button1" runat="server"  style="z-index: 1; left: 432px; top: 589px; position: absolute; width: 136px" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 819px; top: 435px; position: absolute"></asp:Label>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/selectim.jpg" style="z-index: 1; left: 243px; top: 282px; position: absolute; height: 38px; width: 68px" />
       
       
       
     
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 586px; top: 489px; position: absolute; height: 16px;"></asp:Label>
       
       </fieldset>
 
       
    </fieldset>
</asp:Content>

