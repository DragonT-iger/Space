<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/Spacetop" charEncoding="utf-8" />
<style>
	#reservation_table{
		width:100%;
		height:300px;
	}
</style>
<div class="container" id="myReservation_wrap">
<!-- 	결제날짜시간
		회원명
		예약자명
		예약시간
		예약인원
		결제금액
		대여공간상호명
		대여공간이름
		대여공간사진
		대여공간주소
		대여공간좌표
		예약수정
		예약취소버튼 -->
	<h1 class="text-center">나의 예약내역</h1>
		<c:if test="${resArr eq null or empty resArr}">
			<table class="table table-border" id="reservation_table_none">
			<tr>
				<td><b>예약 내역이 없습니다.</b></td>
			</tr>
			</table>
		</c:if>
	
		<c:if test="${resArr ne null or not empty resArr}">
		<c:forEach var="resArr" items="${resArr}">
		<table class="table table-border" id="reservation_table" style="border:1px solid #f5f5f5">
		<tr>
			<td>
			<c:if test="${resArr.rtstartdate <= now}">
				<a id="writeR" class="nav-link" href="#ReviewModal" data-toggle="modal" onclick="reviewWrite('${resArr.rtnum}')">리뷰쓰기</a>
			</c:if>
			</td>
			<td style="color:red;">${resArr.rtnum}</td>
			<td colspan="2" style="color:blue;"><fmt:formatDate value="${resArr.rdate}" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></td>
		</tr>
		<tr>
			<td rowspan="5" style="width:100px;">
				<c:if test="${resArr.simage1 eq null}">
					<a href="/space/spaceDetail?snum=${resArr.snum}">
						<img id="reservation_img" src="../img/noSpaceImage.jpg" style="width:300px;height:200px"/>
					</a>
				</c:if>
				<c:if test="${resArr.simage1 ne null}">
					<a href="/space/spaceDetail?snum=${resArr.snum}">
						<img id="reservation_img" src="../resources/SpaceInfoImg/${resArr.simage1}" style="width:300px;height:200px"/>
					</a>
				</c:if>
			</td> <!-- rowspan 1 -->
			<td style="font-weight:bold;">회원</td>
			<td colspan="2">${resArr.userid}</td>
		</tr>
		<tr>
			<!-- rowspan 2 -->
			<td style="font-weight:bold;">예약자정보</td>
			<td>${resArr.mname}</td>
			<td>${resArr.hp}</td>
		</tr>
		<tr>
			<!-- rowspan 3 -->
			<td style="font-weight:bold;">예약시간</td>
			<td colspan="1">${resArr.rtstartdate}</td>
			<td colspan="1">${resArr.rtstart} ~ ${resArr.rtend}</td>
		</tr>
		<tr>
			<!-- rowspan 4 -->
			<td style="font-weight:bold;">예약인원</td>
			<td colspan="2">${resArr.rtnumber}</td>
		</tr>
		<tr>
			<!-- rowspan 5 -->
			<td style="font-weight:bold;">결제금액</td>
			<td colspan="2"><fmt:formatNumber value="${resArr.totalprice}" pattern="###,###"/></td>
		</tr>
		<tr>
			<td colspan="1" style="font-weight:bold;">공간이름</td>
			<td colspan="2">${resArr.sname}</td>
		</tr>
		<tr>
			<td colspan="1" style="font-weight:bold;">대여공간 주소: ${resArr.spost}</td>
			<td colspan="3">${resArr.saddr1} ${resArr.saddr2}</td>
		</tr>
		<tr>
			<c:if test="${resArr.rtstartdate <= now}">
				<td colspan="4">
				<button type="button" id="done" class="btn btn-danger" onclick="done()">이용완료</button>
				</td>
			</c:if>
			
			<c:if test="${resArr.rtstartdate > now}">
				<td colspan="4">
				<%-- <a id="DelR" class="nav-link" href="#DelRModal" data-toggle="modal" onclick="DelReservation('${resArr.rtnum}')">예약취소</a> --%>
				<button type="button" id="cancel" class="btn btn-primary" onclick="DelReservation('${resArr.rtnum}')">예약취소</button>
				</td>
			</c:if>
		</tr>
		</table>
		</c:forEach>
		</c:if>
</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />

<%@include file="/WEB-INF/views/ajax/spaceDetail/ReviewWrite.jsp" %>
<%-- <%@include file="/WEB-INF/views/ajax/Reservation/DelReservation.jsp" %> --%>

<script>
function done(){
	alert('이용이 완료된 예약으로 취소하실 수 없습니다');
};

function reviewWrite(rtnum){
	//alert(rtnum);
	$('#rtnum').val(rtnum);
	
}

function DelReservation(rtnum){
	//alert(rtnum);
	//$('#rtnum').val(rtnum);
	location.href="/space/user/DelReservation?rtnum="+rtnum;
}
	
</script>