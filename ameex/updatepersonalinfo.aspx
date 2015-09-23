<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updatepersonalinfo.aspx.cs" Inherits="updatepersonalinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/updateinfo.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1
        {
            height: 42px;
        }
        .auto-style2
        {
            height: 26px;
        }
        .auto-style3
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="fld">
    <legend>Update your Details</legend>
        <br />
        <br />
        <fieldset>
            <legend></legend>
        <ul>
            <li>
                <a href="updatepersonalinfo.aspx">Personal Info</a>
                <a href="keyskillsupdate.aspx">KeySkills</a>
                <a href="basicskilsupdate.aspx">Basic Skills</a>
            </li>
        </ul>
            </fieldset>
        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666" style="z-index: 1; left: 444px; top: 158px; position: absolute; width: 526px" Text="UPDATE PROFILE INFORMATION.."></asp:Label>
      <br />
        <br />
        
          <table class="tab">
           
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Username" ></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="175px"></asp:TextBox> </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You can't skip this field.Enter  Username" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <tr>
               <td>
                   <asp:Label ID="Label13" runat="server" Text="Employee Name" ></asp:Label>
               </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="177px"></asp:TextBox></td>
                <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You can't skip this field.Enter Employe name" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>  
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label14" runat="server" Text="Employee ID"></asp:Label>
                </td>
                <td class="auto-style3"> 
                    <asp:TextBox ID="TextBox3" runat="server" style="margin-top: 0px" Width="173px"></asp:TextBox></td>  
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You can't skip this field.Enter Employe ID." ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Skype ID"></asp:Label>

                </td>
                <td>
                   <asp:TextBox ID="TextBox4" runat="server" Width="176px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You can't skip this field.Enter Skype ID" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                </td>
             
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Mail ID"></asp:Label>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click1" style="z-index: 1; left: 326px; top: 681px; position: absolute; width: 80px; height: 33px" Text="Update" />
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="173px"></asp:TextBox></td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid mail id..Eg.John@gmail.com" ControlToValidate="TextBox5" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="You can't skip this field.Enter Mail ID" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label16" runat="server" Text="Mobile No."></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox6" runat="server" Height="23px" Width="176px"></asp:TextBox></td>
                <td class="auto-style1">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Mobile number should be in 10 digits." ControlToValidate="TextBox6" ForeColor="Red" ClientValidationFunction="func"></asp:CustomValidator>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="You can't skip this field.Enter  Mobile number." ControlToValidate="TextBox6" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Designation"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Junior Developer</asp:ListItem>
                        <asp:ListItem>Senior Developer</asp:ListItem>
                        <asp:ListItem>Tech Lead</asp:ListItem>
                        <asp:ListItem>Project Manager</asp:ListItem>
                        <asp:ListItem>Delivery Manager</asp:ListItem>
                        <asp:ListItem>Support</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Platform"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>---Select---</asp:ListItem>
                        <asp:ListItem>.net</asp:ListItem>
                        <asp:ListItem>Angular Js</asp:ListItem>
                        <asp:ListItem>Data analytics</asp:ListItem>
                        <asp:ListItem>mobile</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Experiance"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>--year--</asp:ListItem>
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
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>--month--</asp:ListItem>
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
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skillsetConnectionString %>" SelectCommand="SELECT * FROM [reg]"></asp:SqlDataSource>
       
           
       
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" style="z-index: 1; left: 416px; top: 681px; position: absolute; width: 84px; height: 33px" Text="Back" CausesValidation="False" />
                
           
       
        
                
           
       
    </fieldset>
   
</asp:Content>

