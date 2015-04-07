<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title>个人资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/site.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function submitChange() {
            if ($("#email").val() == "") {
                alert("请输入email！");
                return;
            }
            if ($("#phone").val() == "") {
                alert("请输入电话号码！");
                return;
            }
            if ($("#pass").val() == "" || $("#repass").val() == "") {
                alert("请输入密码！");
                return;
            }
            if($("#pass").val() != $("#repass").val()){
                alert("两次密码输入不一致！");
                return;
            }
            $.ajax({
                type: 'POST',
                url: "actions/changeinfo.asp",
                data: {
                    name: $("#name").val(),
                    email: $("#email").val(),
                    phone: $("#phone").val(),
                    pass: $("#pass").val()
                },
                success: function (data) {
                    if (data == "success") {
                        alert("修改成功！");
                        $(window.location).attr('href', 'index.asp');
                    }
                    else {
                        alert("系统内部错误！");
                    }
                }
            });
        }
    </script>
  </head>
  <body>
    <!--#include file="include/my-profile.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>我的资料<small>修改资料</small></h1>
			</div>
            <%
            response.expires=-1
            sql="SELECT uname,uemail,uphone,upass FROM users WHERE uname='"&session("login_name")&"'"
            set conn=Server.CreateObject("ADODB.Connection")
            conn.Provider=Application("dbProvider")
            url = Server.Mappath("../data/main.mdb")
            conn.Open(url)
            set rs=Server.CreateObject("ADODB.recordset")
            rs.Open sql,conn,1,3
            do until rs.EOF
                for each x in rs.Fields
                    if x.name="uname" then
                        uname=x.value
                    elseif x.name="uemail" then
                        uemail=x.value
                    elseif x.name="uphone" then
                        uphone=x.value
                    elseif x.name="upass" then
                        upass=x.value
                    end if
                next
                rs.MoveNext
            loop
             %>
			<div id="info_form" class="form-horizontal">
			    <fieldset>
				    <div class="control-group">
					    <label class="control-label" for="name">用户名</label>
					    <div class="controls">
						    <input type="text" class="input-xlarge" id="name" name= "name" disabled="disabled" value="<%=session("login_name")%>" />
					    </div>
				    </div>
				    <div class="control-group">
					    <label class="control-label" for="email">E-mail</label>
					    <div class="controls">
						    <input type="text" class="input-xlarge" id="email" name="email" value="<%=uemail%>"/>
					    </div>
				    </div>
				    <div class="control-group">
					    <label class="control-label" for="phone">电话</label>
					    <div class="controls">
						    <input type="text" class="input-xlarge" id="phone" name="phone" value="<%=uphone%>"/>
					    </div>
				    </div>
				    <div class="control-group">
					    <label class="control-label" for="pass">密码</label>
					    <div class="controls">
						    <input type="password" class="input-xlarge" id="pass" name="pass" value="<%=upass%>" />
					    </div>
				    </div>
                    <div class="control-group">
					    <label class="control-label" for="repass">确认密码</label>
					    <div class="controls">
						    <input type="password" class="input-xlarge" id="repass" name="repass" value="<%=upass%>" />
					    </div>
				    </div>
				    <div class="form-actions">
					    <input type="submit" class="btn btn-success btn-large" onclick="submitChange()" value="确认修改" /> <a class="btn" href="index.asp">取消</a>
				    </div>
			    </fieldset>
			</div>
		  </div>
        </div>
      </div>

      <hr />

      <!--#include file="components/footer.asp"-->

    </div>
  </body>
</html>
