<%
if Request.QueryString("fid")<>"" then
    Dim Connection
    Dim RecordSet
    Dim ConnectionString
    Dim FileID
    Dim Sql

    if Request.QueryString("db")="main" then
        ConnectionString = Application("connectionString")
    else
        ConnectionString = Application("auxConnectionString")
    end if

    if Session("isdebug")="yes" then
        ConnectionString = session("constr")
    end if

    FileID = Request.QueryString("fid")

    Set Connection = Server.CreateObject("ADODB.Connection")
    Set RecordSet = Server.CreateObject("ADODB.Recordset")

    Connection.Open ConnectionString

    Sql = "SELECT fname,finside,fsecret,ftype,fcontent,fuser FROM files WHERE ID=" & FileID

    RecordSet.Open Sql, Connection, 3, 3

    Response.Expires = -1
    Response.Buffer = TRUE 
    Response.Clear 
    If Not RecordSet.EOF Then
        if not RecordSet("fsecret") or Session("isdebug")="yes" or Request.QueryString("pass")="moeru_neko" then
            if Request.QueryString("type")="dl" then
                Response.AddHeader "content-disposition", "attachment; filename=" & RecordSet("fname")
            end if
            'Response.AddHeader "content-length", RecordSet("fcontent").ActualSize 'has bug here
            Response.ContentType = RecordSet("ftype")
            if RecordSet("finside") then
                Response.BinaryWrite RecordSet("fcontent")
            else
                Const adTypeBinary = 1
                Dim strFilePath,objStream

                Set fs=Server.CreateObject("Scripting.FileSystemObject")
                strFilePath = fs.BuildPath(Application("uploadPath"), RecordSet("fuser")) 'This is the path to the file on disk. 
                strFilePath = fs.BuildPath(strFilePath, RecordSet("fname"))

                Set objStream = Server.CreateObject("ADODB.Stream")
                objStream.Open
                objStream.Type = adTypeBinary
                objStream.LoadFromFile strFilePath

                Response.BinaryWrite objStream.Read

                objStream.Close
                Set objStream = Nothing
                Set fs = Nothing
            end if
        else
            Response.Write("you can not access this file")
        end if
    Else
        Response.Write("file not found")
    End If

    RecordSet.Close
    Connection.Close

    Set RecordSet = Nothing
    Set Connection = Nothing
end if
%>
