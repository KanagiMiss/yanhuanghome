<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>∑√Œ Õ≥º∆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">

    <link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
    <style type="text/css">
    html, body {
        height: 100%;
    }
    </style>
  </head>
  <body>
    <!--#include file="include/visitor-stats.inc"-->
    <!--#include file="components/header.asp"-->

    <div class="container-fluid">
      <div class="row-fluid">
        <!--#include file="components/sidebar.asp"-->
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>Visitors Stats <small>Visitor statistics...</small></h1>
			</div>
			<div id="placeholder" style="width:80%;height:300px;"></div>
		  </div>
        </div>
      </div>

      <hr>

      <!--#include file="components/footer.asp"-->

    </div>

    <script src="js/jquery.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.resize.js"></script>	
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(function () {
		var data = [
		{
			label: 'Example 2',
			data: [[0, 4454], [1, 1245], [2, 7876], [3, 5211], [4, 6787]]
		}];
		var options = {
			legend: {
				show: true,
				margin: 10,
				backgroundOpacity: 0.5
			},
			bars: {
				show: true,
				barWidth: 0.5,
				align: 'center'
			},
			grid: {
				borderWidth:1,
				hoverable: true
			},
			xaxis: {
				axisLabel: 'Month',
				ticks: [[0, 'Jan'], [1, 'Feb'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sep'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']],
				tickDecimals: 0,
			},
			yaxis: {
				tickSize:2000,
				tickDecimals: 0
			}
		};
		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #D6E9C6',
				padding: '2px',
				'background-color': '#DFF0D8',
				opacity: 0.80
			}).appendTo("body").fadeIn(200);
		}
		var previousPoint = null;
		$("#placeholder").bind("plothover", function (event, pos, item) {
			if (item) {
				if (previousPoint != item.dataIndex) {
					previousPoint = item.dataIndex;

					$("#tooltip").remove();
					showTooltip(item.pageX, item.pageY, item.series.label + ": " + item.datapoint[1]);
				}
			}
			else {
				$("#tooltip").remove();
				previousPoint = null;            
			}
		});
		$.plot( $("#placeholder") , data, options );
	});
	</script>
  </body>
</html>
