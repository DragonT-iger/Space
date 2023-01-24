<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="css_Reservation/res_style.css" /> -->

<head>
<style>


.Body_Calendar{
margin-left:auto;
margin-right:auto;


}

div.todate{

	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 5px;
	text-align: center;
}



</style>
</head>

<div class="bookingCalendar" id="bookingCalendar">
	<div class="section_inner">
		<div class="time_title">
			<span class="option_label">일정선택::</span> <span id="check_month">${today_info.search_month}</span>월
			<span id="check_date">${today_info.today}</span>일
		</div>

		<div class="Title_Calendar">
			<a class="before_after_calendar"
				onclick="bookingCal(${today_info.search_year-1},${today_info.search_month})"
				title="전년도">&lt;&lt;&nbsp; </a> <a class="before_after_calendar"
				onclick="bookingCal(${today_info.before_year},${today_info.before_month})"
				title="이전달">prev</a> <span class="this_month">
				${today_info.search_year}. <c:if
					test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
			</span> <a class="before_after_calendar"
				onclick="bookingCal(${today_info.after_year},${today_info.after_month+1})"
				title="다음달">&nbsp;next</a> <a class="before_after_calendar"
				onclick="bookingCal(${today_info.search_year+1},${today_info.search_month})"
				title="명년도">&nbsp;&gt;&gt;</a>
		</div>

		<table class="Body_Calendar">
			<thead class="tb_header">
				<tr class="week">
					<th class="calendar_sun"><span>SUN</span></th>
					<th><span>MON</span></th>
					<th><span>TUE</span></th>
					<th><span>WED</span></th>
					<th><span>THU</span></th>
					<th><span>FRI</span></th>
					<th class="calendar_sat"><span>SAT</span></th>
				</tr>
			</thead>

			<tbody>
				<tr>
				<c:forEach var="dList" items="${dateList}" varStatus="date_status"> 
				<c:choose>
					<c:when test="${dList.value=='today'}">
						<c:if test="${date_status.index%7==0}">
							<tr>
						</c:if>
						<td class="today">
							<div class="todate" onclick="aa(${dList.year},${dList.month},${dList.date})">
					</c:when>
					<c:when test="${date_status.index%7==6}">
						<td class="saturday">
							<div class="sat" onclick="aa(${dList.year},${dList.month},${dList.date})">
					</c:when>	
					<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>	
						<td class="sunday">
							<div class="sun" onclick="aa(${dList.year},${dList.month},${dList.date})">
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date" onclick="aa(${dList.year},${dList.month},${dList.date})">
					</c:otherwise>
				</c:choose>
								${dList.date}
								
							<div id="sch_date">
								<c:forEach var="scheduleList" items="${dList.schedule_date_arr}" varStatus="schedule_data_arr_status"> 
								<c:if test="${scheduleList.rtstartdate eq dList.YMD}">
									<p class="date_subject">${scheduleList.rtnumber}명<br>
									${scheduleList.rtstart}~${scheduleList.rtend}
									</p>
								</c:if>
								</c:forEach>
							</div>	
							</div>
						<!-- vo의 특정값을 있다없다 -->	
					</td>
				</c:forEach>			
				</tr>
			</tbody>
		</table>
	</div>
</div>