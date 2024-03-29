<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
	<style>
	* {
	  margin: 0px;
	  padding: 0px;
	  text-decoration: none;
	  font-family:sans-serif;
	}
	
	body {
	  background-image:#34495e;
	}
	
	.joinForm {
	  position:absolute;
	  width:400px;
	  height:400px;
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center;
	  top:40%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	}
	
	.joinForm h2 {
	  text-align: center;
	  margin: 30px;
	}
	.tf_wrap{
		width:50%;
	}
	.textForm {
	  border-bottom: 2px solid #adadad;
	  margin: 30px;
	  padding: 10px 10px;
	}
	.tf-input {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	</style>
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Join Us!</h5>
            <h1 class="mb-5">NAVER JOIN</h1>
        </div>
        <div class="row g-4">
          <form id="jfm" name="jfm" action="Join" method="post">
            <div class="text-center">
                <div class="row tf_wrap" id="">
                
               	  <div class="textForm">
			        <input id="mname" name="mname" type="text" class="name tf-input" value="${MemInfo.mname }" placeholder="NAME">
			      </div>
			      <div class="textForm">
			        <input id="nickname" name="nickname" type="text" class="nickname tf-input" placeholder="NICKNAME">
			      </div>
                  	  <div class="textForm">
			        <input id="userid" name="userid" type="text" class="id tf-input" value="${MemInfo.userid }" placeholder="ID">
			      </div>
			      <div class="textForm">
			        <input id="mpwd" name="mpwd" type="password" class="pw tf-input" placeholder="PASSWORD">
			      </div>
			       <div class="textForm">
			        <input id="mpwd2" name="mpwd2" type="password" class="pw tf-input" placeholder="PASSWORD CHECK">
			      </div>
			      <div class="textForm">
			        <input id="hp" name="hp" type="text" class="cellphoneNo tf-input" value="${MemInfo.hp }" placeholder="TEL">
			      </div>
			      <div class="textForm">
			        <input id="birth" name="birth" type="text" class="birth tf-input" value="${MemInfo.birth }" placeholder="BIRTH DATE">
			      </div>
			       <div class="textForm">
			        <select id="status" name="status" class="status tf-input">
			        	<option value="">회원선택</option>
			        	<option value="0">일반유저</option>
			        	<option value="1">등록유저</option>
			        </select>
			      </div>
			      <div class="textForm">
			        <input id="account" name="account" type="number" class="account tf-input" value="" placeholder="Account Info">
			      </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                   <div class="row g-3">
                       <div class="col-12">
                       	   <button class="btn btn-primary w-40 py-2">Join</button>
                           <button class="btn btn-primary w-40 py-2" type="reset">Reset</button>
                           <a href="javascript:sel_menu('Login')" class="btn btn-primary w-40 py-2">Cancel</a>
                       </div>
                   </div>
                </div>
            </div>
          </form>
        </div>
    </div>
</div>
<!-- Contact End -->
<c:import url="/Spacefoot" charEncoding="utf-8" />