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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${contextPath}/resources/materialize/css/materialize.min.css" rel="stylesheet" media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="${contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${contextPath}/resources/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${contextPath}/resources/css/custom-styles.css" rel="stylesheet" />
<link href="${contextPath}/resources/open_board/css/open_board_write.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css" rel="stylesheet">

<!-- WYSIWYG Editor style -->
<!-- package (all plugins included) -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css" rel="stylesheet" />

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
								<!-- 멀티파트 폼데이터를 받는 무언가가 필요할듯 -->
								<!-- enctype='multipart/form-data' -->
								<form id="submit-form" action="/openboard" method="POST" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table" id="dataTables-example"
											style="width: 60%; margin-left: auto; margin-right: auto;">
											<thead>
												<tr>
													<td style="text-align: center; vertical-align: middle;">제목</td>
													<td colspan="2">
														<input type="text" name='bo_title' id='post-title' class="form-control" placeholder="내용을 입력해주세요" style="vertical-align: middle;">
														<input type="hidden" name='user_idx' value='${user_idx}'>
														<input type="hidden" name='class_idx' value='${class_idx}'>
														<input type="hidden" name='bo_role' value='${bo_role}'>
														<input type="hidden" name='bo_hasfiles' value='false' id='has-files'>
													</td>
												</tr>
												<tr>
													<td style="text-align: center">작성자</td>
													<td>${login.user_name}</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="3">
														<textarea id='editor-area' name='bo_content'></textarea>
													</td>
												</tr>
												<c:if test="${hasNoticeAuth}">
													<tr>
														<td style="text-align: center">
															공지 여부
															<input type="hidden" name='user2' value='777'>
														</td>
														<td>
															<input type="checkbox" class="filled-in" id="filled-in-box" name="bo_isnotice" value="true">
															<label for="filled-in-box" style="height:11px !important;"></label>
														</td>
														
													</tr>
												</c:if>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="3">
														<div style="float: right;">
															<input type="submit" value="등록" class="btn btn-success" id='submit-btn'>
															<a href=${prevPage}><input type="button" value="목록으로" class="btn btn-primary"></a>
														</div>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			</div>
		</div>
	</div>


	<!-- jQuery Js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<!-- WYSIWYG Editor JS -->
	<!-- package (all plugins included) -->
	<script src="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/js/froala_editor.pkgd.min.js"></script>
	
	<script>
		$(function() {
			/* Initialize the editor. */
			$('#editor-area').froalaEditor({
				// 에디터 세로 길이
				height : 300,
				
				/* 이미지 업로드 */
				// 이미지 업로드 경로
				imageUploadURL: '/openboardajax/image',
		        // 이미지 전송 방법
		        imageUploadMethod: 'POST',
		        // 허용 파일 타입
		        imageAllowedTypes: ['jpeg', 'jpg', 'png']
			})
			.on('froalaEditor.image.inserted', function (e, editor, $img, response) {
				$('#has-files').val('true');
			})
			.on('froalaEditor.image.removed', function (e, editor, $img) {
				var data = {
						src: $img.attr('src')
				}
				
				$.ajax({
					// Request method.
					method	: "DELETE",
					
					// Request URL.
					url		: "/openboardajax/image",
					
					// Request params.
					data 	: JSON.stringify(data),
					headers	: {"Content-Type": "application/json"},
					dataType: 'text',
				})
	 			.done (function (data) {
					  console.log ('image was deleted');
					  $('#has-files').val('false');
				})
				.fail (function () {
					  console.log ('image delete problem');
				}) 
			})
			
			/* null값 방지 스크립트 */
			$('#submit-btn').on('click', function() {
				var titlaVal = $('#post-title').val();
				var contentVal = $('#editor-area').val();
				
				if (titlaVal === "") {
					alert("제목을 입력해주세요.");
				} else {
					if (contentVal === "") {
						alert("내용을 입력해주세요.");
					}
				}

			})
		});
	</script>

</body>
</html>