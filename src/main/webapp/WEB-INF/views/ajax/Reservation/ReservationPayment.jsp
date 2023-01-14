<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <style>
.modal{
	position:relative;
	z-index:5;
}

</style>
 -->

<!-- The Modal -->
<div class="modal" id="paymentModal">
<div class="modal-dialog">
<div class="modal-content">

<form name="payF" method="post" action="${pageContext.request.contextPath}/ReservationPayment">


<!-- Modal Header --> 
<div class="modal-header">
<h4 class="modal-title">Reservation</h4>
<button type="button" class="close" data-dismiss="modal">×</button>
</div>

​

<!-- Modal body -->

<div class="modal-body">
<div id="userpoint_add">
	${loginUser.mname}님의 잔여 포인트: <fmt:formatNumber value="${loginUser.point}" pattern="###,###,###"/>
</div>
<a id="pointAddGo" href="user/pointAdd">포인트 충전</a>
<hr>

<div class="form-group">
<label for="res_snum">선택하신 대여 공간: </label>
<input type="hidden" name="snum" id="snum" readonly class="form-control">
<input type="text" name="res_snum" id="res_snum" readonly class="form-control" value="${svo.sname}">
</div>

<div class="form-group">
<label for="res_user">예약자 성함: </label>
<input type="hidden" name="userid" id="userid" readonly class="form-control">
<input type="text" name="res_user" id="res_user" readonly class="form-control" value="${loginUser.mname}" >
</div>

<div class="form-group">
<label for="res_tel">예약자 연락처: </label>
<input type="text" name="to" id="to" readonly class="form-control"  value="${loginUser.hp}">
</div>

<div class="form-group">
<label for="res_date">예약 날짜: </label>
<input type="text" name="rtstartdate" id="rtstartdate" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_Time">예약 시간: </label>
<input type="text" name="res_totalTime" id="totalTime" readonly class="form-control">
<input type="text" name="rtstart" id="rtstart" readonly class="form-control">
<input type="text" name="rtend" id="rtend" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_count">예약 인원: </label>
<input type="text" name="rtnumber" id="rtnumber" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_payment">예약 금액: </label>
<input type="text" name="totalprice" id="totalprice" readonly class="form-control">
</div>
</div>

​

<!-- Modal footer -->

<div class="modal-footer">

<button class="btn btn-info">결제</button>

<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

</div>

</form>

</div>

</div>

</div>