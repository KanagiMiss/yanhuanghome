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
    <!--#include file="include/news.inc"-->
    <!--#include file="components/header.asp"-->
    <!--#include file="components/navi.asp"-->
    <!-- ####################################################################################################### -->
    <div class="wrapper col3">
        <div id="container">
            <div id="content">
                <div class="news_list">
                    <ul>
                        <%
                        response.expires=-1
                        sql="SELECT TOP 15 ID,ntitle,ndate FROM news ORDER BY news.ndate DESC;"

                        set conn=Server.CreateObject("ADODB.Connection")
                        conn.Provider="Microsoft.ACE.OLEDB.12.0"
                        url = Server.Mappath("data/main.mdb")
                        conn.Open(url)
                        set rs=Server.CreateObject("ADODB.recordset")
                        rs.Open sql,conn
                    
                        dim light,num
                        light = true
                        do until rs.EOF
                            response.Write("<li><p>")
                            for each x in rs.Fields
                                if x.name="ID" then
                                    response.Write("<a href='showpage.asp?type=news&id=" & x.value & "'>")
                                elseif x.name="ntitle" then
                                    response.Write( x.value & "</a>")
                                elseif x.name="ndate" then
                                    dt = CDate(x.value)
                                    response.Write("<span class='date'>" & DatePart("yyyy",dt) & "-"_ 
                                                            & Right("0" & DatePart("m",dt), 2) & "-"_ 
                                                            & Right("0" & DatePart("d",dt), 2) & "</span>")
                                end if
                            next
                            response.Write("</p></li>")
                            rs.MoveNext
                        loop
                         %>
                    </ul>
                </div>
            </div>
            <br class="clear" />
        </div>
    </div>
    <!-- ####################################################################################################### -->
    <!--#include file="components/footer.asp"-->
</body>
</html>
