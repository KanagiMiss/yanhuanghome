<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>炎黄职业技术学院</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
</head>
<body>
    <!--#include file="include/service.inc"-->
    <!--#include file="components/header.asp"-->
    <!--#include file="components/navi.asp"-->
    <!-- ####################################################################################################### -->
    <div class="wrapper col3">
        <div id="container">
            <div id="content">
                <h1>
                    <a name="cal">炎黄校历</a></h1>
                <img class="imgr" src="images/service/xiaoli.jpg" alt="" width="600" height="787" />
                <br />
                <h1>
                    <a name="tel">办公电话</a>
                </h1>
                <table summary="Summary Here" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>
                                部门
                            </th>
                            <th>
                                外线
                            </th>
                            <th>
                                内线
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                    response.expires=-1
                    sql="SELECT tname,tlnum,tsnum FROM tels"

                    set conn=Server.CreateObject("ADODB.Connection")
                    conn.Provider=Application("dbProvider")
                    url = Server.Mappath("data/main.mdb")
                    conn.Open(url)
                    set rs=Server.CreateObject("ADODB.recordset")
                    rs.Open sql,conn
                    
                    dim light,num
                    light = true
                    do until rs.EOF
                        if light=true then
                            response.write("<tr class='light'>")
                            light=false
                        else
                            response.write("<tr class='dark'>")
                            light=true
                        end if
                        for each x in rs.Fields
                            response.Write("<td>")
                            if x.name="tlnum" or x.name="tsnum" then
                                nums = split(x.value,"|",-1)
                                for each n in nums
                                    response.write("<p>" & n & "</p>")
                                next
                            else
                                response.Write("<p>" & x.value & "</p>")
                            end if
                            response.Write("</td>")
                        next
                        response.write("</tr>")
                        rs.MoveNext
                    loop
                        %>
                    </tbody>
                </table>
                <br />
                <h1>
                    <a name="res">机房预约</a>
                </h1>
                    <a href="http://58.193.58.51/login/index.html">点我进入机房预约</a>
                <br />
                <br />
                <h1>
                    <a name="sal">工资查询</a>
                </h1>
                    <a href="http://dep.yhust.edu.cn:8080/gz/index.php">点我进入工资查询</a>
                <br />
                <br />
                <h1>
                    <a name="zfgl">正方教务管理</a>
                </h1>
                    <a href="http://ea.yhust.edu.cn/">点我进入正方教务管理</a>
                <br />
                <br />
                <h1>
                    <a name="data">数据采集平台</a>
                </h1>
                    <a href="http://58.193.58.48/login.aspx">点我进入数据采集平台</a>
                <br />
                <br />
                <h1>
                    <a name="map">校园地图</a>
                </h1>
                    <img class="imgr" src="images/service/map.jpg" alt="" width="550" height="634" />
                <br />
            </div>
            <div id="column">
                <div class="subnav">
                    <h2>
                        公共服务</h2>
                    <ul>
                        <li><a href="#cal">炎黄校历</a></li>
                        <li><a href="#tel">办公电话</a></li>
                        <li><a href="#res">机房预约</a></li>
                        <li><a href="#sal">工资查询</a></li>
                        <li><a href="#zfgl">正方教务管理</a></li>
                        <li><a href="#data">数据采集平台</a></li>
                        <li><a href="#map">校园地图</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <!-- ####################################################################################################### -->
    <!--#include file="components/footer.asp"-->
</body>
</html>
