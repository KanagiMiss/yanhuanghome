<!-- #################################################just to keep online###################################################### -->
<%
if session("login_name")<>"" then
    response.Write("You are online, keep on!")
end if
%>