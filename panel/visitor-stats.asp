<%
session("current_manage_page")="visitor-stats.asp"
 %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>访问统计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
    <style type="text/css">
    html, body {
        height: 100%;
    }
    </style>
  </head>
  <body>
    <!--#include file="include/visitor-stats.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>来访者数据 <small>来访者数据</small></h1>
			</div>
			<!--<div id="placeholder" style="width:80%;height:300px;"></div>-->
            <br />
            <table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>ID</th>
                        <th>IP地址</th>
                        <th>国家/地区</th>
                        <th>ISP</th>
						<th>来访时间</th>
						<th>离开时间</th>
						<th>帐号名</th>
						<th>帐号ID</th>
                        <th></th>
					</tr>
				</thead>
				<tbody>
                <%
                response.expires=-1
                sql="SELECT ID,ip,country,isp,entertime,leavetime,acountname,acountid FROM visitors ORDER BY visitors.ID DESC;"

                set conn=Server.CreateObject("ADODB.Connection")
                conn.Provider=Application("dbProvider")
                conn.CursorLocation = 3
                url = Server.Mappath("../data/main.mdb")
                conn.Open(url)
                set rs=Server.CreateObject("ADODB.recordset")
                rs.Open sql,conn
                    
                if not rs.EOF or not rs.BOF then
                    rs.PageSize=10

                    intPageCount = rs.PageCount

                    Select Case Request("action")
                        case "goto"
                            topage=Request("intpage")+0
                            if topage < 1 then
                                intpage = 1
                            elseif topage > intPageCount then
                                intpage = intPageCount
                            else
                                intpage = topage
                            end if
	                    case "first"
		                    intpage = 1
	                    case "prev"
		                    intpage = Request("last")-1
		                    if intpage < 1 or intpage > intPageCount then intpage = 1
	                    case "next"
		                    intpage = Request("last")+1
		                    if intpage < 1 or intpage > intPageCount then intpage = intPageCount
	                    Case "last"
		                    intpage = intPageCount
	                    case else
		                    intpage = 1
                    end select

                    rs.AbsolutePage = intPage 

                    For intRecord = 1 To rs.PageSize
                        if rs.Fields(0).value <> Session("vid") then
                            response.Write("<tr class='list-visitors'>")
                            for each x in rs.Fields
                                if x.name="ID" then
                                    id=x.value
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="ip" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="country" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="isp" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="entertime" or x.name="leavetime" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="acountname" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="acountid" then
                                    response.Write("<td>" & x.value & "</td>")
                                end if
                            next
                            response.Write("<td><div class='btn-group'><a class='btn btn-mini dropdown-toggle'" &_
                                           " data-toggle='dropdown' href='#'>操作<span class='caret'></span></a>" &_
							               "<ul class='dropdown-menu'>" &_
								           "<li><a href='actions/deleteitem.asp?type=visitors&id=" & id & "&page=" & intpage & "'><i class='icon-trash'></i> 删除 </a></li>" &_
							               "</ul></div></td>")
                            response.Write("</tr>")
                        end if
                        rs.MoveNext
                        If rs.EOF Then Exit For 
                    next
                 end if
                 %>
                </tbody>
            </table>
            <div class="pagination">
				<ul>
                    <li><a href="visitor-stats.asp?action=prev&last=<%=intpage%>">上一页</a></li>
                    <%
                    basepage = intpage-2
                    endpage = intpage+2
                    if basepage < 1 then
                        fixed = 1-basepage
                        basepage = basepage+fixed
                        endpage = endpage+fixed
                    end if
                    if endpage > intPageCount then
                        fixed = endpage-intPageCount
                        if basepage-fixed >= 1 then
                            basepage = basepage-fixed
                        end if
                        endpage = endpage-fixed
                    end if

                    for i=basepage to endpage
                        toactive = ""
                        if i=intPage then
                            toactive="active"
                        end if
                        response.Write("<li class='" & toactive & "'><a href='visitor-stats.asp?action=goto&intpage=" & i & "'>" & i & "</a></li>")
                    next
                     %>
					<li><a href="visitor-stats.asp?action=next&last=<%=intpage%>">下一页</a></li>
				</ul>
			</div>
		  </div>
        </div>
      </div>

      <hr>

      <!--#include file="components/footer.asp"-->

    </div>

    <script src="js/jquery.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.resize.js"></script>	
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(function () {
		var data = [
		{
			label: 'Example 2',
			data: [[0, 4454], [1, 1245], [2, 7876], [3, 5211], [4, 6787]]
		}];
		var options = {
			legend: {
				show: true,
				margin: 10,
				backgroundOpacity: 0.5
			},
			bars: {
				show: true,
				barWidth: 0.5,
				align: 'center'
			},
			grid: {
				borderWidth:1,
				hoverable: true
			},
			xaxis: {
				axisLabel: 'Month',
				ticks: [[0, 'Jan'], [1, 'Feb'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sep'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']],
				tickDecimals: 0,
			},
			yaxis: {
				tickSize:2000,
				tickDecimals: 0
			}
		};
		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #D6E9C6',
				padding: '2px',
				'background-color': '#DFF0D8',
				opacity: 0.80
			}).appendTo("body").fadeIn(200);
		}
		var previousPoint = null;
		$("#placeholder").bind("plothover", function (event, pos, item) {
			if (item) {
				if (previousPoint != item.dataIndex) {
					previousPoint = item.dataIndex;

					$("#tooltip").remove();
					showTooltip(item.pageX, item.pageY, item.series.label + ": " + item.datapoint[1]);
				}
			}
			else {
				$("#tooltip").remove();
				previousPoint = null;            
			}
		});
		$.plot( $("#placeholder") , data, options );
	});
	</script>
  </body>
</html>
