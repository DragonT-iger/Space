<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="reserveMember_room_title">예약할 공간 번호 들어갈 자리(히든으로 넘어가야함)</div>

<div class="reserveMember_room_name">회원에게 보여줄 현재 예약할 공간 이름 들어갈 자리</div>


<div class="calendar" id="calendar">
	<div>
		<a class="before_after_year" onclick="cal(${today_info.search_year-1},${today_info.search_month})">
			&lt;&lt;		
		</a>
		<a class="before_after_month" onclick="cal(${today_info.search_year},${today_info.search_month-1})">
			prev		
		</a>
		<span class="this_month">
			&nbsp; ${today_info.search_year}.
			<c:if test="${today_info.search_month<10 }">0</c:if>${today_info.search_month}
		</span>
		<a class="before_after_year" href="Reservation?year=${today_info.after_year}&month=${today_info.after_month}">
			next		
		</a>
		<a class="before_after_year" href="Reservation?year=${today_info.after_year+1}&month=${today_info.after_month-1}">
			&gt;&gt;		
		</a>
	</div>
	<table class="calendar_body">
	<thead>
		<tr>
			<td class="sunday">SUN</td>
			<td class="day">MON</td>
			<td class="day">TUE</td>
			<td class="day">WED</td>
			<td class="day">THU</td>
			<td class="day">FRI</td>
			<td class="saturday">SAT</td>
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
							<div class="sat">${dList.date}</div>
							<div></div>
						</td>
					</c:when>
					<c:when test="${date_status.index%7==0}">
						<td class="sunday">
							<div class="sun">${dList.date}</div>
							<div></div>
						</td>
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date">${dList.date}</div>
						</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
	</tbody>
	</table>
</div>


<div>

	<hr class="gray_line mt-5 mb-5">
</div>

<div style="margin: 0 auto; margin-left: 40px; text-align: left;">
<div>
	<div class="reservationDetail_medium_text mt-3 mb-3">
		<h4><strong>예약</strong></h4>
	</div>
	<table class="table table-borderless reservationDetail_small_text">
		<tr>
			<td>
				<strong>예약날짜</strong>
			</td>
			<td>여기로 달력에서 찍은 날짜 들어가게 할꺼임
			</td>
	</tr>
	<tr>
		<td>
			<strong>대여시간</strong>
		</td>
		<td>체크인-체크아웃 시간
		</td>
	</tr>
	<tr>
		<td>
			<strong>예약자 이름</strong>
		</td>
		<td>이건 회원 db에서 가져와야됨
		</td>
	</tr>
	<tr>
		<td>
			<strong>예약자 연락처</strong>
		</td>
		<td>이것도 회원 db에서 가져와서 띄워줌(변경은 안됨)
		</td>
	</tr>
	<tr>
		<td>
			<strong>예약인원</strong>
		</td>
		<td>이거는 입력받아야됨
		</td>
	</tr>
</table>

<hr class="gray_line mt-5">

<div class="reservationDetail_medium_text mt-5 mb-3">
	<h4><strong>결제 정보</strong></h4>
</div>
<table class="table table-borderless reservationDetail_small_text">
	<tr>
		<td>
			<strong>결제 수단</strong>
		</td>
		<td></td>
	</tr>

	
		</table>
		<div class="mb-5"></div>
	</div>
</div>
