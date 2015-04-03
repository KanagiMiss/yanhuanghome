<!-- ####################################################################################################### -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="2;url=../index.asp" /> 
</head>
    <%
    id = request.QueryString("err")
    if id="1" then
        response.Write("用户名或密码错误！")
    elseif id="2" then
        response.Write("用户名或密码填写不完整！")
    end if
    %>
