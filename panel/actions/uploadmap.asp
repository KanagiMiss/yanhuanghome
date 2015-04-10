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
    elseif Upload("file").Length > 10485760 then
        response.Write("文件大小超过限制")
    else
        FilePath = fs.BuildPath(Application("rootPath"),"images")
        FilePath = fs.BuildPath(FilePath,"service")
        FilePath = fs.BuildPath(FilePath, "map.jpg")
        Upload("file").SaveAs FilePath
        response.Redirect("../map.asp")
    end if
    set fs=nothing
    Set Upload = Nothing
end if
%>