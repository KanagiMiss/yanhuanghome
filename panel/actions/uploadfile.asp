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
    Dim Inside,Secret
    Set Upload = New clsUpload
    Set fs=Server.CreateObject("Scripting.FileSystemObject")
    if Upload("file").Length <= 0 then
        response.Write("未选择文件或者未登录")
    elseif Upload("file").Length > 10485760 then
        response.Write("文件大小超过限制")
    else
        FilePath = fs.BuildPath(Application("uploadPath"), session("login_name"))
        if not fs.FolderExists(FilePath) then
            fs.CreateFolder(FilePath)
        end if
        Ext = fs.GetExtensionName(Upload("file").FileName)
        FileName = MD5(MD5(Now()) & MD5(session("login_name")) & MD5(Upload("file").FileName))&"."&Ext
        FilePath = fs.BuildPath(FilePath, FileName)
        if fs.GetBaseName(Upload("file").FileName)="moeru_neko_secret" then
            Secret = true
        else
            Secret = false
        end if

        if Upload.Fields("file").Length>1048576 then
            Inside = false
        else
            Inside = true
        end if

        if not Inside then
            Upload("file").SaveAs FilePath
        end if

        Dim Connection
        Dim RecordSet
        Dim ConnectionString

        if session("isdebug")="yes" then
            ConnectionString = session("constr")
        else
            ConnectionString = Application("auxConnectionString")
        end if
        

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
        RecordSet.Fields("finside").Value = Inside
        RecordSet.Fields("fsecret").Value = Secret
        if Inside then
            RecordSet.Fields("fcontent").AppendChunk Upload("file").BLOB & ChrB(0)
        end if
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