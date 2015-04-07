<%
if Request("type")<>"" and Request("id")<>"" then
    response.expires=-1
    Select Case Request("type")
	    case "news"
		    sql="UPDATE news SET ntitle='"&Request.Form("title")&"',ncontent='"&_
                Request.Form("content")&"',nabstract='"&Request.Form("abstract")&_
                "'"&" WHERE ID="&Request("id")&";"
	    case "notification"
		    sql="UPDATE notification SET ntitle='"&Request.Form("title")&"',ncontent='"&_
                Request.Form("content")&"'" & " WHERE ID="&Request("id")&";"
    end select

    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("../../data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    response.Redirect("../" & session("current_manage_page"))
end if
%>