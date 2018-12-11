<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>수업 목록</title>

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
<script type="text/javascript">
	function class_create() {
		window.name = "classlist";
		window.open("class_create", "insert",
				"width=400, height=430, left=300, top=300");
		/* setTimeout ( self.close(), 5000)  */
	}
	
/* 	var formObj = $("form[role='form']");

	$('#submit').click(
			function() {

				formObj.attr("action",
						"/userList/register");
				formObj.attr("method", "post");
				formObj.submit();

			}); */

	
</script>

<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">
					수업 목록
					<!-- 마스터에게만 보임 -->
					<button class="btn btn-danger" id='newBtn' onclick="class_create()">
						<!-- id = 'newBtn' -->
						<i class="material-icons left">settings</i>수업 개설
					</button>
				</h1>
			</div>

			<%--  --%>


			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">


						<c:forEach items="${list}" var="classVO">
							<div class="card">

								<div class="card-action">
									<b>수강 중</b>
								</div>

								<div class="card-image">
									<ul class="collection">
										<li class="collection-item avatar"><i
											class="material-icons circle blue">mode_edit</i> <span
											class="title"> <a
												href="./class_update?class_idx=${classVO.class_idx}"
												onclick="window.open(this.href, '_blanck', 'width=400, height=430, left=300, top=300'); return false">
													<!--  --> ${classVO.class_name}
											</a></span> <%--  --%> <br>

											<p style="float: left;">
												${classVO.class_about}<br> ${classVO.class_startdate} ~
												${classVO.class_enddate}
											</p> <!-- 수강신청이 되어있는 학생은 수강중인 수업 리스트가 보이며, 여기서 수강 포기 버튼만 보임 강사의 경우
												본인의 수업 리스트가 보이며, 수강 포기 버튼 안보임. 강사는 수업 포기할 권한 없음. 마스터가 있음 -->
											<!-- <button class="btn btn-warning">
														<i class="material-icons left">delete</i>수강포기
													</button> --> <span style="float: right;">
												<form action="/userList/register" method="post">
													<input type=hidden name="user_idx" value="2"> 
													<input type=hidden name="class_idx" value="${classVO.class_idx}">
													<button type="submit" class="btn btn-success">
														<i class="material-icons left">done</i>수강신청
													</button>
												</form> <a href="./class_update?class_idx=${classVO.class_idx}"
												onclick="window.open(this.href, 'classUp', 'width=400, height=430, left=300, top=300'); return false">
													<button class="btn btn-danger">
														<i class="material-icons left">update</i>수업 수정
													</button>
											</a>
												<button type="submit" class="btn btn-danger"
													onclick="location.href='delete?class_idx=${classVO.class_idx}'">
													<i class="material-icons left">settings</i>수업 삭제
												</button>
										</span></li>

									</ul>
								</div>
							</div>
						</c:forEach>




						<!--  <div class="card">
							<div class="card-action">
								<b>수강 중</b>
							</div> -->
						<%-- 	수강중인 수업이 없는 학생은 카드는 보이되, 수업은 보이지 않고 "수강중인 수업이 없습니다." 멘트를 보이게 해주세요
							<div class="card-image">
								<ul class="collection">
									<li class="collection-item avatar"><i
										class="material-icons circle blue">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (A) - 봉미선 강사</span><br>
										<p style="float: left;">
											디지털융합 SoftWare 코딩 예비교육 <br> 2018.12.26 ~ 2019.01.30,
											09:00~18:00
										</p> 수강신청이 되어있는 학생은 수강중인 수업 리스트가 보이며, 여기서 수강 포기 버튼만 보임 강사의 경우 본인의 수업 리스트가 보이며, 수강 포기 버튼 안보임. 강사는 수업 포기할 권한 없음. 마스터가 있음
										<span style="float: right;">
											<button class="btn btn-warning">
												<i class="material-icons left">delete</i>수강포기
											</button>
									</span></li>
									<li class="collection-item avatar"><i
										class="material-icons circle blue">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (B) - 신영만 강사</span><br>
										<p style="float: left;">
											JAVA기반 빅데이타 IT콘텐츠 정보시스템 취업과정 <br> 2018.08.06 ~
											2018.12.27, 09:00~18:00
										</p> <span style="float: right;">
											<button class="btn btn-warning">
												<i class="material-icons left">delete</i>수강포기
											</button>
									</span></li>
								</ul>
							</div>
						</div> 

						<br>

						<div class="card">
							<div class="card-action">
								<b>수강 신청</b>
							</div>
							<div class="card-image">
								<ul class="collection">
									<c:forEach items="${list}" var="ClassBoardVO">
										<li class="collection-item avatar"><i
											class="material-icons circle red">mode_edit</i> <span
											class="title">${ClassBoardVO.class_name}</span><br>
											<p style="float: left;">
												${ClassBoardVO.class_about} <br>
												 <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${ClassBoardVO.regdate}" /> 
											</p> <span style="float: right;">
												<button class="btn btn-success">
													<i class="material-icons left">done</i>수강신청
												</button>
										</span></li>
									</c:forEach>
									<li class="collection-item avatar"><i
										class="material-icons circle red">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (C) - 신짱구 강사</span><br>
										<p style="float: left;">
											머신러닝 기반 빅데이터 분석 개발자 전문과정 <br> 2018. 10. 29 ~ 2019.
											04.23, 09:00 ~18:00
										</p>  <span style="float: right;"> <!-- 학생의 경우: 수강중인 수업 이외의 수업 리스트가 보이며, 수강 신청 버튼이 보임 
											강사의 경우: 수강중인 수업 이외의 수업 리스트가 보이며, 수강 신청 버튼이 안보임 --> 
											<button class="btn btn-success">
												<i class="material-icons left">done</i>수강신청
											</button> <!-- 마스터의 경우: 수강중인 수업이 없으니, 모든 수업 리스트가 이곳에 보이며, 수업 수정/삭제 버튼이 보임 --> 
											<button class="btn btn-danger">
												<i class="material-icons left">settings</i>수업 수정
											</button>
											<button class="btn btn-danger">
												<i class="material-icons left">settings</i>수업 삭제
											</button>
									</span></li>
									<li class="collection-item avatar"><i
										class="material-icons circle red">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (D) - 김철수 강사</span><br>
										<p style="float: left;">
											DBMS기반 빅데이터 응용 SW개발자 전문과정 <br> 2018. 11. 27 ~ 2019. 05.
											23, 09:00 ~ 18:00
										</p> <span style="float: right;">
											<button class="btn btn-success">
												<i class="material-icons left">done</i>수강신청
											</button>
									</span></li>
									<li class="collection-item avatar"><i
										class="material-icons circle red">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (E) - 한유리 강사</span><br>
										<p style="float: left;">
											빅데이터 활용 JAVA기반 SW개발자 양성과정 <br> 2018. 12. 27 ~ 2019. 06.
											21, 09:00 ~ 18:00
										</p> <span style="float: right;">
											<button class="btn btn-success">
												<i class="material-icons left">done</i>수강신청
											</button>
									</span></li>
									<li class="collection-item avatar"><i
										class="material-icons circle red">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (F) - 이훈이 강사</span><br>
										<p style="float: left;">
											표준프레임워크 기반 응용 SW개발자 양성과정 <br> 2018. 12. 11~ 2019. 06.
											05, 09:00~ 18:00
										</p> <span style="float: right;">
											<button class="btn btn-success">
												<i class="material-icons left">done</i>수강신청
											</button>
									</span></li>
									<li class="collection-item avatar"><i
										class="material-icons circle red">mode_edit</i> <span
										class="title">청년아카데미 대학생 반 (G) - 맹구 강사</span><br>
										<p style="float: left;">
											자바(JAVA)기반 IT콘텐츠 개발자 양성과정 <br> 2018. 11. 14 ~ 2019. 05.
											13, 09:00 ~ 18:00
										</p> <span style="float: right;">
											<button class="btn btn-success">
												<i class="material-icons left">done</i>수강신청
											</button>
									</span></li>
								</ul>
							</div>
						</div>  --%>




					</div>
				</div>

				<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

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

	<!-- <script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script> 

<script>
	$(document).ready(
			function() {

				$('#newBtn').on("click", function(evt) {

					self.location = "class_create";

				});

			}); -->
	<!-- </script>  -->
</body>
</html>
