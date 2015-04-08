<%
if Request("type")<>"" and Request("id")<>"" then
    response.expires=-1
    Select Case Request("type")
	    case "news"
		    sql="SELECT ntitle,ndate,ncontent,nabstract FROM news WHERE ID=" & Request("id") & ";"
	    case "notification"
		    sql="SELECT ntitle,ndate,ncontent FROM notification WHERE ID=" & Request("id") & ";"
    end select
    
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider=Application("dbProvider")
    url = Server.Mappath("../data/main.mdb")
    conn.Open(url)
    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open sql,conn,1,3
    
    do until rs.EOF
        for each x in rs.Fields
            if x.name="ntitle" then
                ntitle=x.value
            elseif x.name="ndate" then
                ndate=x.value
            elseif x.name="ncontent" then
                ncontent=x.value
            elseif x.name="nabstract" then
                nabstract=x.value
            end if
        next
        rs.MoveNext
    loop
    rs.Close
    conn.Close
else
    response.Redirect("../" & session("current_manage_page") & "?action=goto&intpage=" & request("page"))
end if
sub small_title()
    if Request("type")="news" then
        response.Write("新闻") 
    elseif Request("type")="notification" then
        response.Write("通知")
    end if
end sub
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑新闻 | Strass</title>
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
    <script type="text/javascript">
        var formSubmitting = false;
        var setFormSubmitting = function () { formSubmitting = true; }

        window.onbeforeunload = function () {
            if (formSubmitting) {
                return undefined;
            }
            if ($("#textarea").val() != "" || $("#title").val() != "") {
                return '注意，您将离开本页面（未保存的数据会消失）';
            }
        }
    </script>
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
                            编辑文章 <small><%call small_title()%></small></h1>
                    </div>
                    <form action="actions/updateitem.asp?type=<%=Request("type") %>&id=<%=Request("id") %>" method="post" onsubmit="setFormSubmitting()">
					<div class="controls">
                    <label class="control-label" for="title" style="font-size:20px;">标题</label>
                    <input type="text" class="input-xlarge" name="title" id="title" value="<%=ntitle %>" style="width:80%;"/>
                    </div>
                    <div id="toolbar">
                    <div class="block">
                        <a data-wysihtml5-command="bold" title="CTRL+B" class="bold"></a>
                        <a data-wysihtml5-command="italic" title="CTRL+I" class="italic"></a>
                        <a data-wysihtml5-command="underline" title="CTRL+U" class="underline"></a>
                        <a data-wysihtml5-command="superscript" title="sup" class="superscript"></a>
                        <a data-wysihtml5-command="subscript" title="sub" class="subscript"></a>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="createLink" class="link"></a>
                        <div class="dialog">
                            <div data-wysihtml5-dialog="createLink" style="display:none;">
                                <label>
                                    网址:
                                    <input data-wysihtml5-dialog-field="href" value="http://">
                                </label>
                                <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
                            </div>
                        </div>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="insertImage" class="image"></a>
                        <div class="dialog">
                            <div data-wysihtml5-dialog="insertImage" style="display: none;">
                                <label>
                                    图片:
                                    <input data-wysihtml5-dialog-field="src" value="<%="http://"&Application("domain")&"/actions/download.asp?fid="%>">
                                </label>
                                <label>
                                    对齐:
                                    <select data-wysihtml5-dialog-field="className">
                                        <option value="">默认</option>
                                        <option value="wysiwyg-float-left">左对齐</option>
                                        <option value="wysiwyg-float-right">右对齐</option>
                                    </select>
                                </label>
                                <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
                            </div>
                        </div>
                    </div>
                    <!--
                    <a data-wysihtml5-command="removeLink" class="unlink">
                        <s>link</s>
                    </a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1">h1</a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2">h2</a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h3">h3</a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="p">p</a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="pre">pre</a> 
                    <a data-wysihtml5-command="formatBlock" data-wysihtml5-command-blank-value="true">plaintext</a>'
                    <a data-wysihtml5-command="insertBlockQuote">blockquote</a>
                    <a data-wysihtml5-command="formatCode" data-wysihtml5-command-value="language-html">Code</a>
                        -->
                    <div class="block">
                        <a data-wysihtml5-command="fontSizeStyle" class="fontsize"></a>
                        <div class="dialog">
                            <div data-wysihtml5-dialog="fontSizeStyle" style="display: none;">
                                字体大小:
                                <input type="text" data-wysihtml5-dialog-field="size" style="width: 60px;" value="" />
                                <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
                            </div>
                        </div>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="insertUnorderedList" class="listbullet"></a> 
                        <a data-wysihtml5-command="insertOrderedList" class="listnumber"></a>
                    </div>
                    <div class="block" style="display:none;">
                        <a data-wysihtml5-command="outdentList">&lt;-</a> <a data-wysihtml5-command="indentList">
                            -&gt;</a>
                    </div>
                    <div class="block" style="display:none;">
                        <a data-wysihtml5-command="justifyLeft">justifyLeft</a> 
                        <a data-wysihtml5-command="justifyRight">justifyRight</a> 
                        <a data-wysihtml5-command="justifyFull">justifyFull</a>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="alignLeftStyle" class="alignleft"></a> 
                        <a data-wysihtml5-command="alignRightStyle" class="alignright"></a> 
                        <a data-wysihtml5-command="alignCenterStyle" class="aligncenter"></a>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="foreColorStyle" class="forecolor"></a>
                        <div class="dialog">
                            <div data-wysihtml5-dialog="foreColorStyle" style="display: none;">
                                字体颜色:
                                <input type="text" data-wysihtml5-dialog-field="color" value="rgba(0,0,0,1)" />
                                <a data-wysihtml5-dialog-action="save">确认</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
                            </div>
                        </div>
                    </div>
                    <div class="block" style="display:none;">
                        <a data-wysihtml5-command="bgColorStyle" class="bgcolor"></a>
                        <div class="dialog">
                            <div data-wysihtml5-dialog="bgColorStyle" style="display: none;">
                                背景颜色:
                                <input type="text" data-wysihtml5-dialog-field="color" value="rgba(0,0,0,1)" />
                                <a data-wysihtml5-dialog-action="save">确认</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
                            </div>
                        </div>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-command="undo" class="undo"></a> 
                        <a data-wysihtml5-command="redo" class="redo"></a>
                    </div>
                    <div class="block">
                        <a data-wysihtml5-action="change_view" class="html"></a>
                    </div>
                    </div>
                    <!-- element to edit -->
                    <textarea id="textarea" name="content" placeholder="输入内容 ..."><%=ncontent %></textarea>
                    <%
                    if Request("type")="news" then
                        response.Write("<div class='controls'><label class='control-label' for='abstract' style='font-size:20px;'>摘要</label>"&_
                                       "<input type='text' class='input-xlarge' name='abstract' id='abstract' value='"&nabstract&"' style='width:80%;'/></div>")
                    end if
                     %>
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
