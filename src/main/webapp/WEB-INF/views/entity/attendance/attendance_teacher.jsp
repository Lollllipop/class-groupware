<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>출석관리</title>

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
<link rel="stylesheet" href="${contextPath}/resources/js/Lightweight-Chart/cssCharts.css">
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>
<script>
	var start = "${classList.class_startdate}";
	var end = "${classList.class_enddate}";

	jQuery(function($) {
		//input을 datepicker로 선언
        $("#datepicker").datepicker({
        	dateFormat: 'yy-mm-dd' //Input Display Format 변경
           	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           	,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
           	,changeYear: true //콤보박스에서 년 선택 가능
           	,changeMonth: true //콤보박스에서 월 선택 가능 
           	,showOn:"both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           	,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           	,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
           	,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
           	,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
           	,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
           	,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
           	,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
           	,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
           	,minDate: start
            ,maxDate: end
        	,altField : '#datepicker'
        	,onSelect: function (dateText, inst) {
        		
    			$.ajax({
    				type : 'POST',
    				url : 'attendanceajax',
    				data : {"dateText" : dateText},
    				success : function(datas, textStatus, xhr){
    					console.log(datas);
    					
    					var tree = $("#tree");
    					$('#tree').empty();
    					
    					datas.list.forEach(function(item, index, array){
    						
    							console.log(item);
    							
	    						var attendance = "<tr><th style='text-align: center; vertical-align: middle;'><a href='/attendance/" + item.user_idx + "'>" + item.user_name + "</a></th>"
	    											+ "<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'y' name='"
					    							+ index + "' id='y" + item.user_idx + "'/><label for='y" + item.user_idx + "'>출석</label></td>"
					    							+ "<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'l' name='"
					    							+ index + "' id='l" + item.user_idx + "'/><label for='l" + item.user_idx + "'>지각</label></td>"
					    							+ "<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'e' name='"
					    							+ index + "' id='e" + item.user_idx + "'/><label for='e" + item.user_idx + "'>조퇴</label></td>"
					    							+ "<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'n' name='"
					    							+ index + "' id='n" + item.user_idx + "'/><label for='n" + item.user_idx + "'>결석</label></td></tr>"
	    						
	    						if(item.attendance_event == "y"){
	    							$("input:radio[id='y" + item.user_idx + "']:radio[value='y']").prop("checked",true);
	    						}else if(item.attendance_event == "l"){
	    							$("input:radio[id='l" + item.user_idx + "']:radio[value='l']").prop("checked",true);
	    						}else if(item.attendance_event == "e"){
	    							$("input:radio[id='e" + item.user_idx + "']:radio[value='e']").prop("checked",true);
	    						}else if(item.attendance_event == "n"){
	    							$("input:radio[id='n" + item.user_idx + "']:radio[value='n']").prop("checked",true);
	    						}
	    						
	    						$('#tree').append(attendance);
    					});
    				},
    				error : function(request, status, error){
    					alert("code:" + request.status + "\n" + "error:" + error);
    				}
    			});
            }
         });    

		$('#datepicker').datepicker('setDate', 'today');
				
    });
</script>
<script>
function renameForModelAttribute() {
    $("#attendance").each( function (index) {
        $(this).find("input[name=user_idx]").attr("name", "check[" + index + "].user_idx");
        $(this).find("input[name=user_name]").attr("name", "check[" + index + "].user_name");
        $(this).find("input[name=class_idx]").attr("name", "check[" + index + "].class_idx");
        $(this).find("input[name=attendance_date]").attr("name", "check[" + index + "].attendance_date");
        $(this).find("input[name=${status.index}]").attr("name", "check[" + index + "].attendance_event");
        console.log(zzzz);
    });
}
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/include/nav_top.jsp"%>
		<%@ include file="/WEB-INF/views/include/nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">출석관리</h1>
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-content">
								<form method="post" action="" id="attendance">
									<div class="table-responsive">
										<table class="table table-borderless" style="width: 500px; margin-left: auto; margin-right: auto;">
											<thead>
												<tr>
													<th colspan="5">
														<input type="submit" value="입력" class="btn btn-primary " style="float: right"/>
													</th>
												</tr>
												<tr>
													<th colspan="5">
														<strong><input type="text" id="datepicker" name="attendance_date" style="text-align: center; font-size: 2em;"></strong>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="list" varStatus="status">
													<c:if test="${list.attendance_idx eq '0'}">
														<tr>
															<th style='text-align: center; vertical-align: middle;'>
																<a href='/attendance/${list.user_idx}'>${list.user_name}</a>
																<input type='hidden' name='check[${status.index}].user_idx' value="${list.user_idx}"> 
																<input type="hidden" name='check[${status.index}].class_idx' value="${list.class_idx}">
															</th>
			    											<td style='text-align: center; vertical-align: middle;'>
			    												<input type='radio' value = 'y' name='check[${status.index}].attendance_event' id='y${list.user_idx}' checked/>
			    												<label for='y${list.user_idx}'>출석</label></td>
							    							<td style='text-align: center; vertical-align: middle;'>
							    								<input type='radio' value = 'l' name='check[${status.index}].attendance_event' id='l${list.user_idx}' />
							    								<label for='l${list.user_idx}'>지각</label></td>
							    							<td style='text-align: center; vertical-align: middle;'>
							    								<input type='radio' value = 'e' name='check[${status.index}].attendance_event' id='e${list.user_idx}' />
							    								<label for='e${list.user_idx}'>조퇴</label></td>
							    							<td style='text-align: center; vertical-align: middle;'>
							    								<input type='radio' value = 'n' name='check[${status.index}].attendance_event' id='n${list.user_idx}' />
							    								<label for='n${list.user_idx}'>결석</label></td>
							    						</tr>
						    						</c:if>
												</c:forEach>
											</tbody>
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
	<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	<script
		src="${contextPath}/resources/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="${contextPath}/resources/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${contextPath}/resources/js/custom-scripts.js"></script>

	<!-- Morris Chart Js -->
	<script src="${contextPath}/resources/js/morris/raphael-2.1.0.min.js"></script>
	<script src="${contextPath}/resources/js/morris/morris.js"></script>

	<script src="${contextPath}/resources/js/easypiechart.js"></script>
	<script src="${contextPath}/resources/js/easypiechart-data.js"></script>

	<script src="${contextPath}/resources/js/Lightweight-Chart/jquery.chart.js"></script>
</body>
</html>
