<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#mypage_wrap{
		width:50%;
	}
	#mypage_table>tr>td{
		padding:10px;
	}
	tr>td:nth-child(1){
		width:40%;
		text-align:right;
	}
</style>
<div class="container text-center" id="mypage_wrap">
	<h2 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h2>
	<table class="table table-borderless mt-5 mb-5" id="mypage_table">
		<tr>
			<td><h5>이름</h5></td>
			<td><b>홍길동</b></td>
			<%-- ${loginUser.uname} --%>
		</tr>
		<tr>
			<td><h5>아이디</h5></td>
			<td><b>hong</b></td>
			<%-- ${loginUser.userid} --%>
		</tr>
		<tr>
			<td><h5>연락처</h5></td>
			<td><b>010-0000-0000</b></td>
			<%-- ${loginUser.hp} --%>
		</tr>
		<tr>
			<td><h5>나의 회원상태</h5></td>
			<td><b>일반회원</b></td>
			<%-- ${loginUser.status} --%>
		</tr>
		<tr>
			<td><h5>가입일</h5></td>
			<td><b>2022-12-19</b></td>
			<%-- ${loginUser.wdate} --%>
		</tr>
		<tr>
			<td><h5>나의 마일리지</h5></td>
			<td><b>1000</b></td>
			<%-- ${loginUser.mileage} --%>
		</tr>
	</table>
		<div class="text-center">
			<button type="button" class="btn btn-primary py-2" onclick="javascript:sel_menu('MyModify')">회원수정</button>
			<button type="button" class="btn btn-danger py-2" data-bs-toggle="modal" data-bs-target="#exampleModal">회원탈퇴</button>
			<button type="button" class="btn btn-primary py-2" onclick="javascript:sel_menu('Home')">돌아가기</button>
		</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">정말 탈퇴 하시겠습니까?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<h3 class="text-center">::비밀번호 입력 후 탈퇴처리::</h3>
        <input type="password" class="form-control border-primary py-3 ps-4" id="pwdCheck" name="pwdCheck" placeholder="비밀번호확인"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger">탈퇴</button>
      </div>
    </div>
  </div>
</div>