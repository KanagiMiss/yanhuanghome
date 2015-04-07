<!-- ####################################################################################################### -->
<%
if Request.Form("title")<>"" and Request.Form("abstract")<>"" and session("login_name")<>"" and Request.Form("content")<>"" then
    response.expires=-1
    sql="INSERT INTO news(ntitle,nauthor,ndate,nabstract,ncontent) values('"&_
        Request.Form("title")&"','"&session("login_name")&"',"&_
        "Now()"&",'"&Request.Form("abstract")&"','"&Request.Form("content")&"');"
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("../../data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    response.Redirect("../news.asp")
end if
%>