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
<script>

</script>


<body>
	<div class="container">	
		<form method="POST">
		  <div class="form-group">
		    <label for="exampleInputEmail1">귀하의 아이디는 ${user_id}입니다.</label>
		   
		    <!-- <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> -->
		    <small id="emailHelp" class="form-text text-muted">확인하시고 로그인바랍니다.</small>
		  </div>
		  <div class="row justify-content-end" style="margin-right : 2px;">
		  </div>
		</form>
	</div>
</body>
</html>