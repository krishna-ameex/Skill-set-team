<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view details.aspx.cs" Inherits="view_details" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/jquery-1.11.0.js"></script>
    <style type="text/css">
        .auto-style1
        {
            height: 26px;
        }
        .fld
        {
            height:300px;
            float:left;
        }
        .basik
        {
            height: 300px;
            width:40px;

        }
        .keysk
        {
            height:300px;
            width:396px;
        }
       .basik table
        {    z-index: 1;
    left: 181px;
    top: 325px;
    position: absolute;
    height: 27px;
    width: 82px;
    display:none;
}
    </style>
     <script>

         function buildDivElements(skillName, currentItem) {

             var divID = 'skil_des_' + skillName;
             var returnString = '<div id="' + divID + '">' +
                        '<div>' +
          ' <label><input type="checkbox" name="' + skillName + '-Trained-Checkbox' + '" value="Trained" ' +
                 (currentItem.Trained ? "checked='checked'" : "") + '/> Trained</label>' +
          ' <label><input type="checkbox" name="' + skillName + '-Certified-Checkbox' + '" value="Certified" ' +
                 (currentItem.Certified ? "checked='checked'" : "") + '/> Certified</label>' +
          ' <label><input type="checkbox" name="' + skillName + '-Experienced-Checkbox' + '" value="Experienced" class="experience" ' +
                 (currentItem.Experienced ? "checked='checked'" : "") + ' /> Experienced</label>' +
              ' </div>' +

         ' <div id=' + skillName + 'exp>' +
          '<label ID="Label3"> Experience<label>' +
                '<input type="text" class="input" id="Text3" name="' + skillName + '-Experience-Year' + '" value="' + currentItem.ExpYears + '"  placeholder="year" />' +
             ' <input type="text" class="input" id="Text4" name="' + skillName + '-Experience-Month' + '"  value="' + currentItem.ExpMonths + '" placeholder="month" />' +
              ' <input  type="text" class="input" id="Text5" name="' + skillName + '-Experience-Description' + '"  value="' + currentItem.Description + '" placeholder="Description"  />' +
        ' </div>' +
                   '</div>';

             return returnString;
         }

         $(document).ready(function () {
             $("#<%=CheckBoxList1.ClientID%>").hide();

            $("#<%=Label2.ClientID%>").click(function () {
                $("#<%=CheckBoxList1.ClientID%>").toggle();
            });

            var jsonValue = JSON.parse($('#<%= hdnValue.ClientID %>').val());
            //console.log(jsonValue);
            // alert(jsonValue);
            jsonValue.forEach(function (item) {
                var checkBoxValue = item.SkillId;
                var checkBox = $('#ContentPlaceHolder1_CheckBoxList1 input[type="checkbox"][value="' + checkBoxValue.toString() + '"]');

                var divElement = buildDivElements(checkBoxValue, item);
                //  console.log(divElement);
                $(divElement).appendTo($(checkBox).parent());
            });

            $('#<%=CheckBoxList1.ClientID%> td > input[type="checkbox"]').on("click", function () {
                // Clone and Append element in parent

                var skillName = $(this).attr("value").split(' ').join('-');
                var divID = 'skil_des_' + skillName;
                if ($(this).prop('checked')) {
                    if (!$('#' + divID).length) {
                        var divElement = '<div id="' + divID + '">' +
                             '<div>' +
               ' <label><input type="checkbox" name="' + skillName + '-Trained-Checkbox' + '" value="Trained"/> Trained</label>' +
               ' <label><input type="checkbox" name="' + skillName + '-Certified-Checkbox' + '" value="Certified"/> Certified</label>' +
               ' <label><input type="checkbox" name="' + skillName + '-Experienced-Checkbox' + '" value="Experienced" class="experience"/> Experienced</label>' +
                   ' </div>' +

              ' <div id=' + skillName + 'exp>' +
               '<label ID="Label3"> Experience<label>' +
                     '<input type="text" class="input" id="Text3" name="' + skillName + '-Experience-Year' + '"   placeholder="year" />' +
                  ' <input type="text" class="input" id="Text4" name="' + skillName + '-Experience-Month' + '"   placeholder="month" />' +
                   ' <input  type="text" class="input" id="Text5" name="' + skillName + '-Experience-Description' + '"   placeholder="Description"  />' +
             ' </div>' +
                        '</div>';

                        $(divElement).appendTo($(this).parent());
                    }
                    else
                        $('#' + divID).show();
                    var Expid = skillName + "exp";
                    $('#' + Expid).hide();
                }
                else {
                    $('#' + divID).hide();
                }
            });

            $('#<%=CheckBoxList1.ClientID%>').on("click", ".experience", function () {
                var skillName = $(this).attr('name');
                if (skillName) {
                    skillName = skillName.replace('-Experienced-Checkbox', 'exp');
                    $('#' + skillName).toggle();
                }
            });


        });
    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="fld">
    <legend>Personal Information</legend>
    <table class="tab">
           
            
            <tr>
               <td>
                   <asp:Label ID="Label13" runat="server" Text="Employee Name:" ></asp:Label>
               </td>
                <td>
                    
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                
                </tr>
        <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Employee ID:"></asp:Label>
                </td>
                <td> 
                     <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label> </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Skype ID"></asp:Label>

                </td>
                <td>
                    
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Mail ID:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                   </td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label16" runat="server" Text="Mobile No.:"></asp:Label>
                </td>
                <td class="auto-style1">
                    
                <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Designation:"></asp:Label>
                </td>
                <td>
                    
                <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Platform:"></asp:Label>
                    </td>
                    <td>
                        
                <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Experiance:"></asp:Label>
                </td>
                <td>
                    
                <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label19" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style1">
                   
                <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label></td>
               
            </tr>
            
        </table>
        <fieldset class="keysk">
            <legend>KeySkills</legend>

            <div id="root">
            <div id="skills">
                <asp:Label ID="Label7" runat="server" Text="selectskills"></asp:Label>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" selectionmode="multiple">
                </asp:CheckBoxList>

            </div>
            
            <asp:HiddenField ID="hdnValue" runat="server" />
        </div>


        </fieldset>
        </fieldset>
    <fieldset class="basik">
        <legend>Basic skills</legend>
        <asp:Label ID="Label2" runat="server" Text="---Select---" Font-Bold="True" Font-Italic="True" style="z-index: 1; left: 824px; top: 249px; position: absolute"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
        
        <asp:Label ID="Label3" runat="server" Font-Bold="True" style="z-index: 1; left: 762px; top: 228px; position: absolute" Text="Select Your Basic skills"></asp:Label>
       
       
       
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 836px; top: 298px; position: absolute; width: 185px; right: 36px;" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style="z-index: 1; left: 759px; top: 275px; position: absolute; width: 351px; right: -8px;" Text="If your basic skill is not in that list means,just add in below box:"></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="z-index: 1; left: 872px; top: 337px; position: absolute" Text="Upload your Resume Here."></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" style="z-index: 1; left: 910px; top: 363px; position: absolute" />
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 939px; top: 398px; position: absolute; width: 208px" Text="Label"></asp:Label>
       
       
       
   </fieldset>
       
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skillsetConnectionString %>" SelectCommand="SELECT * FROM [regi]"></asp:SqlDataSource>
        
       
    
        
    </asp:Content>

