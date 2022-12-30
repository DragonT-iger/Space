<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 플러그인 javascript 로딩 -->
<script src="${pageContext.request.contextPath}/js_Reservation/jquery.timepicker.min.js"></script>
<!-- 플러그인에서 제공해주는 css 로딩 -->
<link rel="stylesheet" href="css_Reservation/jquery.timepicker.min.css"/>
<!-- 예약 js -->
<script src="${pageContext.request.contextPath}/js_Reservation/Reservation_script.js"></script>
<!-- 달력 css -->
<link rel="stylesheet" href="css_Reservation/res_style.css" />
    
<div class="wrap">
	<div class="bookingStep">
	
	<div class="section_spaceInfo">
		<div class="top_spaceTitle">
			<a class="btn_back" onclick="backHome()" title="이전화면이동"><i aria-hidden="true">::before</i></a>
			<h2 class="spaceName"><a href="#" onclick="onSpaceClick()" class="title">${svo.sname}</a></h2>
			<div>${svo.sname}의 /기본인원: ${svo.minn}/ 최대인원: ${svo.maxn}/ 기본비용: ${svo.bcost}/ 인원추가금: ${svo.ecost}</div>
		</div>
		
		<div class="spaceVisual">
			<c:if test="${svo.simage1 ne null}">
				<img src="파일경로/${svo.simage1}" class="img img-fluid">
			</c:if>
			<c:if test="${svo.simage2 ne null}">
				<img src="파일경로/${svo.simage2}" class="img img-fluid">
			</c:if>
			<c:if test="${svo.simage3 ne null}">
				<img src="파일경로/${svo.simage3}" class="img img-fluid">
			</c:if>
			<c:if test="${svo.simage4 ne null}">
				<img src="파일경로/${svo.simage4}" class="img img-fluid">
			</c:if>
		</div>
	</div>
	<hr>
	
	<c:import url="/ReservationAjax"></c:import>
		
	<hr>
	<div class="time_booking">
		<div class="time_now">
			<span id="check_year2">${today_info.search_year}</span>년
			<span id="check_month2">${today_info.search_month}</span>월
			<span id="check_date2">${today_info.today}</span>일
			<span id="check_Time" onfocus="javascript:timeSelect(this);">오전</span>~ (
			<span id="total_time">12</span>시간 )
		</div>
		
		<div class="time_controller_pay">
			<div class="price_time">
				Total: <span id="basic_cost">${svo.bcost}</span>원
			</div>
		</div>
		
		<div class="time_controller slick_slider">
			<div class="time_controller_inner">
				<form name="rf" id="rf" method="post" >
					대여 시작 시간을 선택해주세요 : <input id="startTime" type="text" name="rtstart" autocomplete="off"><br>
					대여 종료 시간을 선택해주세요 : <input id="endTime" type="text" name="rtend" autocomplete="off"><br>
					
					예약하실 인원을 선택해주세요 : 
					<!-- <input type="button" id="btn_minus_count" onclick="javascript:this.form.pmCount.value--" value="-">  -->
					<input id="btn_pm_count" type="number" name="pmCount" value="${svo.minn}" min="1" max="${svo.maxn}">
					<!-- <input type="button" id="btn_plus_count" onclick="javascript:this.form.pmCount.value++" value="+"> -->
					
					<div class="payment">
						<a class="nav-link" href="#paymentModal" data-toggle="modal" onclick="payment()">예약</a>
						<!-- <button class="nav-link" id="paymentModal" data-toggle="modal" data-target="#loginModal">결제</button> -->
					</div>
				</form>
			</div>
		</div>
		
	</div>

	

	</div>
</div>
<%@include file="/WEB-INF/views/ajax/Reservation/ReservationPayment.jsp" %>

<script>
function payment(){
	$('#res_startTime').val(rf.rtstart.value);
	$('#res_endTime').val(rf.rtend.value);
	$('#res_count').val(rf.btn_pm_count.value);
}

/* $(function(){
	 $('#paymentModal').click(function(e){
		 payF.res_startTime.value="333333";
		 //$('#rtdate2').val("3333");
		e.preventDefault();
		$('#paymentModal').modal();
	})
}) */
</script>
