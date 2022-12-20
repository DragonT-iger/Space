<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<table class="table table-border"id="reservation_table">
		<tr>
			<td colspan="4">결제시간</td>
		</tr>
		<tr>
			<td rowspan="5" style="width:100px;"><img id="reservation_img" src="" style="width:300px;height:200px"/></td> <!-- rowspan 1 -->
			<td>회원명</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<!-- rowspan 2 -->
			<td>예약자정보</td>
			<td>예약자명</td>
			<td>전화번호</td>
		</tr>
		<tr>
			<!-- rowspan 3 -->
			<td>예약시간</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<!-- rowspan 4 -->
			<td>예약인원</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<!-- rowspan 5 -->
			<td>결제금액</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>상호명과 공간이름</td>
			<td colspan="2"></td>
			<td colspan="1"></td>
		</tr>
		<tr>
			<td colspan="4">대여공간 주소</td>
		</tr>
		<tr>
			<td colspan="1">우편번호</td>
			<td colspan="3">지번</td>
		</tr>
		<tr>
			<td colspan="4">상세주소</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-primary">예약취소</button>
			</td>
		</tr>
	</table>
</div>