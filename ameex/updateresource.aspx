<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updateresource.aspx.cs" Inherits="updateresource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/updateresource.css" rel="stylesheet" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
    <script>
        function confirmDelete() {
            
            var cnfrmVal;
            cnfrmVal = document.createElement("INPUT");
            cnfrmVal.name = "confirmValue";
            cnfrmVal.type = "hidden";
            if (confirm("Are you sure want to delete this person?") ) {
                cnfrmVal.value = "Yes";
            } else {
                cnfrmVal.value = "No";
            }
            document.forms[0].appendChild(cnfrmVal);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="update">

        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 510px; top: 219px; position: absolute" Text="Enter the Resource  Name" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 693px; top: 219px; position: absolute; width: 191px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server"  style="z-index: 1; left: 898px; top: 216px; position: absolute; width: 47px; height: 25px;" Text="search" OnClick="Button1_Click" />
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="eid"   OnRowCommand="GridView1_OnRowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"   style="z-index: 1; left: 295px; top: 262px; position: absolute; height: 133px; width: 459px; right: 285px;" CellPadding="4" AllowPaging="True"  ForeColor="#333333" GridLines="None" Font-Size="Smaller">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Eid" >
                    <ItemTemplate>
                     
                               <asp:Label ID="lblInvoice" runat="server" Text='<%# Eval("eid") %>'></asp:Label>  
                        
                        </ItemTemplate>  
                    

                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Ename">
                    <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>   
                        </ItemTemplate> 
                           
                          
                    </asp:TemplateField>                       
                        <asp:TemplateField HeaderText="Skype ID" >
                    <ItemTemplate>  
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("skype") %>'></asp:Label>                              
                          </ItemTemplate> 
                              
                        </asp:TemplateField>

                      <asp:TemplateField HeaderText="Mail ID">
                    <ItemTemplate>    
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("mail") %>'></asp:Label>  
                    </ItemTemplate>
                           
                           </asp:TemplateField>  
                                         
                        <asp:TemplateField HeaderText="Mobile No.">
                    <ItemTemplate>   
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("mob") %>'></asp:Label>                              
                         </ItemTemplate>  
                             
                        </asp:TemplateField>  

                <asp:TemplateField HeaderText="Designation">
                    <ItemTemplate>   
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("desig") %>'></asp:Label>                              
                          </ItemTemplate>  
                     <EditItemTemplate>
                        <asp:TextBox ID="texboxdesig" runat="server" Text='<%# Eval("desig") %>'></asp:TextBox>
                    </EditItemTemplate> 
                </asp:TemplateField>  
                     
                 <asp:TemplateField HeaderText="Platform">
                    <ItemTemplate> 
                   <asp:Label ID="Label7" runat="server" Text='<%# Eval("platform") %>'></asp:Label>                              
                    </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="texboxplat" runat="server" Text='<%# Eval("platfoem") %>'></asp:TextBox>
                    </EditItemTemplate> 

                 </asp:TemplateField>      
                <asp:TemplateField HeaderText="Experiance year">
                    <ItemTemplate>      
                   <asp:Label ID="Label8" runat="server" Text='<%# Eval("jobexperiance") %>'></asp:Label>
                        </ItemTemplate> 
                     <EditItemTemplate>
                        <asp:TextBox ID="texbox" runat="server" Text='<%# Eval("jobexperiance") %>'></asp:TextBox>
                    </EditItemTemplate> 
                </asp:TemplateField>  
                <asp:TemplateField>
                    <ItemTemplate>
                      <asp:Button ID="btnView"  runat="server" CommandName="View" Text="Update" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"
       />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                      <asp:Button ID="btnDelete"  runat="server" CommandName="delete_id" Text="Delete"   OnClientClick="confirmDelete()"   CommandArgument ="<%#((GridViewRow)Container).RowIndex%>"
       />
                    </ItemTemplate>
                </asp:TemplateField>

                </Columns>
      <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
</asp:Content>

