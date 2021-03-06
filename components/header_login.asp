﻿<%
sub getActive(curr)
if Session("curr_page")=curr then
    response.write("active")
end if
end sub
'response.Write(session.Timeout)
'response.Write(Session("client_ip"))
%>
<div class="wrapper col0">
  <div id="topbar">
    <div id="loginpanel">
      <ul>
        <li class="left">欢迎您回来，</li>
        <li class="right"><a href="panel/index.asp"><%=Session("login_name") %></a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1 navi-fixed-top">
  <div id="header">
    <div id="logo">
      <!--<h1>炎黄职业技术学院</a></h1>
      <p>Progenitor Vocational & Technical College</p>-->
      <a href="http://<%=Application("domain")%>"><i class="logo"></i></a>
    </div>
    <div id="topnav">
      <ul>
        <li class="menu_class <%call getActive("主页")%>"><a class="topmenu" href="index.asp">首页</a></li>
        <li class="menu_class <%call getActive("学院概况")%>">
            <a class="popmenu" href="introduce.asp">学院概况</a>
            <ul class="submenu_class">
            <li><a href='introduce.asp#intro'>学院简介</a></li>
            <li><a href='introduce.asp#creator'>创办人简介</a></li>
            <li><a href='introduce.asp#leader'>现任领导</a></li>
            <li><a href='introduce.asp#feature'>办学特色</a></li>
            <li><a href='introduce.asp#prof'>教授风采</a></li>
            <li><a href='introduce.asp#songs'>校歌校训</a></li>
            </ul>
        </li>
        <li class="menu_class <%call getActive("管理部门")%>">
            <a class="popmenu" href="manage.asp">管理部门</a>
            <ul class="submenu_class">
            <li><a href='http://jwc.yhust.edu.cn/'>教务处</a></li>
            <li><a href='http://dep.yhust.edu.cn/xsc/'>学生处</a></li>
            <li><a href='http://dep.yhust.edu.cn/person/'>人事室</a></li>
            <li><a href='http://zwc.yhust.edu.cn/'>总务处</a></li>
            </ul>
        </li>
        <li class="menu_class <%call getActive("教学单位")%>">
            <a class="popmenu" href="teaching.asp">教学单位</a>
            <ul class="submenu_class">
            <li><a href='http://dep.yhust.edu.cn/civil/'>建筑工程系</a></li>
            <li><a href='http://dep.yhust.edu.cn/em/'>机电工程系</a></li>
            <li><a href='http://dep.yhust.edu.cn/ei/'>信息工程系</a></li>
            <li><a href='http://dep.yhust.edu.cn/eb/'>经济贸易系</a></li>
            <li><a href='http://dep.yhust.edu.cn/travel/'>旅游管理系</a></li>
            <li><a href='http://dep.yhust.edu.cn/fl/'>实用英语系</a></li>
            </ul>
        </li>
        <li class="menu_class <%call getActive("教学科研")%>">
            <a class="topmenu" href='http://58.193.58.170:8080/wk/sxzx'>实训中心</a>
        </li>
        <li class="menu_class <%call getActive("学生工作")%>">
            <a class="topmenu" href="http://dep.yhust.edu.cn/xsc/">学生工作</a>
        </li>
        <li class="menu_class <%call getActive("招生就业")%>">
            <a class="topmenu" href="http://zs.yhust.edu.cn/">招生就业</a>
        </li>
        <li class="last menu_class <%call getActive("公共服务")%>">
            <a class="popmenu" href="service.asp" class="menu">公共服务</a>
            <ul class="submenu_class">
            <li><a href='service.asp#cal'>炎黄校历</a></li>
            <li><a href='service.asp#tel'>办公电话</a></li>
            <li><a href='http://58.193.58.51/login/index.html'>机房预约</a></li>
            <li><a href='http://dep.yhust.edu.cn:8080/gz/index.php'>工资查询</a></li>
            <li><a href='http://dep.yhust.edu.cn/lib/'>图书馆</a></li>
            <li><a href='http://ea.yhust.edu.cn/'>正方教务</a></li>
            <li><a href='http://58.193.58.48/login.aspx'>数据采集</a></li>
            <li><a href='service.asp#map'>校园地图</a></li>
            </ul>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!--[if IE]>
       <style>
            #topnav{
                height:48px;
            }
            #topnav .menu_class {
                zoom:1;
            }
            #topnav .submenu_class {
                position:relative;
            }
       </style>
<![endif]-->
<script type="text/javascript">
    $(document).ready(function () {
        $(".menu_class").hover(
          function () {
              $(this).children("ul.submenu_class").slideDown('medium');
          },
          function () {
              $(this).children("ul.submenu_class").slideUp('medium');
          }
      );
    });

    $(".submenu_class li").hover(
        function () {
            $(this).children("ul").slideDown('medium');
        },
        function () {
            $(this).children("ul").slideUp('medium');
        }
    );

    function keepalive() {
        $.get("actions/keeponline.asp", function (data, status) {
        });
    }
    timeId = setInterval("keepalive();", 60000);
</script>