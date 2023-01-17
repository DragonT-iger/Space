<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
<style>


	@font-face{
		font-family: '여행';
		src : url(MapoBackpacking.ttf)
	}

	.myspace_list{
		width:100%;
		background-color : var(--light);
		border : 1px solid black;
		margin-bottom : 20px;
	}
	.myspacelist-wrap{
		width:80%;
		margin:auto;
		font-family: '여행';
	}
	.myspace-profile{
		width:100%;
		height:250px;
		margin: 20px 0px 0px 0px;
		
	}
	.myspace_img{
		float:left;
		width:30%;
		height:100%;
		margin-right:5%;
		padding-right: 20px;
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
	
	.text-center{
	
	padding: 0px 100px 0px 100px;
	
	}
	
	
	
	.myspace_img{
		margin:0px 0px 0px 20px;
	}
	
	
	.class_btn{
		margin: 0px 0px 20px 950px;
	}
	.space1{
		
		
		margin:40px 0px 0px 80px;
	}
</style>

	
	
		<h1></h1>
		<h1 class="text-center"> 나의 공간 관리</h1>
		<button class="myspaceInsert_btn btn btn-primary" onclick="javascript:location.href='MySpaceInsert'">공간등록</button>
		
        <div class="myspacelist-wrap mt-5">
        	<!-- 리뷰내역 필요리스트 (로그인한 회원번호로 select) 사진 장소이름 장소주소 별점 리뷰제목 리뷰내용 리뷰 답변 -->
        		<!-- 내가등록한 리뷰들 반복출력 forEach start -->
			<c:forEach var="spaceinfo" items="${spaceinfo}">
        		<div class="myspace_list">
					
        			
        			<div class="myspace-profile">
        				<a href="../spaceDetail?snum=${spaceinfo.snum}"><img class="myspace_img" src="../resources/SpaceInfoImg/${spaceinfo.simage1}"></img></a>
        			
	        			<div class="myspace myspace-time">${spaceinfo.sdate}(등록시간)</div>
	        			
	
	        			<div class="myspace space-name">대여공간 이름: ${spaceinfo.sname} </div>
	
	        			<div class="myspace space-addr">대여공간 주소: ${spaceinfo.saddr1} &nbsp;${spaceinfo.saddr2} </div>
						<div class="myspace space-addr">우편번호: ${spaceinfo.spost} </div>
	
	        			<div class="myspace myspace-cost row">
							기본비용 : <c:out value="${spaceinfo.bcost}"/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;인원추가금: <c:out value="${spaceinfo.ecost}"/>
						    
	        			</div>
	        			<div class="myspace myspace-numset row">
							
						      	추가금발생인원 수 : <c:out value="${spaceinfo.minn}"/>&emsp;&emsp;&emsp;&emsp;&emsp;최대인원 수: <c:out value="${spaceinfo.maxn}"/>
						   
	        			</div>
					</div>
					<br>
					<br>
        			<div class="myspace-content-wrap">
	        			<p class="myspace-tab">공간설명</p>
	        			<p class="myspace-content">
							${spaceinfo.scontents}
	        			</p>
        			</div>
					<div class="myspace-content-wrap">
	        			<p class="myspace-tab">공간규칙</p>
	        			<p class="myspace-content">
							${spaceinfo.srule}
	        			</p>
        			</div>
        			<div class="space1 myspace myspace-star">O O O O O (평균별점)</div>
        			<button class="class_btn btn btn-primary" onclick="javascript:location.href='MySpaceInsert'">수정</button>
        		</div>
			
		</c:forEach>
        		<!-- foreach End -->
        </div>

	






		  
<c:import url="/Spacefoot" charEncoding="utf-8" />