<!-- ####################################################################################################### -->
<%
if Request("type")<>"" and Request("id")<>"" then
    response.expires=-1
    Select Case Request("type")
	    case "news"
		    sql="DELETE FROM news WHERE ID=" & Request("id") & ";"
	    case "notification"
		    sql="DELETE FROM notification WHERE ID=" & Request("id") & ";"
    end select

    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("../../data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    if(request("page") < 0) then
        response.Redirect("../" & "index.asp")
    else
        response.Redirect("../" & session("current_manage_page") & "?action=goto&intpage=" & request("page"))
    end if
end if
%>