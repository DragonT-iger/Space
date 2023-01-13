<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/Spacetop" charEncoding="utf-8"/>

<div class="wrap">
	<div class="body_one">
		<div>예약한 공간 ${drvo.snum}</div>
		<div>예약 기간</div>
		<div>예약자명</div>
		<div>예약자 전화번호</div>
		<div>예약인원</div>
	</div>
	
	<hr>
	
	<div class="body_two">
		<div>취소 사유 선택</div>
	</div>
	
	<hr>
	
	<div class="body_three">
		<div>취소 상품 금액</div>
		<div>총 할인 금액</div>
		<div>예상 취소 수수료</div>
		<div>환불 포인트</div>
	</div>
	
	<div>
		<button class="btn btn-info">예약취소</button>
		<button type="button" class="btn btn-danger">Close</button>
	</div>

</div>

<c:import url="/Spacefoot" charEncoding="utf-8"/> 