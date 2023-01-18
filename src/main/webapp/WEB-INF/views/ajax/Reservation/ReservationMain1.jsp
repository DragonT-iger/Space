<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<c:import url="/Spacetop" charEncoding="utf-8"/>

<%-- <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
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
 --%>

<%-- <%@ include file="/WEB-INF/views/Spacetop.jsp" %> --%>


<div class="wrap">
	<div class="bookingStep">
	
	<div class="section_spaceInfo">
		<div class="top_spaceTitle">
			<a class="btn_back" onclick="backHome()" title="이전화면이동"><i aria-hidden="true">::before</i></a>
			<h2 class="spaceName"><a href="#" onclick="onSpaceClick()" class="title">${svo.sname}</a></h2>
			<div>${svo.sname}의 /기본인원: ${svo.minn}/ 최대인원: ${svo.maxn}/ 기본비용: ${svo.bcost}/ 인원추가금: ${svo.ecost}</div>
		</div>
		
		<div class="spaceVisual">
			<c:import url="/spaceDetail/spaceImage"/>
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
			<input id="check_now" type="hidden" value="${now}">
			<!-- <span id="check_Time">오전</span>~ (
			<span id="total_time">12</span>시간 ) -->
		</div>
		
		<%-- <div class="time_controller_pay">
			<div class="price_time">
				Total: <span id="basic_cost">${svo.bcost}</span>원
			</div>
		</div> --%>
		
		<div class="time_controller slick_slider">
			<div class="time_controller_inner">
				<form name="rf" id="rf" method="post" >
					<input id="check_space" type="hidden" value="${svo.snum}">
					<input id="check_user" type="hidden" value="${loginUser.userid}">
					<input id="check_Bprice" type="hidden" value="${svo.bcost}">
					<input id="check_Eprice" type="hidden" value="${svo.ecost}">
					<input id="check_minn" type="hidden" value="${svo.minn}">
					
					대여 시작 시간을 선택해주세요 : <input id="startTime" type="text" name="rtstart" autocomplete="off"><br>
					대여 종료 시간을 선택해주세요 : <input id="endTime" type="text" name="rtend" autocomplete="off"><br>
					
					예약하실 인원을 선택해주세요 : 
					<!-- <input type="button" id="btn_minus_count" onclick="javascript:this.form.pmCount.value--" value="-">  -->
					<input id="btn_pm_count" type="number" name="pmCount" value="${svo.minn}" min="1" max="${svo.maxn}">
					<!-- <input type="button" id="btn_plus_count" onclick="javascript:this.form.pmCount.value++" value="+"> -->
					
					<div class="payment">
						<!-- <a class="nav-link" href="#paymentModal" data-toggle="modal" onclick="payment()">예약</a> -->
						<button class="nav-link" id="RPModal" data-toggle="modal" data-target="#paymentModal">예약</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>

	

	</div>
</div>

<c:import url="/Spacefoot" charEncoding="utf-8"/>
<!-- 플러그인 javascript 로딩 -->
<script src="${pageContext.request.contextPath}/js_Reservation/jquery.timepicker.min.js"></script>
<!-- 플러그인에서 제공해주는 css 로딩 -->
<link rel="stylesheet" href="css_Reservation/jquery.timepicker.min.css"/>
<!-- 예약 js -->
<script src="${pageContext.request.contextPath}/js_Reservation/Reservation_script.js"></script>
<!-- 달력 css -->
<link rel="stylesheet" href="css_Reservation/res_style.css" />
<!-- modal -->
<%@include file="/WEB-INF/views/ajax/Reservation/ReservationPayment.jsp" %> 

<script>
/* $("#startTime").on("change", function() {
    let pickedTime = $("#startTime").val();
    $("#check_Time").text(
    `You picked this ${pickedTime} Date`);
}); */
/* function payment(){
	const rtyear3=$('#check_year2').html();
	const rtmonth3=$('#check_month2').html();
	const rtdate3=$('#check_date2').html();

	
	let rtdate=rtyear3+"0"+rtmonth3+rtdate3;
	alert(rtdate);
	
	$('#res_date').val(rtdate);
	$('#res_startTime').val(rf.rtstart.value);
	$('#res_endTime').val(rf.rtend.value);
	$('#res_count').val(rf.btn_pm_count.value);
} */

$(function(){
	$('#RPModal').click(function(e){
		e.preventDefault();
		
		const rtspace=$('#check_space').val();
		const rtuser=$('#check_user').val();
		if(rtuser==''){
			alert('로그인 후 이용해주세요');
			return false;
		}
		const rtbcost=$('#check_Bprice').val();
		const rtecost=$('#check_Eprice').val();
		const rtminn=$('#check_minn').val();
		const rtyear3=$('#check_year2').html();
		const rtmonth3=$('#check_month2').html();
		const rtdate3=$('#check_date2').html();

		var rtm;
		var rtd;
		if(rtmonth3<10){
			rtm="0"+rtmonth3;
		}else{
			rtm=rtmonth3;
		}
		if(rtdate3<10){
			rtd="0"+rtdate3;
		}else{
			rtd=rtdate3;
		}
		var sum=rtyear3+rtm+rtd;
		const rtnow=$('#check_now').val();
		if(sum<=rtnow){
			alert('예약할 수 없는 날짜입니다');
			return false;
		}
		
		const rtstarttime=$('#startTime').val();
		if(rtstarttime==''){
			alert('대여 시작시간을 선택해주세요');
			return false;
		}
		const rtendtime=$('#endTime').val();
		if(rtendtime==''){
			alert('대여 종료시간을 선택해주세요');
			return false;
		}
		
		const rs=parseInt(rtstarttime.substring(0,2));
		const re=parseInt(rtendtime.substring(0,2));
		if(rs>=re){
			alert('대여 시간을 다시 확인해주세요');
			return false;
		}
		const rtcount=$('#btn_pm_count').val();
		
		//alert(rtspace+"/"+rtuser+"/"+rtbcost+"/"+rtecost+"/"+rtyear3+"/"
		//	+rtmonth3+"/"+rtdate3+"/"+rtstart+"/"+rtend+"/"+rtcount)
		
		let jsonData={
			"rtspace":rtspace,
			"rtuser":rtuser,
			"rtbcost":rtbcost,
			"rtecost":rtecost,
			"rtminn":rtminn,
			"rtyear":rtyear3,
			"rtmonth":rtmonth3,
			"rtdate":rtdate3,
			"rtstartTime":rtstarttime,
			"rtendTime":rtendtime,
			"rtcount":rtcount
		}
		
		$.ajax({
			type:'post',
			url:'ReservationModal',
			contentType:'application/json',
			data:JSON.stringify(jsonData),
			dataType:'json',
			cache:false,
			success:function(res){
				//alert(JSON.stringify(res));
				if(res.result==0){
					alert('예약할 수 없는 시간입니다');
					$('#paymentModal').modal('hide');
					location.reload();
				}else{
					$('#paymentModal').modal();
					$('#snum').val(res.result.snum);
					$('#userid').val(res.result.userid);
					$('#rtstartdate').val(res.result.rtstartdate);
					$('#totalTime').val(res.result.totalTime);
					$('#rtstart').val(res.result.rtstart);
					$('#rtend').val(res.result.rtend);
					$('#rtnumber').val(res.result.rtnumber);
					$('#totalprice').val(res.result.totalprice);
				}
			},
			error:function(err){
				alert('err: '+err.status);
			}
		}) //ajax
	}) //RPModal
}) //$()
</script>



<%-- <%@ include file="/WEB-INF/views/Spacefoot.jsp" %> --%>