<<<<<<< HEAD
<link rel="stylesheet" href="css_Reservation/style.css"/>
<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			    <div class="calendar-container">
			      <div class="calendar"> 
			        <div class="year-header"> 
			          <span class="left-button fa fa-chevron-left" id="prev"> </span> 
			          <span class="year" id="label"></span> 
			          <span class="right-button fa fa-chevron-right" id="next"> </span>
			        </div> 
			        <table class="months-table w-100"> 
			          <tbody>
			            <tr class="months-row">
			              <td class="month">Jan</td> 
			              <td class="month">Feb</td> 
			              <td class="month">Mar</td> 
			              <td class="month">Apr</td> 
			              <td class="month">May</td> 
			              <td class="month">Jun</td> 
			              <td class="month">Jul</td>
			              <td class="month">Aug</td> 
			              <td class="month">Sep</td> 
			              <td class="month">Oct</td>          
			              <td class="month">Nov</td>
			              <td class="month">Dec</td>
			            </tr>
			          </tbody>
			        </table> 
			        
			        <table class="days-table w-100"> 
			          <td class="day">Sun</td> 
			          <td class="day">Mon</td> 
			          <td class="day">Tue</td> 
			          <td class="day">Wed</td> 
			          <td class="day">Thu</td> 
			          <td class="day">Fri</td> 
			          <td class="day">Sat</td>
			        </table> 
			        <div class="frame"> 
			          <table class="dates-table w-100"> 
		              <tbody class="tbody">             
		              </tbody> 
			          </table>
			        </div>
			        <button class="button" id="add-button">Add Event</button>
			      </div>
			    </div>
			    <div class="events-container">
			    </div>

				
			    <div class="dialog" id="dialog">
			        <h2 class="dialog-header"> Add New Event </h2>
			        <form class="form" id="form">
			          <div class="form-container" align="center">
			            <label class="form-label" id="valueFromMyButton" for="name">Event name</label>
			            <input class="input" type="text" id="name" maxlength="36">
			            <label class="form-label" id="valueFromMyButton" for="count">Number of people to invite</label>
			            <input class="input" type="number" id="count" min="0" max="1000000" maxlength="7">
						<input type="button" value="Cancel" class="button" id="cancel-button">
			            <input type="button" value="OK" class="button button-white" id="ok-button">
			          </div>
			        </form>
			      </div>
			  </div>
			</div>
	</div>
</section>
<script src="js_Reservation/jquery.min.js"></script>
<script src="js_Reservation/popper.js"></script>
<script src="js_Reservation/bootstrap.min.js"></script>
<script src="js_Reservation/main.js"></script>
=======
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
>>>>>>> origin/main
