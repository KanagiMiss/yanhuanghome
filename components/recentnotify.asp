<!-- ####################################################################################################### -->
    <%
    response.Write("<ul>")
    response.expires=-1
    sql="SELECT TOP 6 ID,ntitle,ndate FROM notification ORDER BY notification.ndate DESC;"

    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn
                    
    do until rs.EOF
        response.Write("<li>")
        for each x in rs.Fields
            if x.name="ID" then
                id=x.value
                response.Write("<p><strong><a href='showpage.asp?type=notify&id=" & id & "'>")
            elseif x.name="ntitle" then
                response.Write( x.value & "</a></strong>")
            elseif x.name="ndate" then
                dt = CDate(x.value)
                response.Write("<span class='date'><strong>" & DatePart("yyyy",dt) & "-"_ 
                                             & Right("0" & DatePart("m",dt), 2) & "-"_ 
                                             & Right("0" & DatePart("d",dt), 2) & "</strong></span></p>")
            end if
        next
        response.Write("</li>")
        rs.MoveNext
    loop
    response.Write("<a href='notification.asp'>查看更多&raquo;</a></ul>")
    %>