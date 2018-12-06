<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 페이징 옵션 설정  -->
<%
	request.setAttribute("path", "referenceboard");
	request.setAttribute("p", request.getAttribute("pagingNavInfo"));
	request.setAttribute("s", request.getAttribute("searchInfo"));
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
	
	#dataTables-example td:nth-of-type(1), td:nth-of-type(5), td:nth-of-type(6) {
		width: 100px !important;
	}
	
	#dataTables-example td:nth-of-type(2) {
		white-space: nowrap;
   	 	overflow: hidden;
    	text-overflow: ellipsis;
	}
	
	#dataTables-example td:nth-of-type(3) {
		width: 150px !important;
		white-space: nowrap;
   	 	overflow: hidden;
    	text-overflow: ellipsis;
	}
	
	#dataTables-example td:nth-of-type(4) {
		width: 170px !important;
	}
	
	#saerch_form_input_value {
		margin-bottom: 0px;
	}
	
	#keywords-box {
		position: absolute;
		background-color: white;
		width: 166px;
	}
	
	#keywords-box div {
	    padding: 7px;
    	border: 1px solid #a2a2a2;
    	cursor:pointer;
	}

	
</style>

</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">자료실</h1>
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-action">
								<strong>자료실</strong>
							</div>
							<div class="clear"></div>
							<div class="cntAllTextArea">총 ${totalCount} 개</div>
							<div class="searcharea">
								<form class="form-inline d-flex justify-content-center" id='search-form' method="GET">

									<div class="selectSearchValue">
										<select class="form-control input-sm" name="searchtype" id='search-type-select'>
											<option value="t" selected="selected">제목</option>
											<option value="u">작성자</option>
										</select>
									</div>

									<div class="search_icon">
										<i class="material-icons dp48" style="cursor:pointer" id='search-button'>search</i>
									</div>
									<div class="search_area_form_input" id='search-area-form-input-box'>
										<input type="text" class="form-control" placeholder="검색어 입력..." id="saerch_form_input_value" name='searchvalue' autocomplete="off">
										<div id='keywords-box'></div>
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
															<td>
																<a href="/referenceboard/${post.bo_idx}">${post.bo_title}</a>
																<c:if test="${post.bo_hasfiles eq 'true'}"><i class="far fa-image"></i></c:if>
																<c:if test="${post.bo_isNew eq 'true'}">
																	<i class="badge red">new</i>
																</c:if>
															</td>
															<td>${post.user_name}</td>
															<td>${post.bo_convertedwritedate}</td>
															<td>${post.bo_views}</td>
															<td>${post.bo_comments}</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td>${post.view_idx}</td>
															<td>
																<a href="/referenceboard/${post.bo_idx}">${post.bo_title}</a>
																<c:if test="${post.bo_hasfiles eq 'true'}"><i class="far fa-image"></i></c:if>
																<c:if test="${post.bo_isNew eq 'true'}">
																	<i class="badge red">new</i>
																</c:if>
															</td>
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
										<a href="/referenceboard/new"><button type="button" class="btn" data-toggle="tooltip" data-placement="top" title="abcde">글쓰기</button></a>
									</div>
									<div class="clear"></div>
									<div style="width: 550px; margin-left: auto; margin-right: auto; text-align: center">
										<ul class="pagination" id='paging-buttons'>
											
											<!-- 처음 및 이전 페이지 버튼 -->
											<c:if test="${p.firstPage}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.firstPageOffset}&max=${p.firstPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}"><span>≪</span></a></li>
											</c:if>
											<c:if test="${p.prev}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.prevPageOffset}&max=${p.prevPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}"><span>＜</span></a></li>
											</c:if>
											
											<!-- 페이지 버튼 -->
											<c:set var="postsCount" value="0"/>
											<c:forEach var="i" begin="${p.startPage}" end="${p.endPage}">
												<c:choose>
													<c:when test="${i eq p.currentPage}">
														<li class="page-item"><a class="page-link" style="color: white; background-color: #f44336;" href="/${path}?offset=${p.offset + postsCount}&max=${p.max + postsCount}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/${path}?offset=${p.offset + postsCount}&max=${p.max + postsCount}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}">${i}</a></li>
													</c:otherwise>
												</c:choose>
												<c:set var="postsCount" value="${postsCount + p.postsCount}"/>
											</c:forEach>
											
											<!-- 다음 및 마지막 페이지 버튼 -->
											<c:if test="${p.next}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.nextPageOffset}&max=${p.nextPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}"><span>＞</span></a></li>
											</c:if>
											<c:if test="${p.lastPage}">
												<li class="page-item"><a class="page-link" href="/${path}?offset=${p.lastPageOffset}&max=${p.lastPageMax}&sort=${p.pageInfo.sort}&order=${p.pageInfo.order}&searchtype=${s.searchType}&searchvalue=${s.searchValue}"><span>≫</span></a></li>
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
	
	<!-- Handlbars Templates -->
	<script id='keyword-template' type='text/x-handlebars-template'>
		{{#keywords}}
		<div onclick='moveRecommendKeywordToInputValue()'>
			{{keyword}}
		</div>
		{{/keywords}}
	</script>

	<!-- jQuery Js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<!-- Lodash -->
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>
	<!-- Handlebars -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script> 
	<script>
	
	var offset 			= '${p.pageInfo.offset}';
	var max 			= '${p.pageInfo.max}';
	var sort 			= 'bo_idx'; // 정렬 가운데에 들어갈 값
	var order 			= 'desc';   // 정렬 가운데에 들어갈 값
	var searchValue		= null;
	var searchType		= null;
	var selectedCount 	= $('#readCountOfPosts option:selected').val();
	
	function setSelectedCountWhenAjaxCall() {
		selectedCount = $('#readCountOfPosts option:selected').val();
	}
	
	function setMaxWhenAjaxCall() {
		max	= String(parseInt(offset) + parseInt(selectedCount));
	}
	
	function setSort(sort) {
		this.sort = sort;
	}
	
	function setOrder(order) {
		this.order = order;
	}
	
	function setSearchValue(searchValue) {
		this.searchValue = searchValue;
	}
	
	function setSearchType(searchType) {
		this.searchType = searchType;
	}
	
	function getQuerystring(paramName){ 
		var tempUrl = window.location.search.substring(1);
		var tempArray = tempUrl.split('&'); 
		
		if (tempArray[0] !== '') {
			for(var i = 0; i < tempArray.length; i++) { 
				var keyValuePair = tempArray[i].split('=');
				
				if(keyValuePair[0] == paramName){
					return keyValuePair[1]; 
				} 
			} 
		} else {
			return null;
		}
		return null;
	}

	function changeBoardAndPagingNav() {
		var url = '/referenceboardajax?offset=' + offset + '&max=' + max + '&sort=' + sort + '&order=' + order;
		
		if (getQuerystring('searchtype') && getQuerystring('searchvalue')) {
			url =  url + '&searchtype=' + getQuerystring('searchtype') + '&searchvalue=' + getQuerystring('searchvalue');
		}
			
		$.ajax({
			type	: 'GET',
			url		: url,
			success : function(data, textStatus, xhr) {
		        $('#posts-body').empty();
		        $('#paging-buttons').empty();
		        
		        data.posts.forEach(function(item, index, array) {
			        var post_tr 	= item.bo_isnotice === 'true'
			        					? `<tr style='background-color: #f9f9f8; font-weight: 900;'>`
			        					: `<tr>`;
				    var view_idx 	= item.bo_isnotice === 'true'
				    					? `<td style='color: #f44336;'>공지</td>`
				    					: `<td>` + item.view_idx + `</td>`;
				    var view_title	= item.bo_hasfiles === 'true'
				    					? 	
			    							`<td>
				    							<a href="/referenceboard/` + item.bo_idx + `">` + item.bo_title + `</a>
				    							<i class="far fa-image"></i>
				    						</td>`
				    					: `<td><a href="/referenceboard/` + item.bo_idx + `">` + item.bo_title + `</a></td>`;

				    // ajax로 요청되서 새로 들어오는 데이터에 new 뱃지를 달기 위한 코드
					if (item.bo_hasfiles === 'true') {
						if (item.bo_isNew === 'true') {
							view_title = 
										`<td>
			    							<a href="/referenceboard/` + item.bo_idx + `">` + item.bo_title + `</a>
			    							<i class="far fa-image"></i>
			    							<i class="badge red">new</i>
			    						</td>`
						}
					} else {
						if (item.bo_isNew === 'true') {
							view_title = 
								`<td>
	    							<a href="/referenceboard/` + item.bo_idx + `">` + item.bo_title + `</a>
	    							<i class="badge red">new</i>
	    						</td>`
						}
					}
				    					
		       		var post =
						post_tr +
							view_idx +
							view_title +
							`<td>` + item.user_name + `</td>
							<td>` + item.bo_convertedwritedate + `</td>
							<td>` + item.bo_views + `</td>
							<td>` + item.bo_comments + `</td>
						</tr>`;
						
		        	$('#posts-body').append(post);
		        });
		        
		        var path = 'referenceboard';
		        var p	 = data.pagingNavInfo;
		        
		        var orderAndSearchQueryString = '&sort=' + p.pageInfo.sort + '&order=' + p.pageInfo.order;
		        
		        if (getQuerystring('searchvalue')) {
		        	orderAndSearchQueryString = orderAndSearchQueryString + '&searchtype=' + getQuerystring('searchtype') + '&searchvalue=' + getQuerystring('searchvalue');
		        }
		        
		        var firstButton = p.firstPage 
		        					? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.firstPageOffset + `&max=` + p.firstPageMax + orderAndSearchQueryString + `"><span>≪</span></a></li>`
		        					: ``;
		        
		        var prevButton = p.prev
		        					? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.prevPageOffset + `&max=` + p.prevPageMax + orderAndSearchQueryString + `"><span>＜</span></a></li>`
		        					: ``;

		        var nextButton = p.lastPage
									? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.nextPageOffset + `&max=` + p.nextPageMax + orderAndSearchQueryString + `"><span>＞</span></a></li>`
									: ``; 
		        
		        var lastButton = p.lastPage
									? `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + p.lastPageOffset + `&max=` + p.lastPageMax + orderAndSearchQueryString + `"><span>≫</span></a></li>`			
									: ``;
									
				var currentPageList = ``;
				var postsCount = 0;
				
				for (var i = p.startPage; i <= p.endPage; i++) {
					currentPageList += i === p.currentPage 
											? `<li class="page-item"><a class="page-link" style="color: white; background-color: #f44336;" href="/` + path + `?offset=` + (p.offset + postsCount) + `&max=` + (p.max + postsCount) + orderAndSearchQueryString + `"><span>` + i + `</span></a></li>`
											: `<li class="page-item"><a class="page-link" href="/` + path + `?offset=` + (p.offset + postsCount) + `&max=` + (p.max + postsCount) + orderAndSearchQueryString + `"><span>` + i + `</span></a></li>`
												  
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
	
	// 게시물 수 옵션이 현재 렌더링 되는 게시물수와 동일하게 선택되어 있도록 하는 코드
	function setSelectOptionWhenRefreshing() {
		var offset 		= getQuerystring('offset');
		var max 		= getQuerystring('max');
		var postsCount 	= max - offset;
		
		$('#readCountOfPosts').find('option[seleted=true]').attr('selected', false);
		$('#readCountOfPosts').find('option[value=' + postsCount +']').attr('selected', true);
	}
	
	// 검색한 단어가 보존되도록 유지하는 코드
	function setSearchKeyword() {
		var searchValue = getQuerystring('searchvalue');
		
		if (searchValue) {
			$('#saerch_form_input_value').val(searchValue);
		}
	}
	
	function renderRecommendKeywords(keywords) {		
		$('#keywords-box').empty();
		
		// handlebars에서 편하게 사용하기 위해 배열 내용을 object 형태로 변환
		for (var i = 0; i < keywords.length; i++) {
			keywords[i] = {
					'keyword' : keywords[i]
			}
		}
		
		// handlebars 템플릿 가져오기
		var source = $("#keyword-template").html();
		
		// handlebars 템플릿 컴파일
		var template = Handlebars.compile(source);
		
		// handlebars 템플릿에 바인딩할 데이터를 객체 형태로 만듬
		var data = {
			'keywords' : keywords
		}
		
		// handlebars 템플릿에 데이터 바인딩 후 html 생성
		var html = template(data);
		
		$('#keywords-box').append(html);
	}
	
	function moveRecommendKeywordToInputValue() {
		var keyword = event.target.innerText;
		
		$('#saerch_form_input_value').val(keyword);
	}
	
 	$(window).load(function(){
 		// html에 이벤트 등록하는 코드
		$('#readCountOfPosts').on("change", function(){
			setSelectedCountWhenAjaxCall();
			setMaxWhenAjaxCall();
			
			changeBoardAndPagingNav();
		})
		
		$('#views-sort-up').on("click", function(){
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#f44336');
					
			setSort('bo_views');
			setOrder('asc');
			
			changeBoardAndPagingNav();
		})
		
		$('#views-sort-down').on("click", function(){
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#views-sort-down').css('color', '#f44336');
			
			setSort('bo_views');
			setOrder('desc');
			
			changeBoardAndPagingNav();
		})
		
		$('#comments-sort-up').on("click", function(){
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-down').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#f44336');
			
			setSort('bo_comments');
			setOrder('asc');
			
			changeBoardAndPagingNav();
		})
		
		$('#comments-sort-down').on("click", function(){
			$('#views-sort-down').css('color', '#b5b5b5');
			$('#views-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-up').css('color', '#b5b5b5');
			$('#comments-sort-down').css('color', '#f44336');
				
			setSort('bo_comments');
			setOrder('desc');
			
			changeBoardAndPagingNav();
		})
		
		/* 검색 버튼 클릭시 실행 */
		$('#search-button').on("click", function(){
			setSearchValue($('#saerch_form_input_value').val());
			setSearchType($('#search-type-select option:selected').val());
			
			$('#search-form').submit();
			
			// changeBoardAndPagingNav(); AJAX 이용시
		})
		
		/* 검색어 입력시 추천검색어 ajax로 긁어옴 */
		$('#saerch_form_input_value').on('input', _.debounce(function() {		
			var debouncedSearchKeyword 	= $('#saerch_form_input_value').val();
			var searchType				= $('#search-type-select option:selected').val();
			
			if (debouncedSearchKeyword === '') {
				$('#keywords-box').empty();
				
				return;
			}
			
			var url = '/referenceboardajax/recommandSeachKeyword?debouncedsearchkeyword=' + debouncedSearchKeyword + '&searchtype=' + searchType;
			
			$.ajax({
				type	: 'GET',
				url		: url,
				success : function(data, textStatus, xhr) {
					renderRecommendKeywords(data);
			    },
			    error	: function(request, status, error) {
			    	alert("code:"+request.status+"\n"+"error:"+error);
			    }
			});
		}, 600)) 
		
	});
 	
	</script>
</body>
</html>