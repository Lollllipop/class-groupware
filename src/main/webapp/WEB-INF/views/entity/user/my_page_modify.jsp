<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
	integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
	crossorigin="anonymous">

<link href="${contextPath }/resources/auth/css/signUp.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
	integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
	crossorigin="anonymous" />

<title>Choongang</title>
</head>

<body>
	<div class="py-5">
		<div class="container-fluid">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<p class="lead">
							<strong>ChoongAng</strong>
						</p>
						<h3>내 정보 수정</h3>
						<br> <br>
						<!-- <form action="modify" id="modify_form" method="POST"> -->
						<form role="form" action="/myPage/modify" method="post" id="modify_form">
							<input type="hidden" class="form-control" name="user_idx"
								id="user_idx" value="${usersVO.user_idx}">
							<div class="form-group">
								<strong> <c:if test="${usersVO.user_role=='student'}">
									학생
								</c:if> <c:if test="${usersVO.user_role=='teacher'}">
									강사
								</c:if>
								</strong>
							</div>
 							<div class="form-group">
								<strong>이름 : </strong> <strong>${usersVO.user_name}</strong> 
							</div>
							<div class="form-group">
								<strong>아이디 : </strong> <strong>${usersVO.user_id}</strong> 
							</div>
							
							<div class="form-group">
								<strong>가입일 : </strong> <strong><fmt:formatDate
										pattern="yyyy-MM-dd" value="${usersVO.user_joindate}" /></strong> 
							</div>
				
							<div class="form-group">
								<strong>이메일</strong> <input type="email" class="form-control"
									value="${usersVO.user_email}" name="user_email" id="user_email">
							</div>
							<div id="check_pw_warning"></div>
							<div class="form-group">
								<strong>비밀번호</strong> <input type="password"
									class="form-control" placeholder="비밀번호" name="user_password"
									id="user_password" value="${usersVO.user_password}">
							</div>
							<div class="form-group">
								<strong>비밀번호 확인</strong> <input type="password"
									class="form-control" placeholder="비밀번호 확인" name="user_check_password"
									id="user_check_password">
							</div> 

						</form>

						<!-- <button class="btn btn-success" onclick="modify_checkValues()"
							style="color: white">수정</button> -->
						<button class="btn btn-primary" style="color: white;" onclick="modify_checkValues()">저장</button>
						<!-- <button type="submit" class="btn btn-primary" style="color: white;">저장</button> -->
						<button class="btn btn-danger"
							style="color: white;" onClick="history.back()">취소</button>

						<script src="/resources/js/jquery-1.10.2.js"></script>
						<script>
							$(document).ready(function() {

								var formObj = $("form[role='form']");

								$(".btn-primary").on("click", function() {
									formObj.modify_checkValues();
									//formObj.submit();
								});
							});
						</script>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${contextPath}/resources/auth/js/modify.js"></script>
</body>

</html>

