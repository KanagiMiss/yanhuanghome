<%
if Request.Form("name")<>"" and Request.Form("count")<>"" and Request.Form("lnum")<>"" and Request.Form("snum")<>"" then
    response.expires=-1
    sql="INSERT INTO tels(tname,tcount,tlnum,tsnum) values('"&_
        Request.Form("name")&"',"&Request.Form("count")&",'"&Request.Form("lnum")&"','"&Request.Form("snum")&"')"
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Application("dbPath")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    response.Redirect("../tels.asp")
else
    response.Write("incomplete!")
end if
%>