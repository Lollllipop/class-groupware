<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>수업 개설</title>

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
<!-- Morris Chart Styles-->
<link href="${contextPath}/resources/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="${contextPath}/resources/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css">
<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->

<style>
* {
	margin: 0px;
}

.clear {
	clear: both;
}

footer>strong {
	color: #F44336;
	font-size: 18px;
}

.cntAllTextArea {
	float: left;
	margin-left: 20px;
}

.selectReadCountArea {
	float: left;
}

.selectReadCountSelect {
	float: left;
}

.write_btn {
	float: right;
}

.selectReadCountText {
	margin-top: 10px;
	float: left;
}

.writebtnArea {
	float: right;
}

.writebtnArea>button {
	background-color: #F44336;
}
</style>

<script type="text/javascript">
 	function popupSubmit() {
		opener.name="parents";
		document.myForm.target=opener.name;
		document.myForm.action="/entity/class/class_update"
		document.myForm.submit();
		window.close()

	} 
</script>

</head>

<body>
	<div class="card">
		<div class="table-fixed">
			<form name="myForm" method="post">
				
				<input type='hidden' name='class_idx' value="${classVO.class_idx}">

				<div id="box0">
					<span><b>${classVO.class_idx}반</b></span>
				</div>

				<div id="clear"></div>

				<div id="box1">
					<label>클래스 이름 : </label> <input type="text" name="class_name"
						class="form-control" value="${classVO.class_name}"
						style="width: 200px; color: black;">
				</div>

				<div id="clear"></div>

				<div id="box2">
					<label>클래스 설명 : </label> <input type="text" name="class_about"
						class="form-control" value="${classVO.class_about}"
						style="width: 400px; color: black;">
				</div>

				<div id="clear"></div>

				<!-- <div id="box3">
					<label>강 사 : </label> <select class="form-control input-sm">
						<option value="teacherselect" selected="selected">--선택--</option>
						<option value="teacher1">강사1</option>
						<option value="teacher2">강사2</option>
						<option value="teacher3">강사3</option>
					</select> -->


				<div id="clear"></div>

				<div id="box4">
					<label>시작일 : </label> <input type="date" class="form-control"
						value="${classVO.class_startdate}" name="class_startdate"
						style="color: black;">
				</div>

				<div id="clear"></div>

				<div id="box5">
					<label>종료일 : </label> <input type="date" class="form-control"
						value="${classVO.class_enddate}" name="class_enddate"
						style="color: black;">
				</div>

				<div id="clear"></div>

				<div class="box-footer">
					<input type="button" class="btn btn-primary" value="수정"
						onclick="popupSubmit()">
					<%-- <form action="delete" method="get">
				<input type="hidden" name="class_idx" id="class_idx" value="${classVO.class_idx }"> --%>
					<button type="button" class="btn btn-primary"
						onclick="window.close()">돌아가기</button>
					<!-- </form>	 -->
				</div>
				<!-- <input type="button" class="btn btn-primary" onclick="goSubmit()" value = "개설"> -->
				<!-- 
				<button type="submit" class="btn btn-primary">개설</button> -->

				<!-- <script>
				$(document).ready(function() {

					var formObj = $("form[role='form']");

					console.log(formObj);

					$(".btn-danger").on("click", function() {
						formObj.attr("action", "/entity/class/delete");
						formObj.submit();
					});

				});
			</script> -->
			</form>
		</div>
	</div>

	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>



</body>

</html>