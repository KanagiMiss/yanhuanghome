<%
if Request("id")<>"" then
    response.expires=-1
    sql="SELECT tname,tcount,tlnum,tsnum FROM tels WHERE ID=" & Request("id") & ";"
    
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Application("dbPath")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    do until rs.EOF
        for each x in rs.Fields
            if x.name="tname" then
                tname=x.value
            elseif x.name="tcount" then
                tcount=x.value
            elseif x.name="tlnum" then
                tlnum=x.value
            elseif x.name="tsnum" then
                tsnum=x.value
            end if
        next
        rs.MoveNext
    loop
    rs.Close
    conn.Close
else
    response.Redirect("../" & session("current_manage_page") & "?action=goto&intpage=" & request("page"))
end if
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑部门电话</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter." />
    <meta name="author" content="travis" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/editor.css" rel="stylesheet" />
    <!-- wysihtml core javascript with default toolbar functions -->
    <script type="text/javascript" src="bower_components/wysihtml/dist/wysihtml5x-toolbar.min.js"></script>
    <!-- rules defining tags, attributes and classes that are allowed -->
    <script type="text/javascript" src="bower_components/wysihtml/parser_rules/advanced_and_extended.js"></script>
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
    <!--#include file="include/new-news.inc"-->
    <!--#include file="components/header.asp"-->
    <div class="container-fluid">
        <div class="row-fluid">
            <!--#include file="components/sidebar.asp"-->
            <div class="span9">
                <!-- toolbar with suitable buttons and dialogues -->
                <div class="row-fluid">
                    <div class="page-header">
                        <h1>
                            编辑部门电话</h1>
                    </div>
                    <form action="actions/updateitem.asp?type=tels&id=<%=Request("id") %>" method="post">
					<div class="controls">
                    <label class="control-label" for="name" style="font-size:20px;">部门名称</label>
                    <input type="text" class="input-xlarge" name="name" id="name" value="<%=tname%>" style="width:150px;"/>
                    </div>
                    <br />
                    <div class="controls">
                    <label class="control-label" for="count" style="font-size:20px;">号码数目</label>
                    <input type="text" class="input-xlarge" name="count" id="count" value="<%=tcount%>" style="width:150px;"/>
                    </div>
                    <br />
                    <div class="controls">
                    <label class="control-label" for="lnum" style="font-size:20px;">外线</label>
                    <input type="text" class="input-xlarge" name="lnum" id="lnum" value="<%=tlnum%>" style="width:250px;"/>
                    </div>
                    <br />
                    <div class="controls">
                    <label class="control-label" for="snum" style="font-size:20px;">外线</label>
                    <input type="text" class="input-xlarge" name="snum" id="snum" value="<%=tsnum%>" style="width:250px;"/>
                    </div>
                    <br />
					<input type="submit" class="btn btn-success btn-large" value="提交" />
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <!--#include file="components/footer.asp"-->
    </div>
    <script type="text/javascript">
        var editor = new wysihtml5.Editor("textarea", {
            toolbar: "toolbar",
            parserRules: wysihtml5ParserRules,
            stylesheets: "css/editor.css"
        });

    </script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
