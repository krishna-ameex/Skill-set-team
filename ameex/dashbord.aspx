<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashbord.aspx.cs" Inherits="dashbord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/jquery.canvasjs.min.js"></script>

     <script src="Scripts/dashbord.js"></script>
    <link href="js/dashbord.css" rel="stylesheet" />
    <link href="Scripts/dashbord.css" rel="stylesheet" />
    <script src="js/dashbord.js"></script>
    <style>
        .logo
        {
            height: 130px;
            width: 100%;
            background-color: #446161;
        }

    </style>

<%--first pi chart js--%>

<%--<script type="text/javascript">
    window.onload = function () {0
        var chart = new CanvasJS.Chart("chartContainer",
        {
            title: {
                text: "new skills added"
            },
            animationEnabled: true,
            legend: {
                verticalAlign: "bottom",
                horizontalAlign: "center"
            },
            data: [
            {
                indexLabelFontSize: 20,
                indexLabelFontFamily: "Monospace",
                indexLabelFontColor: "darkgrey",
                indexLabelLineColor: "darkgrey",
                indexLabelPlacement: "outside",
                type: "pie",
                showInLegend: true,
                toolTipContent: "{y} - <strong>#percent%</strong>",
                dataPoints: [
                    { y: 12, legendText: "", indexLabel: " " },
                    { y: 16, legendText: "amazone server", indexLabel: "amazone server" },
                    { y: 45, legendText: "hack", exploded: true, indexLabel: "hack" },
                    { y: 8, legendText: "go", indexLabel: "mongo DB" },
                    { y: 100, legendText: "puf", indexLabel: "php user framework" },
                    { y: 25, legendText: "limeframework", indexLabel: "game framework" },
                    { y: 39, legendText: "960 grid", indexLabel: "jquery mobile" }
                ]
            }
            ]
        });
        chart.render();
    }
    $("a.canvasjs-chart-credit").hide();
</script>
    <style>
        .canvasjs-chart-credit {
  display: none;
}
    </style>--%>

</head>

<%--body starts --%>

<body>

<div id="jquery-script-menu">
<div class="jquery-script-center">
<div class="jquery-script-ads"><script type="text/javascript">
</script>
</div>

<div class="jquery-script-clear">
     <div class="logo">
            <asp:Image id="Image1" runat="server"
               AlternateText="logo"
               ImageUrl="images/download.jpg" Height="44px" />
            <asp:Label ID="Label1" runat="server" Text="SKILL SET MANAGEMENT" Font-Bold="True" Font-Italic="True" Font-Names="Microsoft New Tai Lue" Font-Size="XX-Large" ForeColor="#FFFDF4" style="z-index: 1; left: 398px; top: 31px; position: absolute; width: 604px; height: 36px; bottom: 459px;"></asp:Label>
                   <%-- <ul id="menu">
                        
                        <li><a id="A3" runat="server" href="~/login.aspx">SIGN IN</a></li>
                        <li><a id="A2" runat="server" href="~/registration.aspx">SIGN UP</a></li>
                        
                      
                    </ul>--%>
            </div>
</div>
</div>
</div>
<div class="content" style="margin-top:20px;margin-right:200px;width:1177px;">
<h1>DASHBOARD</h1>
</div>

<%--<div class="content">
    <h1></h1>

s
  --%>  
     
<div id="page" class="content"style="width:100%;">
<h2>NO. OF RESOURCES</h2>
<div class="controls" style="float:right;width:200px;display:none;">

</div>
<table class="dataforgraph">
<thead>
<td>technology</td>
<td>employee</td>
</thead>
    <asp:Literal ID="ltlTechVsEmp" runat="server" />
<tfoot>
<td colspan=2><button class="makeGraph">show Graph</button></td>
</tfoot>
</table>
</div>
<div id="update" class="content" style="display:none;width:568px;">
<h2>Update Data</h2>
<table class="updatedata">
<thead>
<td>technology</td>
<td>employees</td>
</thead>
<tbody>
<tr>
<td>kentico</td>
<td></td>
</tr>
<tr>
<td>ektron</td>
<td></td>
</tr>
<tr>
<td>sitecore</td>
<td></td>
</tr>
<tr>
<td>episerver</td>
<td></td>
</tr>
<tr>
<td>asp.net</td>
<td></td>
</tr>


