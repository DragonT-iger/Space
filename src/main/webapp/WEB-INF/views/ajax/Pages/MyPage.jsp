<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
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
			<td><b>${loginUser.mname }</b></td>
			<%-- ${loginUser.uname} --%>
		</tr>
		<tr>
			<td><h5>닉네임</h5></td>
			<td><b>${loginUser.nickname }</b></td>
			<%-- ${loginUser.userid} --%>
		</tr>
		<tr>
			<td><h5>연락처</h5></td>
			<td><b>${loginUser.hp }</b></td>
			<%-- ${loginUser.hp} --%>
		</tr>
		<tr>
			<td><h5>나의 회원상태</h5></td>
			<td><b><c:out value="${loginUser.statusStr}"/></b></td>
			<%-- ${loginUser.status} --%>
		</tr>
		<tr>
			<td><h5>가입일</h5></td>
			<td><b><fmt:formatDate value="${loginUser.mdate}" pattern="yyyy-MM-dd" /></b></td>
			
			<%-- ${loginUser.wdate} --%>
		</tr>
		<tr>
			<td><h5>나의 마일리지</h5></td>
			<td><b>${loginUser.point }</b></td>
			<%-- ${loginUser.mileage} --%>
		</tr>
		<tr>
			<td><h5>계좌정보</h5></td>
			<td><b>${loginUser.account }</b></td>
			<%-- ${loginUser.account} --%>
		</tr>
	</table>
		<div class="text-center">
			<button type="button" class="btn btn-primary py-2" onclick="javascript:location.href='MyModify'">회원수정</button>
			<button type="button" class="btn btn-danger py-2" data-bs-toggle="modal" data-bs-target="#exampleModal">회원탈퇴</button>
			<button type="button" class="btn btn-primary py-2" onclick="javascript:histroy.back()">돌아가기</button>
		</div>
</div>
<form class="frm1" action="/deleteUser" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">정말 탈퇴 하시겠습니까?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<h3 class="text-center">::비밀번호 입력 후 탈퇴처리::</h3>
        <input type="password" class="form-control border-primary py-3 ps-4" id="mpwd" name="mpwd" placeholder="비밀번호확인"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <c:if test="${snsLoginState eq true}">
        <button type="button" onClick="javascript:location.href='NaverDelete?code=${oauth_code }&state=${oauth_state}'" class="btn btn-danger">네이버 탈퇴</button>
        </c:if>
        <c:if test="${snsLoginState ne true}">
        <button type="button" class="btn btn-danger" onclick="return test()">탈퇴</button>
      	</c:if>
      </div>
    </div>
  </div>
</div>
</form>
<script type="text/javascript">
	function test(){
		//alert('test');
		$('.frm1').submit();
	}
	
</script>
<c:import url="/Spacefoot" charEncoding="utf-8" />