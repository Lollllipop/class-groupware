<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>일정관리</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextPath}/resources/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="${contextPath}/resources/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="${contextPath}/resources/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css">


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
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/dist/css/skins/_all-skins.min.css">
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">학원 일정</h1>
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
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

	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="${contextPath}/resources/js/morris/raphael-2.1.0.min.js"></script>
	<script src="${contextPath}/resources/js/morris/morris.js"></script>


	<script src="${contextPath}/resources/js/easypiechart.js"></script>
	<script src="${contextPath}/resources/js/easypiechart-data.js"></script>

	<script
		src="${contextPath}/resources/js/Lightweight-Chart/jquery.chart.js"></script>

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
	<script type="text/javascript">
		$(function() {
			
			var dataset = [
			    <c:forEach var="list" items="${list}" varStatus="status">
			        <c:if test="${list.scheduler_startdate != ''}">
			            {"idx":'<c:out value="${list.scheduler_idx}" />' ,
			            	"title":'<c:out value="${list.scheduler_content}" />',
			            	"color":'<c:out value="${list.scheduler_color}" />',
			            	"start":'<c:out value="${list.scheduler_startdate}" />'
			            	<c:if test="${list.scheduler_enddate != ''}">
			                	,"end":'<c:out value="${list.scheduler_enddate}" />'
			            	</c:if>
			            } <c:if test="${!status.last}">,</c:if>
			        </c:if>
			    </c:forEach>
			];

			var date = new Date()
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear()
			

			$('#calendar').fullCalendar({
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
				events : dataset,
				editable : false,
				droppable : false,
			})

		});
	</script>
</body>
</html>
