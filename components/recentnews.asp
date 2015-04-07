<!-- ####################################################################################################### -->
    <%
    response.Write("<ul>")
    response.expires=-1
    sql="SELECT TOP 6 ID,ntitle,ndate,nabstract FROM news ORDER BY news.ndate DESC;"

    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn

    do until rs.EOF
        response.Write("<li>")
        'response.Write("<div class='imgholder'><a href='#'><img src='images/9.jpg' alt=' '/></a></div>")
        for each x in rs.Fields
            if x.name="ID" then
                id=x.value
                response.Write("<p><strong><a href='showpage.asp?type=news&id=" & id & "'>")
            elseif x.name="ntitle" then
                response.Write( x.value & "</a></strong></p>")
            elseif x.name="ndate" then
                dt = CDate(x.value)
                response.Write("<p><strong>" & DatePart("yyyy",dt) & "-"_ 
                                             & Right("0" & DatePart("m",dt), 2) & "-"_ 
                                             & Right("0" & DatePart("d",dt), 2) & "</strong></p>")
            elseif x.name="nabstract" then
                response.Write( "<p>" & x.value & "...</p>")
            end if
        next
        response.Write("<p class='readmore'><a href='" & "showpage.asp?type=news&id=" & id & "'>继续阅读 &raquo;</a></p>")
        response.Write("</li>")
        rs.MoveNext
    loop
    response.Write("<a href='news.asp'>查看更多&raquo;</a></ul>")
    %>
