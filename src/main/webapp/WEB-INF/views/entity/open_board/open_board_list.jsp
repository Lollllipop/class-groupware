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

<link href="${contextPath}/resources/open_board/css/open_board_list.css" rel="stylesheet" />

</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">자유게시판</h1>
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action">
								<strong>자유게시판</strong>
							</div>
							<div class="clear"></div>
							<div class="cntAllTextArea">총 ${totalCount} 개</div>
							<div class="searcharea">
								<form class="form-inline d-flex justify-content-center">

									<div class="selectSearchValue">
										<select class="form-control input-sm" name="selectReadCount">
											<option value="제목" selected="selected">제목</option>
											<option value="내용">내용</option>
											<option value="작성자">작성자</option>
										</select>
									</div>

									<div class="search_icon">
										<i class="material-icons dp48">search</i>
									</div>
									<div class="search_area_form_input">
										<input type="text" class="form-control"
											placeholder="으로 검색합니다." id="saerch_form_input_value">
									</div>
								</form>
							</div>
							<div class="clear"></div>

							<div class="card-content">
								<div class="table-responsive">
									<table class="table" id="dataTables-example">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>댓글수</th>
											</tr>
										</thead>
										<tbody>

											<!-- jstl el -->
											<c:forEach var="post" items="${posts}">
												<tr>
													<td>${post.view_idx}</td>
													<td><a href="/openboard/${post.bo_idx}">${post.bo_title}</a></td>
													<td>${post.user_name}</td>
													<td>${post.bo_writedate}</td>
													<td>${post.bo_views}</td>
													<td>${post.bo_comments}</td>
												</tr>
											</c:forEach>
											<!--  -->

										</tbody>
									</table>

									<div class="selectReadCountArea">
										<div class="selectReadCountSelect">
											<select class="form-control input-sm" name="selectReadCount">
												<option value="10" selected="selected">10</option>
												<option value="20">20</option>
												<option value="30">30</option>
												<option value="50">50</option>
											</select>
										</div>
										<div class="selectReadCountText">개씩보기</div>
									</div>

									<div class="writebtnArea">
										<a href="/openboard/new"><button type="button" class="btn" onclick="">글쓰기</button></a>
									</div>

									<div class="clear"></div>

									<div style="width: 550px; margin-left: auto; margin-right: auto; text-align: center">
										<ul class="pagination">
											<c:if test="${pagingNavInfo.firstPage}">
												<li class="page-item"><a class="page-link" href="/openboard?offset=${pagingNavInfo.firstPageOffset}&max=${pagingNavInfo.firstPageMax}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}"><span>≪</span></a></li>
											</c:if>
											<c:if test="${pagingNavInfo.prev}">
												<li class="page-item"><a class="page-link" href="/openboard?offset=${pagingNavInfo.prevPageOffset}&max=${pagingNavInfo.prevPageMax}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}"><span>＜</span></a></li>
											</c:if>
											
											<c:set var="postsCount" value="0"/>
											<c:forEach var="i" begin="${pagingNavInfo.startPage}" end="${pagingNavInfo.endPage}">
												<c:choose>
													<c:when test="${i eq pagingNavInfo.currentPage}">
														<li class="page-item"><a class="page-link" style="color: white; background-color: #f44336;" href="/openboard?offset=${pagingNavInfo.offset + postsCount}&max=${pagingNavInfo.max + postsCount}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/openboard?offset=${pagingNavInfo.offset + postsCount}&max=${pagingNavInfo.max + postsCount}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}">${i}</a></li>
													</c:otherwise>
												</c:choose>
												<c:set var="postsCount" value="${postsCount + pagingNavInfo.postsCount}"/>
											</c:forEach>
											
											<c:if test="${pagingNavInfo.next}">
												<li class="page-item"><a class="page-link" href="/openboard?offset=${pagingNavInfo.nextPageOffset}&max=${pagingNavInfo.nextPageMax}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}"><span>＞</span></a></li>
											</c:if>
											<c:if test="${pagingNavInfo.lastPage}">
												<li class="page-item"><a class="page-link" href="/openboard?offset=${pagingNavInfo.lastPageOffset}&max=${pagingNavInfo.lastPageMax}&sort=${pagingNavInfo.pageInfo.sort}&order=${pagingNavInfo.pageInfo.order}"><span>≫</span></a></li>
											</c:if>
										</ul>
									</div>
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