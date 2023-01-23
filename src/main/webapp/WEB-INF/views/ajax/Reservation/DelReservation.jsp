<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/Spacetop" charEncoding="utf-8" />

<style>
.header {
	text-align: center;
}

.body {
	text-align: center;
	margin-left: 0px auto;
	margin-right: 0px auto
}

.background {
	background-color: var(- -light);
	overflow: hidden;
	height: 600px;
	width: 800px;
	margin: 20px auto;
}

.table1 {
	width: 700px;
}

.title1 {
	text-align: center;
	margin: 20px 0px;
}

.btn1 {
	text-align: center;
	width: 100%;
}

.reason {
	float: left;
}

tr.body_one {

	border-spacing: 0 10px;
}
</style>

<div id="DelR">
	<form name="DelR" method="post"
		action="${pageContext.request.contextPath}/DelR">
		<input type="hidden" id="rtnum" name="rtnum" value="${drvo.rtnum}"
			class="form-control"> <input type="hidden" id="userid"
			name="userid" value="${loginUser.userid}" class="form-control">
		<input type="hidden" name="to" id="to" class="form-control"
			value="${loginUser.hp}">

		<div class="header">
			<div class="title">
				<h2 class="title1">예약취소 요청</h2>
			</div>
		</div>
		<div class="background">
			<table class="table1">



				<tbody class="body">
					<tr class="body_one">
						<td>예약한 공간</td>
						<td>${sivo.sname}</td>
					</tr>

					<tr class="body_one">
						<td>예약기간</td>
						<td>${drvo.rtstartdate}.${drvo.rtstart} ~ ${drvo.rtend}</td>
					</tr>

					<tr class="body_one">
						<td>예약자명</td>
						<td>${drvo.userid}</td>
					</tr>

					<tr class="body_one">
						<td>예약인원</td>
						<td>${drvo.rtnumber}</td>
					</tr>

					<tr class="body_two">
						<td rowspan="5">취소 사유 선택</td>
						<td><input class="reason" type="radio" name="r_code"
							value="1" id="r1"><label for="1">단순변심</label></td>
					</tr>

					<tr>
						<td><input class="reason" type="radio" name="r_code"
							value="2" id="r2"><label for="2">예약정보
								변경(일정,연락처)/중복예약</label></td>
					</tr>
					<tr>
						<td><input class="reason" type="radio" name="r_code"
							value="3" id="r3"><label for="3">호스트 요청에 따른 이용불가</label></td>
					</tr>
					<tr>
						<td><input class="reason" type="radio" name="r_code"
							value="4" id="r4"><label for="5">이용조건 불만</label></td>
					</tr>
					<tr>
						<td><input class="reason" type="radio" name="r_code"
							value="5" id="r5"><label for="5">기타</label></td>
					</tr>

					<tr>
						<td>피드백</td>
						<td><textarea name="etc" id="etc" class="form-control"
								cols="50" rows="5" placeholder="더 나은 space가 되도록 하겠습니다"></textarea></td>
					</tr>

					<tr class="body_three">
						<td>예약 금액</td>
						<td><fmt:formatNumber value="${drvo.totalprice}"
								pattern="###,###" /></td>
					</tr>

					<tr>
						<td>총 할인 금액</td>
						<td></td>
					</tr>

					<tr>
						<td>예상 취소 수수료</td>
						<td></td>
					</tr>

					<tr>
						<td>환불 포인트</td>
						<td><fmt:formatNumber value="${drvo.totalprice}"
								pattern="###,###" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn1">
			<button class="btn btn-primary btn">예약취소</button>
			<button type="button" class="btn btn-primary btn"
				onclick="history.back()">Back</button>
		</div>
	</form>
</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />