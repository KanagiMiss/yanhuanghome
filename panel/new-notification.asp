<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新建通知 | Strass</title>
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
    <!--#include file="include/new-notification.inc"-->
    <!--#include file="components/header.asp"-->
    <div class="container-fluid">
        <div class="row-fluid">
            <!--#include file="components/sidebar.asp"-->
            <div class="span9">
                <!-- toolbar with suitable buttons and dialogues -->
                <div class="row-fluid">
                    <div class="page-header">
                        <h1>
                            通知录入 <small>新建通知</small></h1>
                    </div>
                    <form action="actions/addnotification.asp" method="post" onsubmit="setFormSubmitting()">
					<!--#include file="components/editor.asp"-->
                    <br />
					<input type="submit" class="btn btn-success btn-large" value="提交" />&nbsp;&nbsp;&nbsp;<a class="btn" href="">保存草稿</a>
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
