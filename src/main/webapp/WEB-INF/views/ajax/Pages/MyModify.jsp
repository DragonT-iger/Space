<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/Spacetop" charEncoding="utf-8" />
<style>
#modify_wrap {
	width: 60%;
}

#edit_table>tbody>tr>td:nth-child(1) {
	width: 40%;
	text-align: right;
	padding: 20px;
}

h5 {
	line-height: 3em;
}

#edit_table>tbody>tr>td:nth-child(2) {
	width: 65%;
	padding: 20px;
}

input {
	width: 90% !important;
}

input#hp1, input#hp2, input#hp3 {
	float: left;
	width: 30% !important;
}
.dropdown {
	text-align: left;
}


</style>
<div class="container mt-5 text-center" id="modify_wrap">
	<h2
		class="section-title ff-secondary text-center text-primary fw-normal">Modify</h2>
	<form name="mf" class="mf" action="updateUser" method="POST">
		<!-- 업데이트 idx 값 저장-->
		<table class="table table-borderless mt-5 mb-5" id="edit_table">
			<tr>
				<td><h5>회원아이디</h5></td>
				<td><input type="text"
					class="form-control border-primary py-3 ps-4" id="userid"
					name="userid" value="${loginUser.userid}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td><h5>이름</h5></td>
				<td><input type="text"
					class="form-control border-primary py-3 ps-4" id="mname"
					name="mname" value="${loginUser.mname }" placeholder="수정할 이름">
				</td>
			</tr>
			<tr>
				<td><h5>닉네임</h5></td>
				<td><input type="text"
					class="form-control border-primary py-3 ps-4" id="nickname"
					name="nickname" value="${loginUser.nickname }"
					placeholder="수정할 닉네임"></td>
			</tr>
			<tr>
				<td><h5>현재 비밀번호</h5></td>
				<td><input type="password"
					class="form-control border-primary py-3 ps-4" id="mpwdcheck"
					name="mpwdcheck" value="" placeholder="현재 비밀번호"></td>
			</tr>
			<tr>
				<td><h5>새 비밀번호</h5></td>
				<td><input type="password"
					class="form-control border-primary py-3 ps-4" id="mpwd1"
					name="mpwd1" value="" placeholder="수정할 비밀번호"></td>
			</tr>
			<tr>
				<td><h5>새 비밀번호확인</h5></td>
				<td><input type="password"
					class="form-control border-primary py-3 ps-4" id="mpwd" name="mpwd"
					value="" placeholder="수정할 비밀번호 확인"></td>
			</tr>
			<tr>
				<td><h5>연락처</h5></td>
				<td><input type="text"
					class="form-control border-primary py-3 ps-2" id="hp" name="hp"
					value="${loginUser.hp }" placeholder="ex)010or011 숫자 7~8자리"
					maxlength="11"> <!-- <input type="text" class="form-control border-primary py-3 ps-2" id="hp1" name="hp1" value="" placeholder="ex)010,011..." maxlength="3">
	   			<input type="text" class="form-control border-primary py-3 ps-2" id="hp2" name="hp2" value="" placeholder="3~4자리" maxlength="4">
	   			<input type="text" class="form-control border-primary py-3 ps-2" id="hp3" name="hp3" value="" placeholder="4자리" maxlength="4"> -->
				</td>
			</tr>
			<tr>
			
				<td><h5>계좌정보</h5></td>
				<td>
					<div class="textForm">
					<div class="dropdown">
						<select name="bank_code" id="bankCode">
							<option value="">은행</option>
							<c:forEach var="bank" items="${bankcode}">
						
								<option value="${bank.bank_code}" <c:if test="${bank.bank_code eq loginUser.bank_code}">selected</c:if>  >${bank.bank_name}</option>
							</c:forEach>
						</select>
					</div> 
					</div>
					<br>
					<input type="text" class="form-control border-primary py-3 ps-4"
					id="account" name="account" value="${loginUser.account }"
					placeholder="수정할 계좌번호">
				</td>
			</tr>
			<!-- <tr>
	  			<td>회원상태</td>
	  			<td>
	  				<h3 id="st"></h3>
	  				<select id="status" name="status">
	  					<option value="-2">탈퇴처리</option>
	  					<option value="-1">정지처리</option>
	  					<option value="0">일반회원</option>          					
	  				</select>
	  			</td>
	   		</tr> -->
		</table>

		<div class="modify-btn text-center">
			<button type="button" class="btn btn-primary" onclick="return test()">수정완료</button>
			<button type="button" class="btn btn-danger"
				onclick="sel_menu('MyPage')">취소</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	function test() {
		//alert('test userid: '+mf.userid.value);
		$('.mf').submit();
	}
</script>

<c:import url="/Spacefoot" charEncoding="utf-8" />