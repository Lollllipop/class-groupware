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
	function popupClose(form) {
		form.target = opener.name;
		form.submit();

		if (opener != null) {
			opener.insert = null;

			self.close();
		}

	}
</script>

</head>

<body>
	<div class="card">
		<div class="table-fixed">
			<form name="myForm" method="POST" action="/entity/class/class_create"
				target="classlist">


				<div id="box1">
					<label>클래스 이름 : </label> <input type="text" name="class_name"
						style="width: 200px;" placeholder="청년아카데미 대학생 반 (A)">
				</div>

				<div id="clear"></div>

				<div id="box2">
					<label>클래스 설명 : </label> <input type="text" name="class_about"
						style="width: 400px;" placeholder="디지털융합 SoftWare 코딩 예비교육 ">
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
						name="class_startdate" placeholder="date input">
				</div>

				<div id="clear"></div>

				<div id="box5">
					<label>종료일 : </label> <input type="date" class="form-control"
						name="class_enddate" placeholder="date input">
				</div>

				<div id="clear"></div>
				<input type="submit" class="btn btn-primary" value="개설"
					onclick="window.close()">
				<!-- <input type="button" class="btn btn-primary" onclick="goSubmit()" value = "개설"> -->
				<!-- 
				<button type="submit" class="btn btn-primary">개설</button> -->

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