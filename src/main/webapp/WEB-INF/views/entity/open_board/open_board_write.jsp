<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
 	// String user_name = request.getSession().getAttribute("user").getUser_name();
	// int user_idx = request.getSession().getAttribute("user").getUser_idx();
	String user_name = "테스터";
	int user_idx = 1;
	
%>

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
<link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
								<form id="submit-form" action="/openboard" method="post" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table" id="dataTables-example"
											style="width: 60%; margin-left: auto; margin-right: auto;">
											<thead>
												<tr>
													<td style="text-align: center; vertical-align: middle;">제목</td>
													<td colspan="2"><input type="text" name='bo_title' class="form-control" placeholder="내용을 입력해주세요" style="vertical-align: middle;"></td>
												</tr>
												<tr>
													<td style="text-align: center">작성자</td>
													<input type="hidden" name='user_idx' value='<%=user_idx %>'/>
													<td><%=user_name %></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="3">
														<textarea id='editor-area' name='bo_content'></textarea>
													</td>
												</tr>
												<tr>
													<td style="text-align: center">첨부파일</td>
													<td><input type="file"></td>
													<td>
														<label class="form-check-label"> 
															<input class="form-check-input" type="checkbox" value="">
															선택파일 삭제
														</label>
													</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="3">
														<div style="float: right;">
															<input type="submit" value="등록" class="btn btn-success">
															<a href='/openboard'><input type="button" value="목록으로" class="btn btn-primary"></a>
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
	<!-- Initialize the editor. -->
	<script>
		$(function() {
			$('#editor-area').froalaEditor({
				// 에디터 세로 길이
				height : 300,
				// 이미지 업로드 경로
				imageUploadURL: '/openboard/uploadfiles',
		        // 이미지 전송 방법
		        imageUploadMethod: 'POST',
			})
		});
	</script>

</body>
</html>