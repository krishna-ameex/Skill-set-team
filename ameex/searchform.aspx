<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchform.aspx.cs" Inherits="searchform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/search.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="serch">
    <div class="frst">

        <asp:Label ID="Label3" runat="server" Text="Search The Resource Here.." style="z-index: 1; left: 464px; top: 164px; position: absolute" Font-Bold="True" Font-Size="XX-Large" ForeColor="#006666"></asp:Label>
      
        <br />
        <br />
        <br />

         <table>
           <tr>
               <td>
                   <asp:Label ID="Label1" runat="server" Text="Technology"></asp:Label>
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 1059px; top: 208px; position: absolute; height: 52px; width: 86px" />
               </td>
               <td>
                   <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
               </td>
           </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Project Experience"></asp:Label>
            </td>
            <td>
                 <asp:DropDownList ID="DropDownList2" runat="server" >
            <asp:ListItem>Years</asp:ListItem>
                     <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
            </td>
        </tr>
           <tr>
               <td>
                   <asp:Label ID="Label4" runat="server" Text="Expertise"></asp:Label>
               </td>
               <td>
                   <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>select level</asp:ListItem>
            <asp:ListItem>Entry level</asp:ListItem>
            <asp:ListItem>Intermediate</asp:ListItem>
            <asp:ListItem>Expert</asp:ListItem>
        </asp:DropDownList>
               </td>
               <td>
                   <asp:Button ID="Button1" runat="server"  Text="Search"  OnClick="Button1_Click" />
               </td>
              
           </tr>
       </table>
       
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; top: 228px; position: absolute; height: 22px; left: 773px;"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="z-index: 1; left: 921px; top: 229px; position: absolute; height: 28px; width: 100px;" Text="General Search" />
        
         </div>
        
       
        <asp:GridView ID="GridView1" runat="server"  OnRowCommand="GridView1_OnRowCommand" style="z-index: 1; left: 473px; top: 356px; position: absolute; height: 133px; width: 260px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="View"  ID="view" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
       
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 225px; top: 347px; position: absolute; width: 126px" Text="No.of Resources :"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 345px; top: 351px; position: absolute; width: 47px"></asp:Label>
       
   </div>
        

</asp:Content>

