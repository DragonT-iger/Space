<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
<style>
	.myspace_list{
		width:100%;
		background-color : var(--light);
		border : 1px solid black;
		margin-bottom : 20px;
	}
	.myspacelist-wrap{
		width:80%;
		margin:auto;
	}
	.myspace-profile{
		width:100%;
		height:250px;
	}
	.myspace_img{
		float:left;
		width:40%;
		height:100%;
		margin-right:5%;
	}
	.myspacelist_btn{
		float:right;
	}
	.myspace {
		height:15%;
		align-items:center;
	}
	.myspace-content-wrap{
		overflow:hidden;
		display: flex;
		align-items: center;
	}
	.myspace-tab {
		float:left;
		height:100%;
		margin-right:5%;
		padding:10px;
		text-align:center;
		width:20%;
	}
	.myspace-content{
		display:inline-block;
		padding:10px;
		margin-left:5px;
		width:70%;
	}
	.myspaceInsert_btn{
		float:right;
		margin-right:10%;
	}
</style>
		<h1 class="text-center"> 나의 공간 관리</h1>
		<button class="myspaceInsert_btn btn btn-primary" onclick="javascript:location.href='MySpaceInsert'">공간등록</button>
        <div class="myspacelist-wrap mt-5">
        	<!-- 리뷰내역 필요리스트 (로그인한 회원번호로 select) 사진 장소이름 장소주소 별점 리뷰제목 리뷰내용 리뷰 답변 -->
        		<!-- 내가등록한 리뷰들 반복출력 forEach start -->
        		<div class="myspace_list">
        			<input type="hidden" value='${space_info.snum }'/>
        			<button class="myspacelist_btn btn btn-primary" onclick="update_myspace('${space_info.snum}')">수정</button>
        			<button class="myspacelist_btn btn btn-danger" onclick="del_myspace('${space_info.snum}')">삭제</button>
        			<div class="myspace-profile">
        				<a href="javascript:sel_menu('MyReservationCheck')"><img class="myspace_img" src="img/menu-1.jpg"></img></a>
        			
	        			<div class="myspace myspace-star">O O O O O (평균별점)</div>
	        			<div class="myspace myspace-time">2022-12-24 (등록시간)</div>
	        			
	
	        			<div class="myspace space-name">장소이름</div>
	
	        			<div class="myspace space-addr">장소주소</div>
	
	        			<div class="myspace myspace-cost row">
							<div class="col">
						      	기본비용 : <c:out value="${Space_info.bcost}"/>
						    </div>
						    <div class="col">
								인원추가금: <c:out value="${Space_info.ecost}"/>
						    </div>
	        			</div>
	        			<div class="myspace myspace-numset row">
							<div class="col">
						      	추가금발생인원 수 : <c:out value="${Space_info.minn}"/>
						    </div>
						    <div class="col">
								최대인원 수: <c:out value="${Space_info.maxn}"/>
						    </div>
	        			</div>
					</div>
        			<div class="myspace-content-wrap">
	        			<p class="myspace-tab">공간설명</p>
	        			<p class="myspace-content">
		        			공간설명공간설명공간설명공간설명공간설명공간설명공간설명공간설명<br>
		        			공간설명공간설명공간설명공간설명공간설명공간설명공간설명공간설명<br>
		        			공간설명공간설명공간설명공간설명공간설명공간설명공간설명공간설명<br>
	        			블라블라
	        			</p>
        			</div>
        		</div>
        		<!-- foreach End -->
        </div>
<c:import url="/Spacefoot" charEncoding="utf-8" />