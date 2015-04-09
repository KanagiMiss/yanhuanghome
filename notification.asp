<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>炎黄职业技术学院</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
</head>
<body>
<!--#include file="include/notification.inc"-->
<!--#include file="components/header.asp"-->
<!--#include file="components/navi.asp"-->
<!-- ####################################################################################################### -->
    <div class="wrapper col3">
        <div id="container">
            <div id="listcontent">
                <div class="news_list">
                    <ul>
                        <%
                        response.expires=-1
                        sql="SELECT ID,ntitle,ndate FROM notification ORDER BY notification.ndate DESC;"

                        set conn=Server.CreateObject("ADODB.Connection")
                        conn.Provider=Application("dbProvider")
                        conn.CursorLocation = 3
                        url = Server.Mappath("data/main.mdb")
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
                                response.Write("<li><p>")
                                    for each x in rs.Fields
                                        if x.name="ID" then
                                            response.Write("<a href='showpage.asp?type=notify&id=" & x.value & "'>")
                                        elseif x.name="ntitle" then
                                            response.Write(x.value & "</a>")
                                        elseif x.name="ndate" then
                                            dt = CDate(x.value)
                                            response.Write("<span class='date'>" & DatePart("yyyy",dt) & "-"_ 
                                                                    & Right("0" & DatePart("m",dt), 2) & "-"_ 
                                                                    & Right("0" & DatePart("d",dt), 2) & "</span>")
                                        end if
                                    next
                                response.Write("</p></li>")
                                rs.MoveNext
                                If rs.EOF Then Exit For 
                            next
                        end if
                         %>
                    </ul>
                </div>
                <div class="pagination">
				    <ul>
                        <li><a href="notification.asp?action=prev&last=<%=intpage%>">上一页</a></li>
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
                            response.Write("<li class='" & toactive & "'><a href='notification.asp?action=goto&intpage=" & i & "'>" & i & "</a></li>")
                        next
                         %>
					    <li><a href="notification.asp?action=next&last=<%=intpage%>">下一页</a></li>
				    </ul>
			    </div>
            </div>
            <br class="clear" />
        </div>
    </div><!-- ####################################################################################################### -->
<!--#include file="components/footer.asp"-->
</body>
</html>
