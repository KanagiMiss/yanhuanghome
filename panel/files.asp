<%
session("current_manage_page")="files.asp"
 %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>文件管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="js/jquery-ui-1.11.4.green/jquery-ui.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>

  <body>
    <!--#include file="include/files.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>文件列表 <small>所有文件</small></h1>
			</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>ID</th>
                        <th>文件名</th>
                        <th>文件类型</th>
                        <th>大小</th>
						<th>上传时间</th>
						<th>上传者</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
                <%
                response.expires=-1
                sql="SELECT ID,fname,ftype,fsize,fdate,fuser,finside,fsecret FROM files ORDER BY files.ID DESC;"

                set conn=Server.CreateObject("ADODB.Connection")
                conn.Provider=Application("dbProvider")
                conn.CursorLocation = 3
                if session("isdebug")="yes" then
                    url=session("filedb")
                else
                    url=Application("auxDbPath")
                end if
                conn.Open(url)
                set rs=Server.CreateObject("ADODB.recordset")
                rs.Open sql,conn

                if not rs.EOF or not rs.BOF then
                    rs.PageSize=10

                    intPageCount = rs.PageCount

                    Select Case Request("action")
                        case "goto"
                            topage=Request("intpage")+0
                            if topage < 1 then
                                intpage = 1
                            elseif topage > intPageCount then
                                intpage = intPageCount
                            else
                                intpage = topage
                            end if
	                    case "first"
		                    intpage = 1
	                    case "prev"
		                    intpage = Request("last")-1
		                    if intpage < 1 or intpage > intPageCount then intpage = 1
	                    case "next"
		                    intpage = Request("last")+1
		                    if intpage < 1 or intpage > intPageCount then intpage = intPageCount
	                    Case "last"
		                    intpage = intPageCount
	                    case else
		                    intpage = 1
                    end select

                    rs.AbsolutePage = intPage 
                    Dim fs
                    Set fs=Server.CreateObject("Scripting.FileSystemObject")
                    if Session("isdebug")="yes" then
                        allist=true
                    else
                        allist=false
                    end if
                    For intRecord = 1 To rs.PageSize
                        if not rs.Fields(7).value or allist then 'check if secret
                            fin="no"
                            response.Write("<tr class='list-files'>")
                            for each x in rs.Fields
                                if x.name="ID" then
                                    id=x.value
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="fname" then
                                    name=x.value
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="ftype" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="fsize" then
                                    response.Write("<td>" & formatnumber(x.value/1024,2,true) & "KB </td>")
                                elseif x.name="fdate" then
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="fuser" then
                                    user=x.value
                                    response.Write("<td>" & x.value & "</td>")
                                elseif x.name="finside" then
                                    if x.value then
                                        fin="yes"
                                    end if
                                end if
                            next
                            response.Write("<td><div class='btn-group'><a class='btn btn-mini dropdown-toggle'" &_
                                           " data-toggle='dropdown' href='#'>操作<span class='caret'></span></a>" &_
							               "<ul class='dropdown-menu'>" &_
                                           "<li><a href='#' onclick='copyUrl("&id&")'><i class='icon-info-sign'></i> 文件地址 </a></li>" &_
                                           "<li><a href='actions/download.asp?fid="&id&"'><i class='icon-file'></i> 查看 </a></li>" &_
                                           "<li><a href='actions/download.asp?type=dl&fid="&id&"'><i class='icon-download'></i> 下载 </a></li>" &_
								           "<li><a href='actions/deleteitem.asp?type=files&user="&user&"&fin="&fin&"&name="&name&"&id=" & id & "&page=" & intpage & "'><i class='icon-trash'></i> 删除 </a></li>" &_
							               "</ul></div></td>")
                            response.Write("</tr>")
                        end if
                        rs.MoveNext
                        If rs.EOF Then Exit For
                    next
                    set fs=nothing
                end if
                %>
				</tbody>
			</table>
			<div class="pagination">
				<ul>
                    <li><a href="files.asp?action=prev&last=<%=intpage%>">上一页</a></li>
                    <%
                    basepage = intpage-2
                    endpage = intpage+2
                    if basepage < 1 then
                        fixed = 1-basepage
                        basepage = basepage+fixed
                        endpage = endpage+fixed
                    end if
                    if endpage > intPageCount then
                        fixed = endpage-intPageCount
                        if basepage-fixed >= 1 then
                            basepage = basepage-fixed
                        end if
                        endpage = endpage-fixed
                    end if
                    for i=basepage to endpage
                        toactive = ""
                        if i=intPage then
                            toactive="active"
                        end if
                        response.Write("<li class='" & toactive & "'><a href='files.asp?action=goto&intpage=" & i & "'>" & i & "</a></li>")
                    next
                     %>
					<li><a href="files.asp?action=next&last=<%=intpage%>">下一页</a></li>
				</ul>
			</div>
            <form method="post" encType="multipart/form-data" action="actions/uploadfile.asp"  onsubmit="setFormSubmitting()">
            <label>
            上传新文件：
            <input type="file" id="file" class="btn btn-large" name="file"/>
            <input type="submit" class="btn btn-success btn-large" value="上传"/>
            </label>
                <div class="ui-widget">
                    <div class="ui-state-highlight ui-corner-all" style="width:250px;margin-top: 20px;">
                        <p style="padding-top:8px;padding-left:8px;"><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                        <strong>注意：</strong> 文件大小不能超过10MB。 </p>
                    </div>
                </div>
            </form>
		  </div>
        </div>
      </div>

      <hr>

      <!--#include file="components/footer.asp"-->

    </div>
    <!-- jquery ui -->
    <div id="dialog" title="文件地址">
    <p id="dialog_content"></p>
    </div>
    <script src="js/jquery-ui-1.11.4.green/external/jquery/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui-1.11.4.green/jquery-ui.js"></script>
    
	<script>
        var warning = false;
        var setFormSubmitting = function () {
            if ($('#file').val() == "") {
                warning = true;
            }
        }
        window.onbeforeunload = function () {
            if (warning) {
                warning = false;
                return "您还未选择文件！";
            }
        }

        $('form').submit(function () {
            window.onbeforeunload = null;
        });

        $("#dialog").dialog({
	        autoOpen: false,
	        width: 400,
	        buttons: [
                {
	                text: "确定",
	                click: function () {
		                $(this).dialog("close");
	                }
                }
            ]
		});

		var copyUrl = function (fid) {
		    $("#dialog_content").html("http://<%=Application("domain")%>/actions/download.asp?fid="+fid);
		    $("#dialog").dialog("open");
		}
	    $(document).ready(function() {
		    $('.dropdown-menu li a').hover(
		    function() {
			    $(this).children('i').addClass('icon-white');
		    },
		    function() {
			    $(this).children('i').removeClass('icon-white');
		    });
		
		    if($(window).width() > 760)
		    {
			    $('tr.list-users td div ul').addClass('pull-right');
		    }
	    });
	</script>
  </body>
</html>
