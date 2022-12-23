<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script>
const cal=function(yy,mm){
	//alert(yy+":"+mm);
	$.ajax({
		type:'get',
		url:'ReservationAjax?year='+yy+'&month='+mm,
		dataType:'html',
		success:function(res){
			$('#calendar').html("");
			$('#calendar').html(res);
		},
		error:function(err){
			alert('err: '+err.status);
		}
	})
}

const aa=function(yy,mm,dd){
	alert(yy+":"+mm+":"+dd)
}

</script>

<div class="wrap">
	<div class="bookingStep">
		<div class="section_spaceInfo">
			<div class="top_spaceTitle">
			<a href="#" class="btn_back" onclick="PrevPageMoveBack()" title="이전화면이동"><i aria-hidden="true">::before</i></a>
			<h2><a>여기에 클릭한 공간 이름</a></h2>
			</div>
		</div>
	
	<div class="bookingCalendar">
		<div class="section_inner">
			<input type="text" placeholder="공간예약가능시작시간">		
			<input type="text" placeholder="공간예약가능종료시간">		
			
			<div class="Title_Calendar">
				<a class="before_year" onclick="cal(${today_info.search_year-1},${today_info.search_month})" title="전년도">&lt;&lt;</a>
				<a class="before_month" onclick="cal(${today_info.search_year},${today_info.search_month-1})" title="이전달">prev</a>
				<span class="this_month">&nbsp; ${today_info.search_year}.
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
				<a class="after_month" onclick="cal(${today_info.search_year},${today_info.search_month+1})" title="다음달">next</a>
				<a class="after_year" onclick="cal(${today_info.search_year+1},${today_info.search_month})" title="명년도">&gt;&gt;</a>
			</div>
			
			<table class="Body_Calendar">
				<thead class="tb_header">
					<tr>
						<th class="calendar_sun">
							<span>SUN</span>
						</th>
						<th>
							<span>MON</span>
						</th>
						<th>
							<span>TUE</span>
						</th>
						<th>
							<span>WED</span>
						</th>
						<th>
							<span>THU</span>
						</th>
						<th>
							<span>FRI</span>
						</th>
						<th class="calendar_sat">
							<span>SAT</span>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<c:forEach var="dList" items="${dateList}" varStatus="date_status">
							<c:choose>
								<c:when test="${dList.value=='today'}">
									<td class="today">
										<div class="date" onclick="aa(${dList.year},${dList.month},${dList.date})">${dList.date}</div>
										<div></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="saturday">
										<div class="sat" onclick="aa(${dList.year},${dList.month},${dList.date})">${dList.date}</div>
										<div></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
									<td class="sunday">
										<div class="sun" onclick="aa(${dList.year},${dList.month},${dList.date})">${dList.date}</div>
										<div></div>
									</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day">
										<div class="date" onclick="aa(${dList.year},${dList.month},${dList.date})">${dList.date}</div>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="time_booking">
		<div class="time_now">여기에 현재 날짜 및 시간 띄우기</div>
		
		<div class="time_controller slick_slider">
			<div class="time_controller_inner">
				예약창 들어가야됨
				<!-- <button class="slick_arrow_prev" type="button" onclick="onSlickPrev()">
					<i class="fn-booking fn-bokking-backward1" aria-hidden="true"></i>
					<span class="blind">prev</span>
				</button> -->
				
				
			</div>
		</div>
	</div>	
	
	
	</div>
</div>

