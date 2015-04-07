<%
if Request.Form("name")<>"" and Request.Form("email")<>"" and Request.Form("phone")<>"" and Request.Form("pass")<>"" and session("login_name")<>"" then
    response.expires=-1
    sql="UPDATE users SET upass='"&Request.Form("pass")&"',uemail='"&Request.Form("email")&_
        "',uphone='"&Request.Form("phone")&"' WHERE uname='"&Request.Form("name")&"'"
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("../../data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    response.Write("success")
end if
%>