<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<div class="form-group">
<label for="res_snum">선택하신 대여 공간: </label>
<input type="text" name="res_snum" id="res_snum" readonly class="form-control" value="${svo.sname}">
</div>

<div class="form-group">
<label for="res_user">예약자 성함: </label>
<input type="text" name="res_user" id="res_user" placeholder="${svo.sname}" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_tel">예약자 연락처: </label>
<input type="text" name="res_tel" id="res_tel" placeholder="res_tel" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_date">예약 날짜: </label>
<input type="text" name="res_date" id="res_date" placeholder="res_date" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_Time">예약 시간: </label>
<input type="text" name="res_startTime" id="res_startTime" placeholder="res_startTime" readonly class="form-control">
<input type="text" name="res_endTime" id="res_endTime" placeholder="res_endTime" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_count">예약 인원: </label>
<input type="text" name="res_count" id="res_count" placeholder="res_count" readonly class="form-control">
</div>

<div class="form-group">
<label for="res_payment">예약 금액: </label>
<input type="text" name="res_payment" id="res_payment" placeholder="res_payment" readonly class="form-control">
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