<%If Session("islogin")="yes" Then %>
<!--#include file="header_login.asp"-->
<%Else %>
<!--#include file="header_logout.asp"-->
<%End If %>