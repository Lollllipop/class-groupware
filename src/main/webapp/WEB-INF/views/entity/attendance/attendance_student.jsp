<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출석관리</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextPath}/resources/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${contextPath}/resources/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="${contextPath}/resources/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="resources/js/Lightweight-Chart/cssCharts.css">


<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/Ionicons/css/ionicons.min.css">
<!-- fullCalendar -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/fullcalendar/dist/fullcalendar.print.min.css"
	media="print">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">내 출석</h1>
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-lg-6">
						<div class="card">
							<div class="card-action">
								${list[0].user_name} 님의 현재 출석률
							</div>
							<div class="card-content">
								<div id="progressbar"></div>
							
						  	</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="card">
							<div class="card-action">전체 출석 보기</div>
							<div class="card-content">
								<div class="box box-primary">
									<div class="box-body no-padding">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			</div>
		</div>
	</div>




	<!-- jQuery Js -->
	<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	<script src="${contextPath}/resources/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>

	<!-- Morris Chart Js -->
	<script src="${contextPath}/resources/js/morris/raphael-2.1.0.min.js"></script>
	<script src="${contextPath}/resources/js/morris/morris.js"></script>

	<script src="${contextPath}/resources/js/easypiechart.js"></script>
	<script src="${contextPath}/resources/js/easypiechart-data.js"></script>

	<script src="${contextPath}/resources/js/Lightweight-Chart/jquery.chart.js"></script>

	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>


	<!-- jQuery 3 -->
	<script
		src="${contextPath}/resources/calendar/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${contextPath}/resources/calendar/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="${contextPath}/resources/calendar/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${contextPath}/resources/calendar/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/calendar/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath}/resources/calendar/dist/js/demo.js"></script>
	<!-- fullCalendar -->
	<script
		src="${contextPath}/resources/calendar/bower_components/moment/moment.js"></script>
	<script
		src="${contextPath}/resources/calendar/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<!-- Page specific script -->
	<script type = "text/javascript">
	$(function(){
		var result = new Array();
		
		<c:forEach items="${list}" var="list">
			var json = new Object();
			json.event = "${list.attendance_event}";
			json.date = "${list.attendance_date}"
			result.push(json);
		</c:forEach> 
	
		var events = [];
		var state = null;
		var stateColor = null;
		var count = null;
		
		for(var i =0; i < result.length; i++) {
			if(result[i].event =="y"){
				state = "출석";
				stateColor = "blue"
				count = count + 1;
			}else if(result[i].event =="e"){
				state = "조퇴";
				stateColor = "orange"
				count = count + 0.5;
			}else if(result[i].event =="l"){
				state = "지각";
				stateColor = "orange"
					count = count + 0.5;
			}else if(result[i].event =="n"){
				state = "결석";
				stateColor = "red"
			}
			events.push( {title: state , start: result[i].date, color : stateColor})
		}
		
		var date = new Date()
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear()
		$('#calendar').fullCalendar(
			{
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,agendaWeek,agendaDay'
				},
				buttonText : {
					today : 'today',
					month : 'month',
					week : 'week',
					day : 'day'
				},
				events: events,
				editable : false,
				droppable : false
						
		});
		
		function parse(str) {
		    var y = str.substr(0, 4);
		    var m = str.substr(5, 2);
		    var d = str.substr(8, 2);
		    return new Date(y,m-1,d);
		}
		
		var startdate = parse("${classList.class_startdate}");
		var enddate = parse("${classList.class_enddate}");
		
	    function dateDiff(startdate, enddate) {
	    	var diff = Math.abs(enddate.getTime() - startdate.getTime());
		    diff = Math.ceil(diff / (1000 * 3600 * 24));
	     
	        return diff;
	    }
	    
	    var diff = dateDiff(startdate, enddate);
	    var tmp = (count/diff)*100;
	    var rate = Math.floor(tmp);

		$("#progressbar").progressbar({
            max : 100,
            value : rate
        });

        $(document).ready(function() {
            $("#progressbar ").children('div.ui-progressbar-value').html(rate + '%');

        });

	});
	
	</script>
</body>
</html>
