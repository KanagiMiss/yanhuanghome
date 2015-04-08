<%
sub getActive(curr)
if Session("curr_panel_page")=curr then
    response.write("active")
end if
end sub
%>

<div class="span3">
    <div class="well sidebar-nav">
        <ul class="nav nav-list">
            <li class="nav-header"><i class="icon-wrench"></i>数据管理</li>
            <li class="<%call getActive("新闻管理")%>"><a href="news.asp">新闻管理</a></li>
            <li class="<%call getActive("通知管理")%>"><a href="notification.asp">通知管理</a></li>
            <li class="<%call getActive("文件管理")%>"><a href="files.asp">文件管理</a></li>
            <li class="nav-header"><i class="icon-signal"></i>统计</li>
            <li class="<%call getActive("概览")%>"><a href="stats.asp">概览</a></li>
            <li class="<%call getActive("用户")%>"><a href="user-stats.asp">用户</a></li>
            <li class="<%call getActive("访问量")%>"><a href="visitor-stats.asp">访问量</a></li>
            <li class="nav-header"><i class="icon-user"></i>个人信息</li>
            <li class="<%call getActive("修改资料")%>"><a href="my-profile.asp">我的资料</a></li>
            <li><a href="actions/logout.asp">注销登录</a></li>
        </ul>
    </div>
</div>
