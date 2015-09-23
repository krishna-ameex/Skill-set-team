<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/reg.css">
    <style type="text/css">
        .auto-style1
        {
        height: 25px;
    }
    </style>
    <script type="text/javascript">

        function func(oSrc, args) {
            args.IsValid = (args.Value.length ==10);
        }
        function funcn(oSrc, args) {
            args.IsValid = (args.Value.length >=6);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <fieldset class="fld">
    <legend>Personal Information</legend>
  
        
        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#006666" style="z-index: 1; left: 441px; top: 254px; position: absolute; width: 235px"></asp:Label>
   
        
        <br />
        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#006666" style="z-index: 1; left: 386px; top: 186px; position: absolute; width: 410px; height: 31px" Text="Sign up Here.."></asp:Label>
   
        
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/reg.jpg" style="z-index: 1; left: 948px; top: 158px; position: absolute; height: 162px; width: 217px" />
   
        
        <table class="tab">
           
            
            <tr>
               <td>
                   <asp:Label ID="Label13" runat="server" Text="Employee Name" ></asp:Label>
               </td>
                <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You can't skip this field.Enter Employe name" ForeColor="Red" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>  
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Employee ID"></asp:Label>
                </td>
                <td> 
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>  
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You can't skip this field.Enter Employe ID." ControlToValidate="TextBox11" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Skype ID"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You can't skip this field.Enter Skype ID" ForeColor="Red" ControlToValidate="TextBox12"></asp:RequiredFieldValidator>
                </td>
             
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Mail ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid mail id..Eg.John@gmail.com" ControlToValidate="TextBox13" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="You can't skip this field.Enter Mail ID" ControlToValidate="TextBox13" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label16" runat="server" Text="Mobile No."></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Mobile number should be in 10 digits." ControlToValidate="TextBox14" ForeColor="Red" ClientValidationFunction="func"></asp:CustomValidator>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="You can't skip this field.Enter  Mobile number." ControlToValidate="TextBox14" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Designation"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>---Select---</asp:ListItem>
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
                    <asp:Label ID="Label1" runat="server" Text="Platform"></asp:Label>
                    </td>
                    <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>---Select---</asp:ListItem>
                        <asp:ListItem>.net</asp:ListItem>
                        <asp:ListItem>Angular js</asp:ListItem>
                        <asp:ListItem>Data Analytics</asp:ListItem>
                        <asp:ListItem>Drupal</asp:ListItem>
                        <asp:ListItem>mobile</asp:ListItem>
                        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Experiance"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>---Year---</asp:ListItem>
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
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>--Months--</asp:ListItem>
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
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="You can't skip this field.Enter  Username" ControlToValidate="TextBox15" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox16" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Enter the password above 6 characters" ClientValidationFunction="funcn" ControlToValidate="TextBox16" ForeColor="Red"></asp:CustomValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="You can't skip this field.Enter  Password." ControlToValidate="TextBox16" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox17" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Should be same as the above password" ControlToCompare="TextBox16" ControlToValidate="TextBox17" ForeColor="Red"></asp:CompareValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="You can't skip this field.Enter Confirm password." ControlToValidate="TextBox17" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 734px; top: 672px; position: absolute; width: 128px; height: 31px;" Text="GET STARTED" OnClick="Button1_Click" ForeColor="#006666" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 871px; top: 672px; position: absolute; width: 90px; right: 191px; height: 30px;" Text="BACK" OnClick="Button3_Click1" ForeColor="#006666" CausesValidation="False" />
            
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skillsetConnectionString %>" SelectCommand="SELECT * FROM [reg]"></asp:SqlDataSource>
            
    
        </fieldset>
</asp:Content>

