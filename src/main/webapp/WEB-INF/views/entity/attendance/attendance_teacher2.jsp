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
	jQuery(function($) {
		var result = new Array();
		
		<c:forEach items="${list}" var="list">
			var json = new Object();
			json.attendance_idx = "${list.attendance_idx}";
			json.user_idx = "${list.user_idx}";
			json.user_name = "${list.user_name}";
			json.attendance_event = "${list.attendance_event}";
			json.attendance_date = "${list.attendance_date}"
			result.push(json);
		</c:forEach> 
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {dd='0'+dd} 
		if(mm<10) {mm='0'+mm} 

		today = yyyy + '-' + mm + '-' + dd;
		
		
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
           	,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           	,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
        	,onSelect: function (dateText, inst) {
    			// 일자 선택된 후 이벤트 발생
    			var events = [];
    			
    			$("#tree").empty();
				
				for(var i =0; i < result.length; i++) {
					if(dateText == result[i].attendance_date){
						events.push( {"attendance_idx": result[i].attendance_idx, "user_idx": result[i].user_idx , "user_name": result[i].user_name, 
										"attendance_event": result[i].attendance_event, "attendance_date": result[i].attendance_date});
					} else if(dateText == today){
						for(var j=i+1; j<result.length-1;j++){
							if(result[i].user_idx != result[j].user_idx){
								events.push( {"attendance_idx": result[i].attendance_idx, "user_idx": result[i].user_idx , "user_name": result[i].user_name, 
									"attendance_event": "y", "attendance_date": today});
							}
						}
					}
				};
				
				for(var i =0; i < events.length; i++) {
					console.log("events:"+events[i]);
				}; 
				
				var count = Object.keys(events).length;
				console.log(count);
				
				
				var tree = $("#tree");
				var table = $("<table class='table' style='width: 500px; margin-left: auto; margin-right: auto;'>").appendTo(tree);
				
				if(count>0){
					$.each( events, function( index, row) {
								
						var tr = $("<tr>").appendTo(table);
						
						var th = $("<th style='text-align: center; vertical-align: middle;'><a href='/attendance/"+row.user_idx+"'>"+row.user_name+"</a></th>").appendTo(tr);
						
						var td = $("<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'y' name='"+ row.attendance_idx + "' id='y" + row.user_idx + "' /><label for='y" + row.user_idx + "'>출석</label> ").appendTo(tr);
						var td = $("<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'l' name='"+ row.attendance_idx + "' id='l" + row.user_idx + "' /><label for='l" + row.user_idx + "'>지각</label> ").appendTo(tr);
						var td = $("<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'e' name='"+ row.attendance_idx + "' id='e" + row.user_idx + "' /><label for='e" + row.user_idx + "'>조퇴</label> ").appendTo(tr);
						var td = $("<td style='text-align: center; vertical-align: middle;'><input type='radio' value = 'n' name='"+ row.attendance_idx + "' id='n" + row.user_idx + "' /><label for='n" + row.user_idx + "'>결석</label> ").appendTo(tr);
						
						if(row.attendance_event=='y'){
							$("input:radio[id=y" + row.user_idx + "]").prop('checked',true);
						}else if(row.attendance_event=='l'){
							$("input:radio[id='l" + row.user_idx + "']").prop('checked',true);
						}else if(row.attendance_event=='e'){
							$("input:radio[id='e" + row.user_idx + "']").prop('checked',true);
						}else if(row.attendance_event=='n'){
							$("input:radio[id='n" + row.user_idx + "']").prop('checked',true);
						}
						
					});
				}
            }
         });    

		$('#datepicker').datepicker('setDate', 'today');
    });
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
								<form method="post" action="#" name="attendance">
									<span style="float: right"> <input type="submit" value="입력" class="btn btn-primary " />
									</span> <br> <br>
									<div class="table-responsive">
										<table class="table" style="width: 500px; margin-left: auto; margin-right: auto;">
											<tbody>
											<tr>
												<th><b>
													<input type="text" id="datepicker" style="text-align: center; font-size: 2em;">
												</b></th>
											</tr>
											</tbody>
										</table>
									</div>
									<div id="tree" class="table-responsive">
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
