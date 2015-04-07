<%
if session("islogin")<>"yes" then
    response.Redirect("../index.asp")
end if
 %>
<script type="text/javascript">
    function keepalive() {
        $.get("actions/keeponline.asp", function (data, status) {
        });
    }
    timeId = setInterval("keepalive();", 60000);
</script>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </a><a class="brand" href="#">炎黄后台管理</a>
            <div class="btn-group pull-right">
                <a class="btn" href="my-profile.asp"><i class="icon-user"></i> <%response.Write(session("login_name"))%> </a> <a class="btn dropdown-toggle"
                    data-toggle="dropdown" href="#"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="my-profile.asp">个人资料</a></li>
                    <li class="divider"></li>
                    <li><a href="actions/logout.asp">退出后台</a></li>
                </ul>
            </div>
            <div class="nav-collapse">
                <ul class="nav">
                    <li><a href="index.asp">主页</a></li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">新闻
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="new-news.asp">新建新闻</a></li>
                            <li class="divider"></li>
                            <li><a href="news.asp">新闻管理</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">通知
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="new-notification.asp">新建通知</a></li>
                            <li class="divider"></li>
                            <li><a href="notification.asp">通知管理</a></li>
                        </ul>
                    </li>
                    <li><a href="stats.asp">统计</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
