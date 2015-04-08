<%
if Request.QueryString("fid")<>"" then
    Dim Connection
    Dim RecordSet
    Dim ConnectionString
    Dim FileID
    Dim Sql

    ConnectionString = Application("connectionString")

    FileID = Request.QueryString("fid")


    Set Connection = Server.CreateObject("ADODB.Connection")
    Set RecordSet = Server.CreateObject("ADODB.Recordset")

    Connection.Open ConnectionString

    Sql = "SELECT fname,ftype,fcontent FROM files WHERE ID=" & FileID

    RecordSet.Open Sql, Connection, 3, 3

    Response.Expires = 0 
    Response.Buffer = TRUE 
    Response.Clear 
    If Not RecordSet.EOF Then
        if Request.QueryString("type")="dl" then
            Response.AddHeader "content-disposition", "attachment; filename=" & RecordSet("fname")
        end if
        'Response.AddHeader "content-length", RecordSet("fcontent").ActualSize 'has bug here
        Response.ContentType = RecordSet("ftype")
        Response.BinaryWrite RecordSet("fcontent")
    Else
        Response.Write("File could not be found")
    End If

    RecordSet.Close
    Connection.Close

    Set RecordSet = Nothing
    Set Connection = Nothing
end if
%>
