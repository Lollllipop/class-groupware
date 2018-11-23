<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 페이징 옵션 설정  -->
<%
	request.setAttribute("path", "openboard");
	request.setAttribute("p", request.getAttribute("pagingNavInfo"));
%>

<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Class Groupware</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="${contextPath}/resources/materialize/css/materialize.min.css" media="screen,projection" rel="stylesheet"/>
<!-- Bootstrap Styles-->
<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
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

<!-- 커스텀 css -->
<style type="text/css">
	
	#dataTables-example .fas {
		cursor: pointer;
		color: #b5b5b5;
	}
	
</style>

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
												<th>조회수  <i class="fas fa-sort-amount-up" id="views-sort-up"></i> <i class="fas fa-sort-amount-down" id="views-sort-down"></i> </th>
												<th>댓글수 <i class="fas fa-sort-amount-up" id="comments-sort-up"></i> <i class="fas fa-sort-amount-down" id="comments-sort-down"></i> </th>
											</tr>
										</thead>
										<tbody id='posts-body'>
										
											<!-- 리스트 부분 -->
											<c:forEach var="post" items="${posts}">
											
												<c:choose>
													<c:when test="${post.bo_isnotice}">
														<tr style='background-color: #f9f9f8; font-weight: 900;'>
															<td style='color: #f44336;'>공지</td>
															<td><a href="/openboard/${post.bo_idx}">${post.bo_title}</a></td>
															<td>${post.user_name}</td>
															<td>${post.bo_convertedwritedate}</td>
															<td>${post.bo_views}</td>
															<td>${post.bo_comments}</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td>${post.view_idx}</td>
															<td><a href="/openboard/${post.bo_idx}">${post.bo_title}</a></td>
															<td>${post.user_name}</td>
															<td>${post.bo_convertedwritedate}</td>
															<td>${post.bo_views}</td>
															<td>${post.bo_comments}</td>
														</tr>
													</c:otherwise>
												</c:choose>

											</c:forEach>
											
										</tbody>
									</table>

									<div class="selectReadCountArea">
										<div class="selectReadCountSelect">
											<select class="form-control input-sm" id="readCountOfPosts" name="selectReadCount">
												<option value="10" selected="selected">10</option>
												<option value="20">20</option>
												<option value="30">30</option>
												<option value="50">50</option>
											</select>
										</div>
										<div class="selectReadCountText">개씩보기</div>
									</div>
									
									<div class="writebtnArea">
										<a href="/openboard/new"><button type="button" class="btn" data-toggle="tooltip" data-placement="top" title="abcde">글쓰기</button></a>
									</div>
									<div class="clear"></div>
									<div style="width: 550px; margin-left: auto; margin-right: auto; text-align: center">
										<ul class="pagination" id='paging-buttons'>
											
											<!-- 처음 및 이전 페이지 버튼 -->
											<c:if test="${p.firstPage}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.firstPageOffset}&max=${p.firstPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}"><span>≪</span></a></li>
											</c:if>
											<c:if test="${p.prev}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.prevPageOffset}&max=${p.prevPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}"><span>＜</span></a></li>
											</c:if>
											
											<!-- 페이지 버튼 -->
											<c:set var="postsCount" value="0"/>
											<c:forEach var="i" begin="${p.startPage}" end="${p.endPage}">
												<c:choose>
													<c:when test="${i eq p.currentPage}">
														<li class="page-item"><a class="page-link" style="color: white; background-color: #f44336;" href="/${path}?offset=${p.offset + postsCount}&max=${p.max + postsCount}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/${path}?offset=${p.offset + postsCount}&max=${p.max + postsCount}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}">${i}</a></li>
													</c:otherwise>
												</c:choose>
												<c:set var="postsCount" value="${postsCount + p.postsCount}"/>
											</c:forEach>
											
											<!-- 다음 및 마지막 페이지 버튼 -->
											<c:if test="${p.next}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.nextPageOffset}&max=${p.nextPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}"><span>＞</span></a></li>
											</c:if>
											<c:if test="${p.lastPage}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.lastPageOffset}&max=${p.lastPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}"><span>≫</span></a></li>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<script>
	
	var offset 			= null;
	var max 			= null;
	var sort 			= 'bo_idx';
	var order 			= null;
	
	var viewsOrder 		= null;
	var commentsOrder	= null;
	
	function getQuerystring(paramName){ 
		var tempUrl = window.location.search.substring(1);
		var tempArray = tempUrl.split('&'); 
		
		if (tempArray[0] !== '') {
			for(var i = 0; tempArray.length; i++) { 
				var keyValuePair = tempArray[i].split('=');
				
				if(keyValuePair[0] == paramName){
					return keyValuePair[1]; 
				} 
			} 
		} else {
			return 0;
		}
	}

	function getChangedRangePosts() {
		var selectedCount 	= $('#readCountOfPosts option:selected').val();
		var offset			= '${p.pageInfo.offset}';
		var max				= String(parseInt(offset) + parseInt(selectedCount));
		var sort 			= '${p.pageInfo.sort}';
		var order 			= '${p.pageInfo.order}';
		
		$.ajax({
			type	: 'GET',
			url		: '/openboardajax?offset=' + offset + '&max=' + max + '&sort=' + sort + '&order=' + order,
			success : function(data, textStatus, xhr) {
				console.log(data);
				
		        $('#posts-body').empty();
		        $('#paging-buttons').empty();
		        
		        data.posts.forEach(function(item, index, array) {
			        var post_tr 	= item.bo_isnotice === 'true'
			        					? `<tr style='background-color: #f9f9f8; font-weight: 900;'>`
			        					: `<tr>`;
				    var view_idx 	= item.bo_isnotice === 'true'
				    					? `<td style='color: #f44336;'>공지</td>`
				    					: `<td>` + item.view_idx + `</td>`;
		        	
		       		var post =
						post_tr +
							view_idx +
						   `<td><a href="/openboard/` + item.bo_idx + `">` + item.bo_title + `</a></td>
							<td>` + item.user_name + `</td>
							<td>` + item.bo_convertedwritedate + `</td>
							<td>` + item.bo_views + `</td>
							<td>` + item.bo_comments + `</td>
						</tr>`;
						
		        	$('#posts-body').append(post);
		        });
		        
		        var path = 'openboard';
		        var p	 = data.pagingNavInfo;
		        
		        var firstButton = p.firstPage 
		        					? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.firstPageOffset + `&max=` + p.firstPageMax + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>≪</span></a></li>`
		        					: ``;
		        var prevButton = p.prev
		        					? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.prevPageOffset + `&max=` + p.prevPageMax + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>＜</span></a></li>`
		        					: ``;

		        var nextButton = p.lastPage
									? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.nextPageOffset + `&max=` + p.nextPageMax + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>＞</span></a></li>`
									: ``; 
		        
		        var lastButton = p.lastPage
									? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.lastPageOffset + `&max=` + p.lastPageMax + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>≫</span></a></li>`			
									: ``;
									
				var currentPageList = ``;
				var postsCount = 0;
				
				for (var i = p.startPage; i <= p.endPage; i++) {
					currentPageList += i === p.currentPage 
											? `<li class="page-item"><a class="page-link" style="color: white; background-color: #f44336;" href="/` + path + `?offset=` + (p.offset + postsCount) + `&max=` + (p.max + postsCount) + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>` + i + `</span></a></li>`
											: `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + (p.offset + postsCount) + `&max=` + (p.max + postsCount) + `&sort=` + p.pageInfo.sort + `&order=` + p.pageInfo.order + `"><span>` + i + `</span></a></li>`
												  
					postsCount += p.postsCount
				}
					        
		        var pagingInfo = firstButton + prevButton + currentPageList + nextButton + lastButton;
		        
		        $('#paging-buttons').append(pagingInfo);
		    },
		    error	: function(request, status, error) {
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});
	}
	
	
 	$(window).load(function(){
 		
 		// html에 이벤트 등록하는 코드
		$('#readCountOfPosts').on("change", function(){
			getChangedRangePosts();
		})
		
		$('#views-sort-up').on("click", function(){
			console.log('views-sort-up!!');
	
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#f44336');
			
			viewsOrder 	= 'asc';
			sort		= 'bo_views';
			
			
			
			// TODO
			var selectedCount 	= $('#readCountOfPosts option:selected').val();
			var offset			= '${p.pageInfo.offset}';
			var max				= String(parseInt(offset) + parseInt(selectedCount));
			var sort 			= 'bo_views';
			var order 			= viewsOrder;
			
			$.ajax({
				type	: 'GET',
				url		: '/openboardajax?offset=' + offset + '&max=' + max + '&sort=' + sort + '&order=' + order,
				success : function(data, textStatus, xhr) {
					console.log(data);
			    },
			    error	: function(request, status, error) {
			    	alert("code:"+request.status+"\n"+"error:"+error);
			    }
			});
			//
			
			
			
		})
		
		$('#views-sort-down').on("click", function(){
			console.log('views-sort-down!!');
			
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#views-sort-down').css('color', '#f44336');
			
			viewsOrder 	= 'desc';
			sort		= 'bo_views';
			
		})
		
		$('#comments-sort-up').on("click", function(){
			console.log('comments-sort-up!!');
			
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#f44336');
			
			commentsOrder 	= 'asc';
			sort			= 'bo_comments';
			
		})
		
		$('#comments-sort-down').on("click", function(){
			console.log('comments-sort-down!!');
			
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-down').css('color', '#f44336');
			
			commentsOrder 	= 'desc';
			sort			= 'bo_comments';
			
		})
		
		// 게시물 수 옵션이 현재 렌더링 되는 게시물수와 동일하게 선택되어 있도록 하는 코드
		var offset 		= getQuerystring('offset');
		var max 		= getQuerystring('max');
		var postsCount 	= max - offset;
		
		$('#readCountOfPosts').find('option[seleted=true]').attr('selected', false);
		$('#readCountOfPosts').find('option[value=' + postsCount +']').attr('selected', true);
		
		// 작성일에 마우스를 가져다대면 자세한 날짜가 나오도록 하는 코드
		$('[data-toggle="tooltip"]').tooltip()

	});
 	
	</script>
</body>
</html>