<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="keyskills.aspx.cs" Inherits="keyskills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/keyskils.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.js"></script>
    <script>

        $(document).ready(function () {
            $('#<%=CheckBoxList1.ClientID%>').hide();


            $('#<%=Label2.ClientID%>').click(function () {
                $('#<%=CheckBoxList1.ClientID%>').toggle();
            });
            $('#<%=CheckBoxList1.ClientID%> input[type="checkbox"]').on("click", function () {
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
            //$("#exp2").hide();
            //$('#exp2 input[type="checkbox"]').click(function () {
            //    if ($(this).attr("value") == "Experienced") {
            //        $("#exp2").toggle();
            //    }

            //});
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="keys">
        <div id="root">
            <fieldset class="fld">
                    <legend></legend>
                    <ul>
            <li>
                
                <a href="keyskills.aspx">KeySkills</a>
                <a href="basicskillform.aspx">Basic Skills</a>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/hme.jpg" OnClick="ImageButton1_Click" style="z-index: 1; left: 1007px; top: 159px; position: absolute; height: 52px; width: 86px" />
            </li>
        </ul>
                </fieldset>
            <div id="skills">
                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#006666"  Text="ADD KEY SKILLS.." style="z-index: 1; left: 419px; top: 241px; position: absolute; width: 448px"></asp:Label>
                <br />
                <br />
                <fieldset class="skil">
                   
                <asp:Label ID="Label2" runat="server" Text="Click Here to Select  Below  Skills" Font-Bold="True"></asp:Label>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/leftarow.jpg" style="z-index: 1; left: 632px; top: 298px; position: absolute; height: 26px; width: 49px" />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" selectionmode="multiple">
                </asp:CheckBoxList>
                <br />
                    <br />
               
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click"/>
                 </fieldset>

            </div>
           
        </div>
    </div>
</asp:Content>

