<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title>校园地图</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/site.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="js/jquery-ui-1.11.4.green/jquery-ui.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <!--#include file="include/map.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>校园地图<small>查看或者修改当前地图</small></h1>
			</div>
            <img src="../../images/service/map.jpg" alt="" width="550" height="634"/>
			<form method="post" encType="multipart/form-data" action="actions/uploadmap.asp"  onsubmit="setFormSubmitting()">
            <label>
            上传校历：
            <input type="file" id="file" class="btn btn-large" name="file"/>
            <input type="submit" class="btn btn-success btn-large" value="上传"/>
            </label>
                <div class="ui-widget">
                    <div class="ui-state-highlight ui-corner-all" style="width:450px;margin-top: 20px;">
                        <p style="padding-top:8px;padding-left:8px;"><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                        <strong>注意：</strong> 图片必须是jpg，建议大小是550x634，或者请把图片做成类似的比例。 </p>
                    </div>
                </div>
            </form>
		  </div>
        </div>
      </div>

      <hr />

      <!--#include file="components/footer.asp"-->

    </div>
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
	</script>
  </body>
</html>
