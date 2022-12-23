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


<div class="calendar" id="calendar">
	<div>
		<a class="before_after_year" onclick="cal(${today_info.search_year-1},${today_info.search_month})" >
			&lt;&lt;		
		</a>
		<!-- Reservation?year=${today_info.before_year}&month=${today_info.before_month}" -->
		<a class="before_after_month" onclick="cal(${today_info.search_year},${today_info.search_month-1})" >
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