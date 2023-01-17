<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<c:import url="/Spacetop" charEncoding="utf-8"/>


<div class="wrap">
	<div class="ResStatus">
	
	<div class="section_spaceInfo">
		<div class="top_spaceTitle">
			<h1 class="spaceStatus">내가 등록한 공간 예약 현황 관리</h1>
			<h2 class="spaceName">${svo.sname}</h2>
		</div>
	</div>
	
	<hr>
	
	<c:import url="/ReservationStatusAjax"></c:import>
		
	<hr>
	<div class="date_status">
		<div class="time_now">
			<span id="check_year2">${today_info.search_year}</span>년
			<span id="check_month2">${today_info.search_month}</span>월
			<span id="check_date2">${today_info.today}</span>일
			<input id="check_now" type="hidden" value="${now}">
		</div>
	<br>
	<div id="StatusResult">
		<table class="table table-condensed table-striped">
		<thead>
			<tr>
				<th>예약자 성함</th>
				<th>예약자 연락처</th>
				<th>예약시간</th>
				<th>예약인원</th>
				<th>예약금액</th>
			</tr>
		</thead>
		
		<tbody id="StatusBody">
		<c:if test="${rsvo eq null or empty rsvo}">
			<tr>
				<td colspan="5"><b>예약된 내역이 없습니다</b></td>
			</tr>
		</c:if>
		
		<c:if test="${rsvo ne null or not empty rsvo}">
			<c:forEach var="rsvo" items="${rsvo}">
			<tr>
				<td>${rsvo.mname}</td>
				<td>${rsvo.hp}</td>
				<td>${rsvo.rtstart}~${rsvo.rtend}</td>
				<td>${rsvo.rtnumber}</td>
				<td>${rsvo.totalprice}</td>
			</tr>
			</c:forEach>
		</c:if>
		</tbody>
		</table>
	</div>

	
	</div>
	</div>
</div>

<c:import url="/Spacefoot" charEncoding="utf-8"/>
<!-- 플러그인 javascript 로딩 -->
<script src="${pageContext.request.contextPath}/js_Reservation/jquery.timepicker.min.js"></script>
<!-- 플러그인에서 제공해주는 css 로딩 -->
<link rel="stylesheet" href="css_Reservation/jquery.timepicker.min.css"/>
<!-- 달력 css -->
<link rel="stylesheet" href="css_Reservation/res_style.css" />

<script>
const bookingCal=function(yy,mm){
	$.ajax({
		type:'get',
		url:'ReservationAjax?year='+yy+'&month='+mm,
		dataType:'html',
		success:function(res){
			$('#bookingCalendar').html("");
			$('#bookingCalendar').html(res);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}


const aa=function(yy,mm,dd){
	$('#check_month').html("");
	$('#check_month').html(mm);
	$('#check_date').html("");
	$('#check_date').html(dd);
	
	$('#check_year2').html("");
	$('#check_year2').html(yy);
	$('#check_month2').html("");
	$('#check_month2').html(mm);
	$('#check_date2').html("");
	$('#check_date2').html(dd);
	
	//alert(yy);
	//alert(mm);
	//alert(dd);
	
	var cmm='';
	var cdd='';
	
	if(mm<10){
		cmm="0"+mm;
	}else{
		cmm=""+mm;
	}
	if(dd<10){
		cdd="0"+dd;
	}else{
		cdd=""+dd;
	}
	
	var sum=yy+cmm+cdd;
	//alert(sum);
	
	$.ajax({
		type:'post',
		url:'/space/owner/searchReservation',
		contentType:'application/json',
		data: JSON.stringify(sum),
		dataType:'json',
		success : function(res){
			//alert(res);
			if(res==''){
				showReservationListNo(res);
			}else{
				showReservationList(res);
			}
		},
		error: function(err){
			alert("실패!"+err.status)
		}
	});
	
}

const showReservationList = function(res){
	let str='';
	$.each(res,function(i,rl){
	str+=`<tr>
			<td>\${rl.mname}</td>
			<td>\${rl.hp}</td>
			<td>\${rl.rtstart}~\${rl.rtend}</td>
			<td>\${rl.rtnumber}</td>
			<td>\${rl.totalprice}</td>
		</tr>`
	});
	//alert(str)
	$("#StatusBody").html("");
	$("#StatusBody").html(str);
}

const showReservationListNo = function(res){
	let str=`<tr>
			<td colspan="5"><b>예약된 내역이 없습니다</b></td>
		</tr>`;
	//alert(str)
	$("#StatusBody").html("");
	$("#StatusBody").html(str);
}
</script>

