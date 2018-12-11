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
	
	.recomment, .prev-recomment {
	    background-color: #fff;
		margin-left: 100px;
		margin-top: 7px;
		border-radius: 3px;
		padding: 10px;
	}
	
	.recomment-content input{
		padding: 0px;
	}

	#upload-box {
		height: 130px; 
		width: 100%;
		border: 1px solid #fdb6b6;
		border-radius: 2px;
		background-color: #ffe3e1;
		/* line-height: 100px;
		color: white; */
	}
	
	.upload-item {
		display: inline-block;
		margin-right: 5px;
		height: 120px;
		padding: 5px;
		width: 160px;
	}
	
	.upload-image {
		height: 80px;
	}
	
	.upload-top {
		background-color: white;
		padding: 5px;
	}
	
	.upload-bottom {
		background-color: #e0e0e0;
		padding: 0 5px 0 5px;
		text-align: left;
	}
	
	.upload-bottom .fa-window-close {
	    margin-left: 20px;
	}
	
	.upload-file-name {
		display: inline-block;
		width: 100px;
		overflow: hidden; 
		text-overflow: ellipsis;
		white-space: nowrap; 
		margin-bottom: -5px;
	}
	
	.fa-window-close {
		cursor: pointer; 
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
												<td>
													<div class="download-box">
														<c:forEach items='${thumbnails}' var='thumbnail'>
															<div class='upload-item'>
																<div class='upload-top'>
																	<span>
																		<img src="${thumbnail.thumbnail_link}" alt="Attachment" class='upload-image'>
																	</span>
																</div>
																<div class='upload-bottom'>
																	<p class='upload-file-name'>${thumbnail.file_name}</p>
																	
																	<!-- 
																	<form action="/referenceboard/displayfile" method="POST" id='download-form'>
																		<input type="hidden" name='file_link' value='${thumbnail.file_link}'>
																	</form>
																	<a onclick='$("#download-form").submit()' download><i class="far fa-arrow-alt-circle-down"></i></a> 
																	 -->
																	
																	<a href='${thumbnail.file_link}' download><i class="far fa-arrow-alt-circle-down"></i></a>
																</div>
															</div> 
														</c:forEach>
													</div>
												</td>
											</tr>
											<tr>
												<c:if test="${isAuthor}">
													<td>
														<a href='/referenceboard/${bo_idx}/edit' id='update-button'><button class="btn">수정</button></a>
														<a id='delete-button'><button class="btn">삭제</button></a>
													</td>
												</c:if>
											</tr>
											<tr>
												<td>
													<div class="form-group">
														<form action='/referenceboard/${bo_idx}/comments' method="POST">
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
							<c:forEach var="comment" items="${comments}" varStatus="status">
								<li class="replyLi" data-hw_submit_idx='${comment.bo_idx}' name="listSubmit">
									<i class="fa fa-comments bg-blue"></i>
					 				<div class="timeline-item" id='comment-update-button${status.index}'>
										<span class="time">
											<div style="float : left;"><i class="fa fa-clock-o"></i></div><div style="float : left;"><p id="hw_submit_content_writedate_p">${comment.comm_convertedwritedate}</p></div>
										</span>
					
					 					<h3 class="timeline-header"><input type="text" name="user_name_p" value ="${comment.user_name}" readonly="readonly" style="color : black;"></h3> 
					
										<div class="timeline-body">
											<input type="text" name="hw_submit_content_p" value="${comment.comm_content}" readonly="readonly" style="color : black;">
										</div>
										
					    				<div class="timeline-footer">
					    				
					    					<c:if test="${isAuthor}">
						    					<!-- if문 사용해서 현재 세션의 user_idx와 현재 댓글의 user_idx를 비교해서 동일하면 보이도록 처리해야함 -->
						     					<div style="float : left;">
						     						<a class="btn btn-primary btn-xs" onclick="updateComment(${status.index}, ${post.bo_idx}, ${comment.comment_idx}, '${comment.comm_content}')">수정</a>
						     					</div>
						    					<div style="float : left;">
						    						<a class="btn btn-danger btn-xs" onclick="deleteComment(${status.index}, ${post.bo_idx}, ${comment.comment_idx})">삭제</a>
						    					</div>
						    					<!--  -->
					    					</c:if>
					    					
					    					<div style="float : left;">
					    						<a class="btn btn-primary btn-xs" onclick="createReComment(${status.index}, ${post.bo_idx}, ${comment.comment_idx}, '${comment.user_name}')">대댓글 작성</a>
					    					</div>
					   						<div style="clear:both;"></div>
					    				</div>
									</div>   <!-- timeline-item end -->  
									<c:if test="${not empty comment.reComments}">
										<c:forEach var="reComment" items="${comment.reComments}" varStatus="status2">
											<div class="recomment" id='comment-update-button${status.index}${status2.index}'>
											
												<div style="float: right; color: #999;">
													<div style="float : left;">
														<i class="fa fa-clock-o"></i>
													</div>
													<div style="float : left;">
														<p id="hw_submit_content_writedate_p">${reComment.comm_convertedwritedate}</p>
													</div>
												</div>
												
												<div class="recomment-user-name" style="clear: both;">
													${reComment.user_name} 
												</div>
												
												<div class="recomment-content timeline-body">
													<input type="text" value="${reComment.comm_content}" readonly="readonly" style="color : black;">
												</div>
												
												<div class="recomment-buttons">
													<c:if test="${isAuthor}">
														<div style="float: left;">
															<a class="btn btn-primary btn-xs" onclick="updateReComment('${status.index}' + '${status2.index}', ${post.bo_idx}, ${reComment.comment_idx}, '${reComment.comm_content}')">수정</a>
														</div>
														<div style="float: left;">
															<a class="btn btn-danger btn-xs" onclick="deleteComment('${status.index}' + '${status2.index}', ${post.bo_idx}, ${reComment.comment_idx})">삭제</a>
														</div>
													</c:if>
													<div style="clear: both;"></div>
												</div>
											</div>
										</c:forEach>
									</c:if>    
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

	<script id="thumbnail-template" type="text/x-handlebars-template">
		<div class='upload-item'>
			<div class='upload-top'>
				<span>
					<img src="{{thumbnail_link}}" alt="Attachment" class='upload-image'>
				</span>
			</div>
			<div class='upload-bottom'>
				<p class='upload-file-name'>{{file_name}}</p>
				<i class="far fa-window-close" onclick='deleteUploadedFile()' id='{{thumbnail_link}}'></i>
			</div>
		</div>              
	</script>  

	<script type="text/javascript">
		var isOpenReCommentWriteBox = false;
		
		function deleteComment(idx, bo_idx, comment_idx) {
			var isWantDelete = confirm('정말 삭제하시겠습니까?');
			
			if (isWantDelete) {
				$.ajax({
					type 	: 'DELETE',
					url		: '/referenceboard/' + bo_idx + '/comments/' + comment_idx,
					success	: function(data, textStatus, xhr) {
						window.location.href = window.location.href;
					}
				})
			}
			
		}
		
		function createReComment(idx, bo_idx, comment_idx, user_name) {
			if (isOpenReCommentWriteBox) {
				return;
			} else {
				isOpenReCommentWriteBox = true;
			}
			
			// comment_idx에 대한 댓글 작성하면 될 듯
			
			var view = ''
				+ '<div class="prev-recomment">'
				+ 	'<div class="recomment-user-name">'
				+		user_name
				+	'</div>'
				+ 	'<div class="recomment-content">'
				+		'<input type="text">'
				+	'</div>'
				+ 	'<div class="recomment-buttons">'
				+		'<a class="btn btn-primary btn-xs" onclick="createReCommentConfirm(' + bo_idx + ',' + comment_idx + ')">확인</a>'
				+		'<a class="btn btn-danger btn-xs" onclick="createReCommentCancle()">취소</a>'
				+	'</div>'
				+ '</div>';
				
			$('#comment-update-button' + idx).after(view);
		}
		
		// TODO 이거 하는 중임 지금 (대댓글)
		function createReCommentConfirm(bo_idx, comm_parent_idx) {
			var data = {
					'comm_content' : $('.prev-recomment .recomment-content input').val()
			}
			
 			$.ajax({
				type 	: 'POST',
				data 	: JSON.stringify(data),
				headers	: {"Content-Type": "application/json"},
				dataType: 'text',
				url		: '/referenceboardajax/' + bo_idx + '/comments/' + comm_parent_idx + '/recomments/new',
				success	: function(data, textStatus, xhr) {
					window.location.href = window.location.href;
				}
			}) 
		}
		
		function createReCommentCancle() {
			$('.prev-recomment').remove();
			
			isOpenReCommentWriteBox = false;
		}
		
		function updateComment(idx, bo_idx, comment_idx, comm_content) {
			// 입력창 활성화
			event.target.parentElement.parentElement.parentElement.children[2].innerHTML = ''
                + '<div class="timeline-body">'
                + '<input type="text" value="' + comm_content + '" id="hw_submit_content_p" style="color : black;"></div>'
                + '<div class="timeline-footer">';
            
            // 확인, 취소 버튼 활성화
            event.target.parentElement.parentElement.innerHTML = ''
            	+ '<div style="float : left;">'
				+ 	'<a class="btn btn-primary btn-xs" onclick="updateConfirm(' + idx + ',' + bo_idx + ',' + comment_idx + ',' + comm_content + ')">확인</a>'
				+ '</div>'
				+ '<div style="float: left;>"'
				+ 	'<a class="btn btn-danger btn-xs" onclick="updateCancle(' + idx + ',' + bo_idx + ',' + comment_idx + ',' + comm_content +')">취소</a>'
				+ '</div>'
				+ '<div style="clear:both;"></div>';
		}
		
		function updateReComment(idx, bo_idx, comment_idx, comm_content) {
			event.target.parentElement.parentElement.parentElement.children[2].innerHTML = ''
                + '<div class="recomment-content">'
                + '<input type="text" value="' + comm_content + '" id="hw_submit_content_p" style="color : black;">'
                + '</div>';

            event.target.parentElement.parentElement.innerHTML = ''
            	+ '<div style="float : left;">'
				+ 	'<a class="btn btn-primary btn-xs" onclick="updateConfirm(\'' + idx + '\',' + bo_idx + ',' + comment_idx + ',' + comm_content + ')">확인</a>'
				+ '</div>'
				+ '<div style="float: left;>"'
				+ 	'<a class="btn btn-danger btn-xs" onclick="updateCancle(' + idx + ',' + bo_idx + ',' + comment_idx + ',' + comm_content +')">취소</a>'
				+ '</div>'
				+ '<div style="clear:both;"></div>';
		}
		
		function updateConfirm(idx, bo_idx, comment_idx, comm_content) {	
			console.log(idx);
			
			var data = {
					'comm_content': $('#comment-update-button' + idx + ' .timeline-body input').val()
			}
			
  			$.ajax({
				type 	: 'PATCH',
				data 	: JSON.stringify(data),
				headers	: {"Content-Type": "application/json"},
				dataType: 'text',
				url		: '/referenceboardajax/' + bo_idx + '/comments/' + comment_idx,
				success	: function(data, textStatus, xhr) {
					window.location.href = window.location.href;
				}
			})   
		}
		
		function updateCancle(idx, bo_idx, comment_idx, comm_content) {
			event.target.parentElement.parentElement.children[2].innerHTML = ''
				+ '<input type="text" name="hw_submit_content_p" value="' + comm_content + '" readonly="readonly" style="color : black;">';
			
			event.target.parentElement.innerHTML = ''
            	+ '<div style="float : left;">'
				+ 	'<a class="btn btn-primary btn-xs" onclick="updateComment(' + idx + ',' + bo_idx + ',' + comment_idx + ',' + comm_content + ')">수정</a>'
				+ '</div>'
				+ '<div style="float: left;>"'
				+ 	'<a class="btn btn-danger btn-xs" onclick="deleteComment(' + idx + ',' + bo_idx + ',' + comment_idx + ')">삭제</a>'
				+ '</div>'
				+ '<div style="clear:both;"></div>';
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
						url		: '/referenceboard/' + bo_idx,
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
