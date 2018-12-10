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
				<h1 class="page-header">마이페이지</h1>
			</div>
			<div id="page-inner">


				<div class="row">

					<div class="col-md-6">
						<div class="card" style="height: 250px;">
							<div class="card-content">
								<span class="card-title">나의 프로필</span>
									<c:if test="${usersVO.user_role=='student'}">
										<p>학생</p>
									</c:if>
									<c:if test="${usersVO.user_role=='teacher'}">
										<p>강사</p>
									</c:if>
									<p>이름 : ${usersVO.user_name}</p>
									<p>아이디 : ${usersVO.user_id}</p>
									<p>이메일 : ${usersVO.user_email}</p>
									<p>
										가입일 :
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${usersVO.user_joindate}" />
									</p>
								<form action="/myPage/modify">
									<input type='hidden' name='user_idx' value="${usersVO.user_idx}">
									 
									<button type='submit' class="btn btn-info">수정</button>
									 
								</form>
								<!-- 
								<button type='submit' class="btn btn-info" id="modifyBtn">수정</button>
								 -->
							</div>
							<!-- 
							<div class="card-action">
								<a href="#">수정</a>
							</div>
							 -->
						</div>

					</div>
					<div class="col-md-6">
						<div class="card" style="height: 250px;">
							<div class="card-content">
								<span class="card-title">내가 쓴 글</span>
								<table>
									<thead>
										<tr>
											<th>제목</th>
											<th>구분</th>
											<th>수업</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="myPostsVO">

											<tr>
												<td><a href="#">${myPostsVO.bo_title}</a> <!-- 글 번호 넘겨줘서 링크 -->
												</td>
												<td><c:if test="${myPostsVO.bo_role=='openboard'}">
													자유게시판
													</c:if> <c:if test="${myPostsVO.bo_role=='data'}">
													자료실
													</c:if></td>
												<td>${myPostsVO.class_name}</td>
											</tr>
										</c:forEach>
										<c:if test="${empty list}">
											<tr>
												<td>해당사항 없음</td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
									</tbody>
								</table>
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
	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			$("#modifyBtn").on("click", function() {
				formObj.attr("action", "/myPage/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});
			
		});
	</script>
</body>
</html>