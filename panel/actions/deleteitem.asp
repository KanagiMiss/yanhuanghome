<!-- ####################################################################################################### -->
<!--#INCLUDE FILE="../class/clsUpload.asp"-->
<%
if Request("type")<>"" and Request("id")<>"" and Session("login_name")<>"" then
    response.expires=-1
    Select Case Request("type")
	    case "news"
		    sql="DELETE FROM news WHERE ID=" & Request("id") & ";"
            url=Application("dbPath")
	    case "notification"
		    sql="DELETE FROM notification WHERE ID=" & Request("id") & ";"
            url=Application("dbPath")
        case "visitors"
		    sql="DELETE FROM visitors WHERE ID=" & Request("id") & ";"
            url=Application("dbPath")
        case "files"
            if Request("fin")="no" then
                dim fs
                Set fs=Server.CreateObject("Scripting.FileSystemObject")
                FilePath = fs.BuildPath(Application("uploadPath"), Request.QueryString("user"))
                FilePath = fs.BuildPath(FilePath, request("name"))
                if fs.FileExists(FilePath) then
                  fs.DeleteFile(FilePath)
                end if
                set fs=nothing
            end if
            sql="DELETE FROM files WHERE ID=" & Request("id") & ";"
            if session("isdebug")="yes" then
                url=session("filedb")
            else
                url=Application("auxDbPath")
            end if
    end select

    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
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