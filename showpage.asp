<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>炎黄职业技术学院</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
</head>
<body>
    <!--#include file="components/header.asp"-->
    <!--#include file="components/navi.asp"-->
    <!-- ####################################################################################################### -->
    <div class="wrapper col3">
        <div id="container">
            <div id="pagecontent">
            <%
            sub queryArticle(db, id)
                response.expires=-1
                sql="SELECT ntitle,ndate,ncontent FROM "& db & " WHERE " & db & ".ID= " & id

                set conn=Server.CreateObject("ADODB.Connection")
                conn.Provider=Application("dbProvider")
                url = Server.Mappath("data/main.mdb")
                conn.Open(url)
                set rs=Server.CreateObject("ADODB.recordset")
                rs.Open sql,conn
                    
                dim light,num
                light = true
                do until rs.EOF
                    for each x in rs.Fields
                        if x.name="ntitle" then
                            response.Write("<div class='title'>" &x.value& "</div>")
                        elseif x.name="ndate" then
                            response.Write("<div class='date'>" &x.value& "</div>")
                        elseif x.name="ncontent" then
                            response.Write("<div class='content'>" &x.value& "</div>")
                        end if
                    next
                    rs.MoveNext
                loop
            end sub
            if Request.QueryString("type")="news" then
                id=Request.QueryString("id")
                queryArticle "news",id
            elseif Request.QueryString("type")="notify" then
                id=Request.QueryString("id")
                queryArticle "notification",id
            else
                Response.Status="404 Not Found"
                Response.Write(response.Status)
                Response.End
            end if
             %>
            </div>
            <br class="clear" />
        </div>
    </div>
    <!-- ####################################################################################################### -->
    <!--#include file="components/footer.asp"-->
</body>
</html>
