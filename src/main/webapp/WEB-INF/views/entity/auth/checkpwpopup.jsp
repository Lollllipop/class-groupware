<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <%-- 여기에 css등 링크 작성!! --%>
   
</head>

<body>
	<div class="container">	
		<form action="/entity/auth/completepwpopup">
		  <div class="form-group">
		    <label for="exampleInputId">아이디를 입력해주세요.</label>
		    <input type="text" class="form-control" id="exampleInputId" placeholder="Enter ID" name="user_id">
		  </div>
		  <div class="row justify-content-end" style="margin-right : 2px;">
			<button type="submit" class="btn btn-primary">확인</button>
		  </div>
		</form>
	</div>
</body>
</html>