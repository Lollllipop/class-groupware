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
<link href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" rel="stylesheet" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous" />
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
									<div class="ref_file_area">
										<div class="content_title">여기는 제목</div>
										<div class="ref_file_icon">
											<i class="fas fa-file-invoice"></i>
										</div>
									</div>
									<table class="table">
										<thead>
											<tr>
												<td>
													<ul class="list-inline">
														<li>${post.user_name}</li>
														<li>| 작성일 ${post.bo_writedate}</li>
														<li id="updatedate" style="display: none;">| 수정일
															${post.bo_updatedate}</li>
														<div style="float: right;">
															<li><i class="material-icons dp48">chat_bubble</i> <b>${post.bo_views}</b>
															</li>
														</div>
														<div style="float: right;">
															<li><i class="material-icons dp48">visibility</i> <b>${post.bo_comments}</b>
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
													<div class="ref_file_name">
														다운로드 <a href="#">첨부파일이름.txt</a>
													</div>
													<div class="ref_file_icon"></div>
												</td>
											</tr>

											<tr>
												<td>
													<button class="btn">수정</button>
													<button class="btn">삭제</button>
												</td>
											</tr>

											<tr>
												<td><a href="#">↑ 다음글 | 일반글</a></td>
											</tr>
											<tr>
												<td><a href="#">↓ 이전글 | 안녕하세요</a></td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
														<form>
															<textarea class="form-control" rows="5"
																placeholder="로그인 후 댓글 입력이 가능합니다." class="span2"></textarea>
															<td>
																<button class="btn">등록</button>
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


					<div class="col-md-12">
						<div class="card">
							<div class="card-content">
								<div class="box box-solid">
									<div class="box-body">
										<div class="box-group" id="accordion">
											<div class="panel box box-primary">
												<table class="table-responsive">
													<thead>
														<tr>
															<td>
																<ul class="list-inline">
																	<li>댓글 작성자1</li>|
																	<li>작성일 2018.10.29</li>|
																	<li><div class="box-header with-border">
																			<a data-toggle="collapse" data-parent="#accordion"
																				href="#collapseOne"> <i class="fas fa-reply"></i>답글
																				달기
																			</a>
																		</div></li>
																</ul>
															</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>호호'ㅅ'</td>
														</tr>
													</tbody>
												</table>

												<div id="collapseOne" class="panel-collapse collapse in">
													<div class="box-body">
														<div class="reply_write_area">
															<form>
																<div class="reply_write_left">닉네임</div>
																<div class="reply_write_right">
																	<div class="reply_write_text">
																		<textarea class="form-control" rows="5" cols="70"
																			placeholder="답글 달기 누르면 나오는 모양" class="span10"></textarea>
																	</div>
																	<div class="clear"></div>
																	<div class="reply_write_button">
																		<button class="btn" style="float: right">등록</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>

											<div class="panel box box-primary">
												<table class="table-responsive">
													<thead>
														<tr>
															<td>
																<ul class="list-inline">
																	<li>댓글 작성자2</li>|
																	<li>작성일 2018.10.29</li>|
																	<li><div class="box-header with-border">
																			<a data-toggle="collapse" data-parent="#accordion"
																				href="#collapseTwo"> <i class="fas fa-reply"></i>답글
																				달기
																			</a>
																		</div></li>
																</ul>
															</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>기여운 카와이한 고양이 <br> 기여운 카와이한 멍뭉이 <br>
																ㅇㅅㅇ, ㅇㅂㅇ, ㅇㅁㅇ, '^'(~~~~~~!@!@!@!@!@@#@#@#@#@#@#@#@#@# <br>
																ㅁㄴㅇㅁㄴㅇㄴ
															</td>
														</tr>
													</tbody>
												</table>


												<div id="collapseTwo" class="panel-collapse collapse">
													<div class="box-body">
														<div class="reply_write_area">
															<form>
																<div class="reply_write_left">닉네임</div>
																<div class="reply_write_right">
																	<div class="reply_write_text">
																		<textarea class="form-control" rows="5" cols="70"
																			placeholder="답글 달기 누르면 나오는 모양" class="span10"></textarea>
																	</div>
																	<div class="clear"></div>
																	<div class="reply_write_button">
																		<button class="btn" style="float: right">등록</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											<div class="panel box box-primary">
												<table class="table-responsive">
													<thead>
														<tr>
															<td>
																<ul class="list-inline">
																	<li>댓글 작성자3</li>|
																	<li>작성일 2018.10.29</li>|
																	<li><div class="box-header with-border">
																			<a data-toggle="collapse" data-parent="#accordion"
																				href="#collapseThree"> <i class="fas fa-reply"></i>답글
																				달기
																			</a>
																		</div></li>
																</ul>
															</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>너는 모르지? <br> 귀여운 <br> 푸들의 복실복실함 <br></td>
														</tr>
													</tbody>
												</table>

												<div id="collapseThree" class="panel-collapse collapse">
													<div class="box-body">
														<div class="reply_write_area">
															<form>
																<div class="reply_write_left">닉네임</div>
																<div class="reply_write_right">
																	<div class="reply_write_text">
																		<textarea class="form-control" rows="5" cols="70"
																			placeholder="답글 달기 누르면 나오는 모양" class="span10"></textarea>
																	</div>
																	<div class="clear"></div>
																	<div class="reply_write_button">
																		<button class="btn" style="float: right">등록</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="clear"></div>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>
	<script
		src="${contextPath}/resources/open_board/js/open_board_detail.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var isUpdated = $
			{
				post.bo_updatedate
			}

			if (isUpdated) {
				$('#updatedate').css('display', 'inline-block');
			}
		});
	</script>

</body>
</html>
