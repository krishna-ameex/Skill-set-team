<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frames.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/frames.css">
    <script type="text/javascript" src="js/multiselect.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
    <link href="css/bootstrap-multiselect.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap-multiselect.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=ListBox1]').multiselect({
                includeSelectAllOption: true
            });
        });
        $(function () {
            $('[id*=ListBox2]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="framecont">
        

        

        
        <asp:ListBox ID="ListBox1" runat="server" style="z-index: 1; left: 342px; top: 444px; position: absolute" SelectionMode="Multiple">
            <asp:ListItem>Ektron</asp:ListItem>
           
                                        
            <asp:ListItem>EPI Server</asp:ListItem>
            <asp:ListItem>Kentico</asp:ListItem>
            <asp:ListItem>Share Point</asp:ListItem>
            <asp:ListItem>Site Core</asp:ListItem>
        </asp:ListBox>
        <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 382px; top: 764px; position: absolute; width: 67px; right: 641px" Text="Save" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 457px; top: 768px; position: absolute; width: 66px" Text="Cancel" />
        

        

        
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Andalus" Font-Size="X-Large" ForeColor="#990099" style="z-index: 1; left: 275px; top: 339px; position: absolute; width: 405px; height: 40px" Text="ADD YOUR FRAMEWORK SKILLS"></asp:Label>
        

        

        
       <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple">
            <asp:ListItem>Trained</asp:ListItem>
            <asp:ListItem>Certified</asp:ListItem>
            <asp:ListItem>Experiance</asp:ListItem>
        </asp:ListBox>
        

        

        
    </div>
    </asp:Content>

