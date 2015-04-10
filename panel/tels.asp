<%
session("current_manage_page")="tels.asp"
 %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>办公电话</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="js/jquery-ui-1.11.4.green/jquery-ui.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--#include file="include/tels.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>部门电话 <small>电话列表</small></h1>
			</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
                        <th>ID</th>
						<th>部门名称</th>
                        <th>号码数量</th>
						<th>外线</th>
						<th>内线</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
                <%
                response.expires=-1
                sql="SELECT ID,tname,tcount,tlnum,tsnum FROM tels ORDER BY tels.ID ASC;"

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
                        response.Write("<tr class='list-news'>")
                        for each x in rs.Fields
                            if x.name="ID" then
                                id=x.value
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="tname" then
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="tcount" then
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="tlnum" then
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="tsnum" then
                                response.Write("<td>" & x.value & "</td>")
                            end if
                        next
                        response.Write("<td><div class='btn-group'><a class='btn btn-mini dropdown-toggle'" &_
                                       " data-toggle='dropdown' href='#'>操作<span class='caret'></span></a>" &_
							           "<ul class='dropdown-menu'>" &_
								       "<li><a href='edit-tel.asp?id=" & id & "'><i class='icon-pencil'></i> 编辑 </a></li>" &_
								       "<li><a href='actions/deleteitem.asp?type=tels&id=" & id & "&page=" & intpage & "'><i class='icon-trash'></i> 删除 </a></li>" &_
							           "</ul></div></td>")
                        response.Write("</tr>")
                        rs.MoveNext
                        If rs.EOF Then Exit For 
                    next
                end if
                %>
				</tbody>
			</table>
			<div class="pagination">
				<ul>
                    <li><a href="tels.asp?action=prev&last=<%=intpage%>">上一页</a></li>
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
                        response.Write("<li class='" & toactive & "'><a href='tels.asp?action=goto&intpage=" & i & "'>" & i & "</a></li>")
                    next
                     %>
					<li><a href="tels.asp?action=next&last=<%=intpage%>">下一页</a></li>
				</ul>
			</div>
            <br />
			<a href="new-tel.asp" class="btn btn-success">新建部门电话</a>
            <br />
            <div class="ui-widget">
                    <div class="ui-state-highlight ui-corner-all" style="width:300px;margin-top: 20px;">
                        <p style="padding-top:8px;padding-left:8px;"><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                        <strong>注意：</strong> 当有多个外线或者内线时要用“|”隔开。 </p>
                    </div>
            </div>
		  </div>
        </div>
      </div>

      <hr>

      <!--#include file="components/footer.asp"-->

    </div>

    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
		$('.dropdown-menu li a').hover(
		function() {
			$(this).children('i').addClass('icon-white');
		},
		function() {
			$(this).children('i').removeClass('icon-white');
		});
		
		if($(window).width() > 760)
		{
			$('tr.list-users td div ul').addClass('pull-right');
		}
	});
	</script>
  </body>
</html>
