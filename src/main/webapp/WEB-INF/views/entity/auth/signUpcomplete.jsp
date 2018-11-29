<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

   
<!DOCTYPE html>
<html>
<head>
<title>회원가입이 완료되었습니다.</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    
        
</head>
<body>
 <div class="container">
        <div class="row justify-content-md-center" style="margin: 7% auto; width: 350px;">

 
 
<!-- 본문 시작 -->
<h1>환영합니다.</h1>
<br />
이제 로그인하시면 회원 메뉴를 이용하실 수 있습니다.<br />

<form id="login_form" action = "./login">
<button type="submit" class="btn btn-primary mb-2">로그인</button>
</form>
<!--  본문 끝 -->
 
        </div>
    </div>
   

 


 
</body>
</html>
