<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Class Groupware</title>


<!-- 새로 복붙 -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/Ionicons/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${contextPath}/resources/calendar/dist/css/skins/_all-skins.min.css">

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
<link href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css"
	rel="stylesheet">




<%-- 여기에 css등 링크 작성!! --%>

</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">수강 학생 목록</h1>
			</div>
			<div id="page-inner">


				<%-- 여기에 코드 작성!! --%>
				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">수강 신청 학생 목록</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<table id="example2" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>이름</th>
												<th>이메일</th>
												<th>가입일</th>
												<th>-</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list}" var="userListVO">
												<c:if
													test="${userListVO.user_status=='waiting' && userListVO.user_role=='student'}">
													<tr>
														<td>${userListVO.user_name}</td>
														<td>${userListVO.user_email}</td>
														<td>승인이 이루어져야 가입됩니다.</td>
														<td>
															<c:if test="${login.user_role=='teacher'}">
															<form action="/userList/modify" method="post">
																<input type="hidden" name="user_idx"
																	value="${userListVO.user_idx}">
																<button type="submit" class="btn">승인</button>
															</form>
															<form action="/userList/remove" method="post">
																<input type="hidden" name="user_idx"
																	value="${userListVO.user_idx}">
																<button type="submit" class="btn btn-danger">거절</button>
															</form>
															</c:if>
														</td>
													</tr>
												</c:if>
											</c:forEach>
											<!-- 
											<tr>
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td>4</td>
											</tr>
											<tr>
												<td>Trident</td>
												<td>Internet Explorer 5.0</td>
												<td>Win 95+</td>
												<td>5</td>
											</tr>
											 -->
										</tbody>
										<tfoot>
											<tr>
												<th>이름</th>
												<th>이메일</th>
												<th>가입일</th>
												<th>-</th>
											</tr>
										</tfoot>
									</table>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->

							<div class="box">
								<div class="box-header">
									<h3 class="box-title">수강 중인 학생 목록</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<table id="example1" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>이름</th>
												<th>이메일</th>
												<th>가입일</th>
												<th>-</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${list}" var="userListVO">
												<c:if
													test="${userListVO.user_status=='accept' && userListVO.user_role=='student'}">
													<tr>
														<td>${userListVO.user_name}</td>
														<td><a href='/board/read?bno=${userListVO.user_idx}'>${userListVO.user_email}</a></td>
														<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																value="${userListVO.class_joindate}" /></td>
														<td>
														<c:if test="${login.user_role=='teacher'}">
															<form action="/userList/remove" method="post">
																<input type="hidden" name="user_idx"
																	value="${userListVO.user_idx}">
																<button type="submit" class="btn btn-danger">제외</button>
															</form>
															</c:if>
														</td>
													</tr>
												</c:if>
											</c:forEach>

											<!--
											 <tr>
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td>4</td>
												 
											</tr>
											<tr>
												<td>Trident</td>
												<td>Internet Explorer 5.0</td>
												<td>Win 95+</td>
												<td>5</td>
												 
											</tr>
											 -->

										</tbody>
										<tfoot>
											<tr>
												<th>이름</th>
												<th>이메일</th>
												<th>가입일</th>
												<th>-</th>
											</tr>
										</tfoot>
									</table>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</section>

				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			</div>
		</div>
	</div>
	<!-- jQuery Js -->
	<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>

	<!--  새로 복붙 -->
	<!-- jQuery 3 -->
	<script
		src="${contextPath}/resources/calendar/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${contextPath}/resources/calendar/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${contextPath}/resources/calendar/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${contextPath}/resources/calendar/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${contextPath}/resources/calendar/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${contextPath}/resources/calendar/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/calendar/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath}/resources/calendar/dist/js/demo.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$('#example1').DataTable({
				'paging' : true,
				'lengthChange' : false,
				'searching' : false,
				'ordering' : true,
				'info' : true,
				'autoWidth' : false,
				 "oLanguage": {
				        "sEmptyTable": "해당 사항 없음"
				    }
			})
			$('#example2').DataTable({
				'paging' : true,
				'lengthChange' : false,
				'searching' : false,
				'ordering' : true,
				'info' : true,
				'autoWidth' : false,
				 "oLanguage": {
				        "sEmptyTable": "해당 사항 없음"
				    }
			})
		})
	</script>



</body>
</html>