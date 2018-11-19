<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<style>
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

.selectReadCountText {
	margin-top: 10px;
	float: left;
}

.writebtnArea {
	float: right;
	margin-right: 10px;
}

.writebtnArea>button {
	background-color: #F44336;
}

.pagination {
	margin-left: 15px;
	margin-right: auto;
	margin-bottom: 30px;
}

.selectSearchValue {
	margin-top: 10px;
	float: left;
}

.search_icon {
	margin-top: 10px;
	float: right;
}

.search_area_form_input {
	float: right;
}

.searcharea {
	margin-top: 30px;
	margin-right: 30px;
	float: right;
}

.card-action {
	float: left;
}
</style>
<script>
	/* function aa() {
	
	 } */

	/* $(document).ready(function() {$('#searchBtn').on("click",function(event) {
	self.location = "homework_board_list"
	+ '${pageMaker.makeQuery(1)}'
	+ "&searchType="
	+ $("select option:selected").val()
	+ "&keyword=" + $('#saerch_form_input_value').val();
	});  */
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "classgroupware/entity/homework_board/homework_board_list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
				});

			});
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">과제</h1>
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action">
								<strong>과제</strong>
							</div>
							<div class="clear"></div>
							<div class="cntAllTextArea">총 게시물 수 :[${totalCount}]</div>
							<div class="searcharea">
								<form class="form-inline d-flex justify-content-center">

									<div class="selectSearchValue">
										<select class="form-control input-sm" name="searchType">
											<option value="n"
												<c:out value="${cri.searchType == null?'selected':''}"/>>
												---</option>
											<option value="t"
												<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
												제목</option>
											<option value="c"
												<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
												내용</option>
										</select>
									</div>
									<div class="search_icon">
										<i id="searchBtn" class="material-icons dp48">search</i>
										<!-- 버튼 -->
									</div>
									<div class="search_area_form_input">
										<input type="text" class="form-control"
											placeholder="으로 검색합니다." id="saerch_form_input_value"
											name="keyword" value="${cri.keyword }">
									</div>
								</form>
							</div>
							<div class="clear"></div>
							<div class="row">
								<c:forEach items="${list}" var="hwboardVO">
									<div class="card-content">
										<div class="col-md-12 col-sm-6">
											<div class="care blue-grey darken-1">
												<div class="card-content white-text">
													<a
														href="/homework_board_view${pageMaker.makeSearch(pageMaker.cri.page) }&hw_idx=${hwboardVO.hw_idx }">
														<span class="card-title">${hwboardVO.hw_title}</span>
													</a>
													<p>첨부파일을 참고하여 과제를 기한내에 제출하세요.</p>
													<br>
													<p>제출기한 : ${hwboardVO.hw_startdate } ~
														${hwboardVO.hw_enddate }</p>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- <div class="card-content">
									<div class="col-md-12 col-sm-6">
										<div class="card blue-grey darken-1">
											<div class="card-content white-text">
												<a href="/homework_board_view">
												 <span class="card-title">과제1- 보고서</span>
												 </a>
												<p>첨부파일을 참고하여 과제를 기한내에 제출하세요.</p>
												<br>
												<p>제출기간 2018.11.01 ~ 2018.11.09</p>
											</div>
										</div>
									</div>
								</div> -->
							</div>
							<div class="clear"></div>
							<div class="table-responsive">
								<div class="writebtnArea">
									<a href="./homework_board_write"><input type="button"
										class="btn" id="write" value="글쓰기"></a>
								</div>

								<div class="clear"></div>

								<div
									style="width: 230px; margin-left: auto; margin-right: auto;">
									<ul class="pagination">

										<c:if test="${pageMaker.prev}">
											<li><a
												href="homework_board_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
										</c:if>

										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="hw_idx">
											<li
												<c:out value="${pageMaker.cri.page == hw_idx?'class =active':''}"/>>
												<a href="homework_board_list${pageMaker.makeSearch(hw_idx)}">${hw_idx}</a>
											</li>
										</c:forEach>

										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li><a
												href="homework_board_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
										</c:if>

									</ul>
								</div>
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
</body>
</html>