</tbody>
<tfoot>
<tr>
<td colspan=2><button class="updateGraph">Update</button></td>
</tr>
</tfoot>
</table>
</div>
<script type="text/javascript">

    $(document).ready(function () {
        $('button.makeGraph').click(function () {
            $('#page').liveGraph({
                height: 250,
                barWidth: 55,
                barGapSize: 4,
                data: 'table.dataforgraph',
                hideData: true
            });

            $('div#update').hide();
            $('#page').data('liveGraph').settings.hideData = false;
            $('#page h2').html("Graph");
            $('#page div.controls').show();
            $('.animation').change(function () {
                if ($(this).val() == "true") {
                    $('#page').data('liveGraph').settings.animate = true;
                } else {
                    $('#page').data('liveGraph').settings.animate = false;
                }
            });
            $('.animTime').change(function () {
                $('#page').data('liveGraph').settings.animTime = parseInt($(this).val());
            });
        });
        $('table.updatedata').find('tbody tr').each(function () {
            var label = $(this).find('td').first();
            var oldlab = label.html();
            var value = $(this).find('td').last();
            var oldval = value.html();
            value.html("<input type='text' value='" + oldval + "' />");
            label.html("<input type='text' value='" + oldlab + "' />");
        });
        $('button.updateGraph').click(function () {
            $('table.updatedata').find('tbody tr').each(function () {
                var label = $(this).find('td').first();
                var value = $(this).find('td').last();
                var val = value.find('input').val();
                var lab = label.find('input').val();
                value.html(val);
                label.html(lab);
            });
            $('#page').liveGraph('update', 'table.updatedata');
            $('table.updatedata').find('tbody tr').each(function () {
                var label = $(this).find('td').first();
                var oldlab = label.html();
                var value = $(this).find('td').last();
                var oldval = value.html();
                value.html("<input type='text' value='" + oldval + "' />");
                label.html("<input type='text' value='" + oldlab + "' />");
            });
        });

        $('button.randomData').click(function () {
            $(this).attr('disabled', 'disabled');
            $(this).html("Cycling random data...");
            $('#update input, #update button').attr('disabled', 'disable');
            setTimeout(function () {
                //first set of data
                var updateData = {
                    tb1: {
                        value: 40
                    }
                };
                $('#page').liveGraph('update', updateData);
            }, 500);
            setTimeout(function () {
                //second set of data
                var updateData = {
                    tb3: {
                        value: 70
                    }
                };
                $('#page').liveGraph('update', updateData);
            }, 3000);
            setTimeout(function () {
                //third set of data
                var updateData = {
                    tb2: {
                        value: 100
                    },
                    tb1: 48.7
                };
                $('#page').liveGraph('update', updateData);
            }, 6000);
            setTimeout(function () {
                //forth set of data
                var updateData = {
                    tb3: {
                        value: 12
                    },
                    tb2: 30
                };
                $('#page').liveGraph('update', updateData);
            }, 10000);
            setTimeout(function () {
                //fifth set of data - final
                var updateData = {
                    tb1: {
                        value: 30,
                        label: "kentico"
                    },
                    tb2: {
                        value: 30,
                        label: "ektron"
                    },

                    tb3: {
                        value: 50,
                        label: "sitecore"
                    },
                    tb4: {
                        value: 50,
                        label: "episerver"
                    },
                    tb5: {
                        value: 30,
                        label: "asp.net"
                    },
                };
                $('#page').liveGraph('update', updateData);
                $('#update input, #update button').removeAttr('disabled');
                $('button.randomData').html("Fake Live Data");
                $('button.randomData').removeAttr('disabled');
            }, 13000);
        });

    });

	</script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
</body>
</html>
