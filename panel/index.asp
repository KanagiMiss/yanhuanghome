<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>炎黄主站后台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--#include file="include/index.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
          <div class="well hero-unit">
            <h1>欢迎, <%response.Write(session("login_name"))%></h1>
            <p>本后台管理系统还在测试中，如果有BUG请汇报。初次登陆请尽快修改密码，如果你的密码太短太简单，也请赶紧更改。</p>
            <p><a class="btn btn-success btn-large" href="my-profile.asp">点我修改个人资料 &raquo;</a></p>
          </div>
          <div class="row-fluid">
            <%
            Function myDateFormat(myDate)
                'd = WhatEver(Day(myDate))
                'm = WhatEver(Month(myDate))
                d = Day(myDate)
                m = Month(myDate)   
                y = Year(myDate)
                myDateFormat= y & "/" & m & "/" & d
            End Function

            Function WhatEver(num)
                If(Len(num)=1) Then
                    WhatEver="0"&num
                Else
                    WhatEver=num
                End If
            End Function

            Sub writeStat(ptype,stat)
                response.expires=-1
                yesterday=Date()-1
                tommorrow=Date()+1         
                sql1="SELECT COUNT(*) AS cnt FROM "&ptype&";"
                sql2="SELECT COUNT(*) AS cnt FROM "&ptype&" WHERE ndate BETWEEN #"&myDateFormat(yesterday)&"# AND #"&myDateFormat(tommorrow)&"#;"
                if stat=1 then
                    sql=sql1
                elseif stat=2 then
                    sql=sql2
                else
                    sql=sql1
                end if
                set conn=Server.CreateObject("ADODB.Connection")
                conn.Provider=Application("dbProvider")
                url = Server.Mappath("../data/main.mdb")
                conn.Open(url)
                set rs=Server.CreateObject("ADODB.recordset")
                rs.Open sql,conn

                do until rs.EOF
                    for each x in rs.Fields
                        if x.name="cnt" then
                            response.Write(x.value)
                        end if
                    next
                    rs.MoveNext
                loop
                rs.Close
                conn.Close
            End Sub
             %>
            <div class="span3">
              <h3>新闻总数</h3>
              <p><a href="#" class="badge badge-inverse"><%call writeStat("news",1) %></a></p>
            </div>
            <div class="span3">
              <h3>今日新闻</h3>
              <p><a href="#" class="badge badge-inverse"><%call writeStat("news",2) %></a></p>
            </div>
            <div class="span3">
              <h3>通知总数</h3>
			  <p><a href="#" class="badge badge-inverse"><%call writeStat("notification",1) %></a></p>
            </div>
            <div class="span3">
              <h3>今日通知</h3>
			  <p><a href="#" class="badge badge-inverse"><%call writeStat("notification",2) %></a></p>
            </div>
          </div>
		  <br />
		  <div class="row-fluid">
			<div class="page-header">
				<h1>今天的成果<small>可以查看或者修改</small></h1>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>文章类型</th>
						<th>标题</th>
						<th>日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
                <%
                Sub writeToday(ptype)
                    response.expires=-1
                    yesterday=Date()-1
                    tommorrow=Date()+1                
                    sql="SELECT ID,ntype,ntitle,nauthor,ndate FROM "&ptype&" WHERE nauthor='"&session("login_name")&_
                        "' and ndate BETWEEN #"&myDateFormat(yesterday)&"#  AND #"&myDateFormat(tommorrow)&"# ORDER BY "&ptype&".ID DESC;"

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.Provider=Application("dbProvider")
                    url = Server.Mappath("../data/main.mdb")
                    conn.Open(url)
                    set rs=Server.CreateObject("ADODB.recordset")
                    rs.Open sql,conn

                    if ptype="news" then
                        ntype="新闻"
                        session("current_manage_page")="news.asp"
                    else
                        ntype="通知"
                        session("current_manage_page")="notification.asp"
                    end if
                    do until rs.EOF
                        response.Write("<tr class='list-pages'>")
                        for each x in rs.Fields
                            if x.name="ID" then
                                id=x.value
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="ntype" then
                                response.Write("<td>" & ntype & "</td>")
                            elseif x.name="ntitle" then
                                response.Write("<td>" & x.value & "</td>")
                            elseif x.name="ndate" then
                                dt = CDate(x.value)
                                response.Write( "<td>" & DatePart("yyyy",dt) & "-"_ 
                                                & Right("0" & DatePart("m",dt), 2) & "-"_ 
                                                & Right("0" & DatePart("d",dt), 2) & "</td>")
                            end if
                        next
                        response.Write("<td><span class='user-actions'><a href='edit-page.asp?type="&ptype&"&id=" & id & "' class='label label-success'>修改</a>"&_
                                       "<a href='actions/deleteitem.asp?type="&ptype&"&id=" & id & "&page=" & -1 & "' class='label label-important'>删除</a></span></td>")
                        response.Write("</tr>")
                        rs.MoveNext
                    loop
                    rs.Close
                    conn.Close
                End Sub

                call writeToday("news")
                call writeToday("notification")
                 %>
				</tbody>
			</table>
		  </div>
        </div>
      </div>

      <hr />

      <!--#include file="components/footer.asp"-->

    </div>

    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </body>
</html>
