<!--#INCLUDE FILE="../class/clsUpload.asp"-->
<!--#INCLUDE FILE="../include/md5.asp"-->
<head>
    <meta charset="utf-8">
</head>
<%

if session("login_name")<>"" then
    Dim Folder
    Dim Upload
    Dim FileName
    Dim Ext
    Set Upload = New clsUpload
    Set fs=Server.CreateObject("Scripting.FileSystemObject")
    if Upload("file").Length <= 0 then
        response.Write("未选择文件或者未登录")
    else
        Folder = Application("uploadPath") & "/"
        Ext = fs.GetExtensionName(Upload("file").FileName)
        FileName = MD5(MD5(Now()) & MD5(session("login_name")) & MD5(Upload("file").FileName))&"."&Ext

        'Upload("file").SaveAs Folder & FileName

        Dim Connection
        Dim RecordSet
        Dim ConnectionString

        ConnectionString = Application("connectionString")

        Set Connection = Server.CreateObject("ADODB.Connection")
        Set RecordSet = Server.CreateObject("ADODB.Recordset")

        Connection.Open ConnectionString

        RecordSet.Open "files", Connection, 3, 3
        RecordSet.AddNew
        RecordSet.Fields("fname").Value = FileName
        RecordSet.Fields("fsize").Value = Upload.Fields("file").Length
        RecordSet.Fields("fdate").Value = Now()
        RecordSet.Fields("fuser").Value = session("login_name")
        RecordSet.Fields("ftype").Value = Upload.Fields("file").ContentType
        RecordSet.Fields("fcontent").AppendChunk Upload("file").BLOB & ChrB(0)
        RecordSet.Update
        RecordSet.Close

        Set RecordSet = Nothing
        Set Connection = Nothing
        response.Redirect("../files.asp")
    end if
    set fs=nothing
    Set Upload = Nothing
end if
%>