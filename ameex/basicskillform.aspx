<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="basicskillform.aspx.cs" Inherits="basicskillform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/basicskil.css" rel="stylesheet" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
   
      <script>
        $(document).ready(function()
        {
          
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
        <br />
        <br />
        <fieldset class="fld">
                    <legend></legend>
                    <ul>
            <li>
                
                <a href="keyskills.aspx">KeySkills</a>
                <a href="basicskillform.aspx">Basic Skills</a>
            </li>
        </ul>
                </fieldset>
        <asp:Label ID="Label1" runat="server" Text="ADD BASIC SKILLS" style="z-index: 1; left: 507px; top: 152px; position: absolute; width: 316px;" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666"></asp:Label>
        <br />
        <br />
   <fieldset class="drop">

            <legend>Select the Basic Skills</legend>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
       </fieldset>
    <fieldset class="addit">
        <legend>Additional</legend>
       
       
       
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 463px; top: 387px; position: absolute; width: 185px; "></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style="z-index: 1; left: 448px; top: 352px; position: absolute" Text="If your basic skill is not in that list means,just add in below box:"></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="z-index: 1; left: 444px; top: 428px; position: absolute" Text="Upload your Resume Here:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" style="z-index: 1; left: 469px; top: 463px; position: absolute" />
        <asp:Button ID="Button1" runat="server"  style="z-index: 1; left: 454px; top: 534px; position: absolute; width: 136px" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 692px; top: 462px; position: absolute"></asp:Label>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/selectim.jpg" style="z-index: 1; left: 218px; top: 317px; position: absolute; height: 38px; width: 68px" />
       
       
       
     
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 543px; top: 501px; position: absolute"></asp:Label>
       
       
       
    </fieldset>
        </fieldset>
    
</asp:Content>

