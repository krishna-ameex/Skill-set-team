<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewkeyskillupdate.aspx.cs" Inherits="keyskillsupdate" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="keyup">
        <div id="root">
             <fieldset class="fld">
                    <legend></legend>
                    <ul>
            <li>
                <a href="viewpersonalinfo.aspx">Personal Info</a>
                <a href="viewkeyskillupdate.aspx">KeySkills</a>
                <a href="viewbasicskills.aspx">Basic Skills</a>
            </li>
        </ul>
                </fieldset>
            <div id="skills">

                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006666"  Text="UPDATE KEY SKILLS.." style="z-index: 1; left: 419px; top: 241px; position: absolute; width: 448px"></asp:Label>
                <br />
                <br />
                <fieldset class="skil">
                   
                <asp:Label ID="Label2" runat="server" Text="Click Here to Select  Below  Skills" Font-Bold="True"></asp:Label>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/leftarow.jpg" style="z-index: 1; left: 632px; top: 298px; position: absolute; height: 26px; width: 49px" />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" selectionmode="multiple">
                </asp:CheckBoxList>
                <br />
                    <br />
                     <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Add the New  Technology:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click"/>
                 </fieldset>
                
                
                
            </div>

            <asp:HiddenField ID="hdnValue" runat="server" />
        </div>
    </div>
</asp:Content>

