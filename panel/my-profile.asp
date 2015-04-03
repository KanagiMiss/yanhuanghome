<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>个人资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
			<form class="form-horizontal">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="name">用户名</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="name" disabled="disabled" value="Admin" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email">E-mail</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="email" value="travis@provider.com" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phone">电话</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="phone" value="xxx-xxx-xxxx" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="pass">密码</label>
						<div class="controls">
							<input type="password" class="input-xlarge" id="pass" value="My City" />
						</div>
					</div>
                    <div class="control-group">
						<label class="control-label" for="repass">确认密码</label>
						<div class="controls">
							<input type="password" class="input-xlarge" id="repass" value="My City" />
						</div>
					</div>
					<div class="form-actions">
						<input type="submit" class="btn btn-success btn-large" value="确认修改" /> <a class="btn" href="users.html">取消</a>
					</div>					
				</fieldset>
			</form>
		  </div>
        </div>
      </div>

      <hr />

      <!--#include file="components/footer.asp"-->

    </div>

    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </body>
</html>
