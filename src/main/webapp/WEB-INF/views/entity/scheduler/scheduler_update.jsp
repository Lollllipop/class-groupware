<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Class Groupware</title>

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
<link href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="page-wrapper" style="top: 0">
		<div id="page-inner">
			<div class="row">
				<div class="card">
					<div class="card-content">
						<div class="box box-primary">
							<div class="box-header" style="text-align: center">
								<h3 class="box-title">일정 수정</h3>
							</div>
							<br>
							<br>
							<div class="box-body">
								<form method="post" name="scheduler" id="target" role="form">
									<div class="form-group">
										<label>일정: </label>
										<div class="input-group date">
											<input type="text" id="scheduler_content"
												value="${list.scheduler_content}" name="scheduler_content">
											<input type="hidden" id="class_idx" value="${list.class_idx}"
												name="class_idx" /> <input type="hidden" id="scheduler_idx"
												value="${list.scheduler_idx}" name="scheduler_idx" />
										</div>
									</div>
									<div class="form-group">
										<label>From: </label>
										<div class="input-group date">
											<input type="text" id="datepicker" name="scheduler_startdate"
												style="width: 80%;">
										</div>
									</div>
									<div class="form-group">
										<label>To: </label>
										<div class="input-group">
											<input type="text" id="datepicker2" name="scheduler_enddate"
												style="width: 80%;">
										</div>
									</div>
									<div class="form-group">
										<label for="colorWell">Color:</label>
										<div class="input-group">
											<input type="color" id="colorWell" name="scheduler_color">
										</div>
									</div>
									<br>
									<br>
									<div class="form-group">
										<div class="input-group">
											<button type="button" onclick="window.close()"
												class="btn btn-default">닫기</button>
											<button type="button" class="btn btn-warning" id="update">수정</button>
											<button type="button" class="btn btn-danger" id="delete">삭제</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							//모든 datepicker에 대한 공통 옵션 설정
							$.datepicker
									.setDefaults({
										dateFormat : 'yy-mm-dd' //Input Display Format 변경
										,
										showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										,
										showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
										,
										changeYear : true //콤보박스에서 년 선택 가능
										,
										changeMonth : true //콤보박스에서 월 선택 가능                
										,
										showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										,
										buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
										,
										buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										,
										buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										,
										yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
										,
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ] //달력의 월 부분 텍스트
										,
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
										,
										dayNamesMin : [ '일', '월', '화', '수',
												'목', '금', '토' ] //달력의 요일 부분 텍스트
										,
										dayNames : [ '일요일', '월요일', '화요일',
												'수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
										,
										minDate : "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										,
										maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
									});

							$("#datepicker").datepicker();
							$("#datepicker2").datepicker();

							var scheduler_idx = '${list.scheduler_idx}';

							var startdate = new Date(
									'${list.scheduler_startdate}');
							var enddate = new Date('${list.scheduler_enddate}');

							$('#datepicker').datepicker('setDate', startdate); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
							$('#datepicker2').datepicker('setDate', enddate); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

							var formObj = $("form[role='form']");

							$('#update').click(
									function() {

										formObj.attr("action",
												"/scheduler/tch/update");
										formObj.attr("method", "post");
										formObj.submit();

										opener.location.reload();
									});

							$('#delete').click(
									function() {

										formObj.attr("action",
												"/scheduler/tch/delete");
										formObj.attr("method", "post");
										formObj.submit();

										opener.location.reload();
									});

							var scheduler_color = '${list.scheduler_color}';

							var colorWell;
							var defaultColor = scheduler_color;

							window.addEventListener("load", startup, false);
							function startup() {
								colorWell = document
										.querySelector("#colorWell");
								colorWell.value = defaultColor;
								colorWell.addEventListener("input",
										updateFirst, false);
								colorWell.addEventListener("change", updateAll,
										false);
								colorWell.select();
							}
							function updateFirst(event) {
								var p = document.querySelector("p");

								if (p) {
									p.style.color = event.target.value;
								}
							}
							function updateAll(event) {
								document.querySelectorAll("p").forEach(
										function(p) {
											p.style.color = event.target.value;
										});
							}

						});
	</script>
</body>
</html>
