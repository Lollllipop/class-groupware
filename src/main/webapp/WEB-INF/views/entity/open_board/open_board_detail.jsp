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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="${contextPath}/resources/materialize/css/materialize.min.css" media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${contextPath}/resources/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${contextPath}/resources/css/custom-styles.css" rel="stylesheet" />
<link href="${contextPath}/resources/open_board/css/open_board_detail.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css" rel="stylesheet" />
<!-- Include Editor style. -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />

<style>

	.timeline {
	   position: relative;
	   margin: 0 0 30px 0;
	   padding: 0;
	   list-style: none
	}
	
	.timeline:before {
	   content: '';
	   position: absolute;
	   top: 0px;
	   bottom: 0;
	   width: 4px;
	   background: #ddd;
	   left: 22px;
	   margin: 0;
	   border-radius: 2px
	}
	
	.timeline>li {
	   position: relative;
	   margin-right: 0px;
	   margin-bottom: 15px
	}
	
	.timeline>li:before, .timeline>li:after {
	   content: " ";
	   display: table
	}
	
	.timeline>li:after {
	   clear: both
	}
	
	.timeline>li>.timeline-item {
	   -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	   border-radius: 3px;
	   margin-top: 0px;
	   background: #fff;
	   color: #444;
	   margin-left: 50px;
	   margin-right: 0px;
	   padding: 0;
	   position: relative
	}
	
	.timeline>li>.timeline-item>.time {
	   color: #999;
	   float: right;
	   padding: 10px 10px 0px 10px;
	   font-size: 12px
	}
	
	.timeline>li>.timeline-item>.timeline-header {
	   margin: 0;
	   color: #555;
	   padding: 0px 10px;
	   font-size: 16px;
	   line-height: 1.1
	}
	
	.timeline>li>.timeline-item>.timeline-header>a {
	   font-weight: 600;
	}
	
	.timeline>li>.timeline-item>.timeline-body {
	   padding: 0px 10px;
	}
	
	.timeline>li>.timeline-item>.timeline-footer {
		padding: 0px 10px 10px 10px;
	}
	
	.timeline>li.time-label>span {
	   font-weight: 600;
	   padding: 5px;
	   display: inline-block;
	   background-color: #fff;
	   border-radius: 4px
	}
	
	.timeline>li>.fa, .timeline>li>.glyphicon, .timeline>li>.ion {
	   width: 30px;
	   height: 30px;
	   font-size: 15px;
	   line-height: 30px;
	   position: absolute;
	   color: #666;
	   background: #d2d6de;
	   border-radius: 50%;
	   text-align: center;
	   left: 10px;
	   top: 0
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
							<div class="card-content">
								<div class="table-responsive">
									<div class="ref_file_area" style='padding: 8px;'>
										<div>
											<div class="content_title">${post.bo_title}</div>
										</div>
										<div>
											<a href="${prevPage}"><button class="btn" style="float: right;">목록</button></a>
										</div>
									</div>
									<table class="table">
										<thead>
											<tr>
												<td>
													<ul class="list-inline">
														<li>${post.user_name}</li>
														<li>| 작성일 ${post.bo_writedate}</li>
														<li id="updatedate" style="display: none;">| 수정일 ${post.bo_updatedate}</li>
														<div style="float: right;">
															<li><i class="material-icons dp48">chat_bubble</i> <b>${post.bo_comments}</b>
															</li>
														</div>
														<div style="float: right;">
															<li><i class="material-icons dp48">visibility</i> <b>${post.bo_views}</b>
															</li>
														</div>
													</ul>
												</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<!-- fr-view 클래스를 사용해야 에디터에서 작성한 그대로 보존시켜줌 -->
													<div class="fr-view">
														${post.bo_content}
													</div>
													<div class="share">
														<i class="fas fa-share-alt"></i>
													</div>
												</td>
											</tr>
											<tr>
												<c:if test="${isAuthor}">
													<td>
														<a href='/openboard/${bo_idx}/edit' id='update-button'><button class="btn">수정</button></a>
														<a id='delete-button'><button class="btn">삭제</button></a>
													</td>
												</c:if>
											</tr>
											<tr>
												<td>
													<div class="form-group">
														<form action='/openboard/${bo_idx}/comments' method="POST">
															<textarea class="form-control" rows="5" placeholder="댓글을 작성해주세요." class="span2" name='comm_content'></textarea>
															<td>
																<input type="submit" value="등록" class="btn" id='comment-submit-btn'>
															</td>
														</form>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<div style="clear : both"></div>
					
					<div class='col-md-12'>
						<ul class="timeline">
							<c:forEach var="comment" items="${comments}">
								<li class="replyLi" data-hw_submit_idx='${comment.bo_idx}' name="listSubmit">
									<i class="fa fa-comments bg-blue"></i>
					 				<div class="timeline-item">
										<span class="time">
											<div style="float : left;"><i class="fa fa-clock-o"></i></div><div style="float : left;"><p id="hw_submit_content_writedate_p">${comment.comm_convertedwritedate}</p></div>
										</span>
					
					 					<h3 class="timeline-header"><input type="text" name="user_name_p" value ="${comment.user_name}" readonly="readonly" style="color : black;"></h3> 
					
										<div class="timeline-body">
											<input type="text" name="hw_submit_content_p" value="${comment.comm_content}" readonly="readonly" style="color : black;">
										</div>
					
					    				<div class="timeline-footer">
					     					<div onclick="submitModTry()" style="float : left;"><a class="btn btn-primary btn-xs">수정</a></div>
					    					<div onclick="deleteComment(${post.bo_idx}, ${comment.comment_idx})" style="float : left;"><a class="btn btn-danger btn-xs" data-targer="modifyModal">삭제</a></div>
					   						<div style="clear:both;"></div>
					    				</div>
									</div>         
								</li>
							</c:forEach>                     
	                     </ul>
					</div>
                     
				</div>
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			</div>
		</div>
		</div>
	
	<!-- jQuery Js -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<script src="${contextPath}/resources/open_board/js/open_board_detail.js"></script>
	<!-- Handlebars -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script> 

	<script type="text/javascript">
		function deleteComment(bo_idx, comment_idx) {
			var isWantDelete 	= confirm('정말 삭제하시겠습니까?');
			
			if (isWantDelete) {
				$.ajax({
					type 	: 'DELETE',
					url		: '/openboard/' + bo_idx + '/comments/' + comment_idx,
					success	: function(data, textStatus, xhr) {
						window.location.href = window.location.href;
					}
				})
			}
			
		}
	
		$(window).load(function() {
			
			/* 수정된 게시물인지 체크 */
			var isUpdated = ${post.bo_updatedate} + "";
			
			if (isUpdated) {
				$('#updatedate').css('display', 'inline-block');
			}
			
			/* 게시물 삭제 액션 */
			$('#delete-button').on("click", function(){
				var bo_idx 			= ${post.bo_idx};
				var prevPage 		= '${prevPage}';
				var pagePath 		= prevPage.substring(window.location.origin.length);
				var isWantDelete 	= confirm('정말 삭제하시겠습니까?');
				
				if (isWantDelete) {
					$.ajax({
						type 	: 'DELETE',
						url		: '/openboard/' + bo_idx,
						success	: function(data, textStatus, xhr) {
							window.location.href = pagePath;
						}
					})
				}
			})
			
		})
	</script>

</body>
</html>
