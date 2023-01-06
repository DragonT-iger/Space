<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/Spacetop" charEncoding="utf-8" />

<script type="text/javascript" src="js_user/userCheck.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}

body {
	background-image: #34495e;
}

.joinForm {
	position: absolute;
	width: 400px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.joinForm h2 {
	text-align: center;
	margin: 30px;
}

.tf_wrap {
	width: 50%;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.tf-input {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

#sub {
	font-size: 11px;
	text-align: left;
}

.result {
	text-align: left;
}
.dropdown{
	text-align: left;
}
</style>


<div class="container-xxl py-5">
	<div class="container">
		<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
			<h5
				class="section-title ff-secondary text-center text-primary fw-normal">Join
				Us!</h5>
			<h1 class="mb-5">Sign Up</h1>
		</div>
		<form name="mf" action="join" method="post">
			<input type="hidden" name="id_flag" id="id_flag" value="N">

			<div class="row g-4">

				<div class="text-center">
					<div class="row tf_wrap" id="">

						<div class="textForm">
							<input name="mname" type="text" class="name tf-input"
								placeholder="NAME">
							<div id=sub>이름은 한글이름만 가능합니다</div>
						</div>

						<div class="textForm">
							<input name="nickname" type="text" class="nickname tf-input"
								placeholder="NICKNAME">
						</div>
						<div class="textForm">
							<input id="userid" name="userid" type="text" class="id tf-input"
								onkeyup="ajax_idcheck(this.value)" placeholder="ID">
							<div id="id_result" class="result"></div>
							<div id=sub>아이디는 영문자로 시작하고 영문, 숫자_! 포함 4~8자리여야 해요</div>

							<!-- <button type="button" onclick="ajax_idcheck()">아이디 중복 체크</button> -->
						</div>
						<div class="textForm">
							<input name="mpwd1" type="password" class="pw tf-input"
								placeholder="PASSWORD">
							<div id=sub>비밀번호는 영문자,숫자,!,. 로 4~8자리까지 가능해요</div>
						</div>
						<div class="textForm">
							<input name="mpwd" type="password" class="pw tf-input"
								placeholder="PASSWORD CHECK">
						</div>
						<div class="textForm">
							<input name="hp" type="text" class="cellphoneNo tf-input"
								placeholder="TEL">
							<div id=sub>010or011 숫자 7~8자리 ex)01012345678</div>
						</div>
						<div class="textForm">
							<input name="birth" type="text" class="birth tf-input"
								placeholder="BIRTH DATE">
							<div id=sub>생년월일을 8자리로 입력해주세요</div>
						</div>
						
						<div class="textForm">
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">은행</button>
								<input name="account" type="text" class="account tf-input"
								placeholder="ACCOUNT">
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">농협</a> 
									<a class="dropdown-item" href="#">국민</a> 
									<a class="dropdown-item" href="#">신한</a>
								</div>
							</div>
							
							<div id=sub>숫자만 입력해주세요</div>
						</div>
						<div class="textForm">
							<div class="dropdown">
								<button id="member_sel_btn"type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">회원종류?</button>
				  				<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:member_sel('0','일반회원')">일반회원</a> 
									<a class="dropdown-item" href="javascript:member_sel('1','등록회원')">등록회원</a> 
								</div>
								<input type="hidden" id="status" name="status" value=""/>
		  					</div>
		  				</div>
				</div>
				<div class="col-md-6">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<div class="row g-3">
							<div class="col-12">
								<button class="btn btn-primary w-40 py-2" type="button"
									onclick="member_check()">Join</button>
								<button class="btn btn-primary w-40 py-2" type="reset">Reset</button>
								<a href="javascript:histroy.back()"
									class="btn btn-primary w-40 py-2">Cancel</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>
<!--  -->
<script>
	function member_sel(i,text){
		if(i==0||i==1){
			console.log(i);
			$('#status').val(i);
			$('#member_sel_btn').text(text);
		}else{
			alert("잘못된 접근입니다");
			location.reload();
		}
	}
</script>
<!-- Contact End -->
<c:import url="/Spacefoot" charEncoding="utf-8" />