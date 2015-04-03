<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>炎黄主站后台</title>
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
    <!--#include file="include/index.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
          <div class="well hero-unit">
            <h1>欢迎, <%response.Write(session("login_name"))%></h1>
            <p>本后台管理系统还在测试中，如果有BUG请汇报。初次登陆请尽快修改密码，如果你的密码太短太简单，也请赶紧更改。</p>
            <p><a class="btn btn-success btn-large" href="my-profile.asp">点我修改个人资料 &raquo;</a></p>
          </div>
          <div class="row-fluid">
            <div class="span3">
              <h3>新闻总数</h3>
              <p><a href="users.html" class="badge badge-inverse">563</a></p>
            </div>
            <div class="span3">
              <h3>今日新闻</h3>
              <p><a href="users.html" class="badge badge-inverse">8</a></p>
            </div>
            <div class="span3">
              <h3>通知总数</h3>
			  <p><a href="users.html" class="badge badge-inverse">2</a></p>
            </div>
            <div class="span3">
              <h3>今日通知</h3>
			  <p><a href="roles.html" class="badge badge-inverse">3</a></p>
            </div>
          </div>
		  <br />
		  <div class="row-fluid">
			<div class="page-header">
				<h1>今天的成果<small>可以查看或者修改</small></h1>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>E-mail</th>
						<th>Phone</th>
						<th>City</th>
						<th>Role</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<tr class="pending-user">
					<td>564</td>
					<td>John S. Schwab</td>
					<td>johnschwab@provider.com</td>
					<td>402-xxx-xxxx</td>
					<td>Bassett, NE</td>
					<td>User</td>
					<td><span class="label label-important">Inactive</span></td>
					<td><span class="user-actions"><a href="javascript:void(0);" class="label label-success">Approve</a> <a href="javascript:void(0);" class="label label-important">Reject</a></span></td>
				</tr>
				<tr class="pending-user">
					<td>565</td>
					<td>Juliana M. Sheffield</td>
					<td>julianasheffield@provider.com</td>
					<td>803-xxx-xxxx</td>
					<td>Columbia, SC</td>
					<td>User</td>
					<td><span class="label label-important">Inactive</span></td>
					<td><span class="user-actions"><a href="javascript:void(0);" class="label label-success">Approve</a> <a href="javascript:void(0);" class="label label-important">Reject</a></span></td>
				</tr>
				</tbody>
			</table>
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
