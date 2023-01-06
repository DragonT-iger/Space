<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
ul {
	text-align: left;
}
.list {
	font-size: 12px;
}
.plaform {
	text-align: center;
}
nav ul {
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
	text-align: center;
	cursor: pointer;
}
/* li 는 블록요소인데 inline-block 으로 인라인속성 부여해서 나란히 배치 */
nav ul li {
	display: inline-block;
	text-align: center;
}
.home {
	background-color: darkorange;
	width: 100px;
	text-align: center;
	font-weight: bold;
	cursor: pointer;
}
.home>a {
	display: block;
	text-decoration: none;
	color: white;
}
.home, .home>a {
	position: relative;
	z-index: 5;
	margin-top: 10%;
}
</style>

<c:import url="/Spacetop"/>


<div class="wrap main detail meetspace">
	<div class="inner_space">
		
		<div class="space_title">
		<div class="h_space">
			<h6 class="loc_space">${sdvo.saddr1} (지역)</h6>
			<h2 class="space_name">${sdvo.sname} (공간이름)</h2>
			<p class="h_code">${sdvo.h_code} (여기에 해시태그명)</p>
			
			<a class="goReservation" href="/space/Reservation">예약하기</a>
		</div>
		<a class="btn_share_detail naver-splugin meet">공유</a>
		<a class="btn_love_detail meet">찜</a>
		</div>
	
		<div class="photo_box_wrap type9">
			<ul class="swiper-wrapper slides">
				<li class="swiper-slide1">이미지1</li>
				<li class="swiper-slide2">이미지2</li>
				<li class="swiper-slide3">이미지3</li>
				<li class="swiper-slide4">이미지4</li>
			</ul>
		</div>
			
			<hr>
			<div class="host_info">
				<div>
					<p>호스트 정보 출력</p>
					<p>스튜디오더와일즈</p>
					<p>장소번호</p>
		        </div>
		    </div>
		    <hr>
		    
	</div>
		
		<div class="nav">
		    <div class="space_info_nav">
		        <nav>
					<ul>
						<li class="home"><div onclick="scrollTab(0)">장소 소개</div></li>
						<li class="home"><div onclick="scrollTab(1)">이용 규칙</div></li>
						<li class="home"><div onclick="scrollTab(2)">리뷰</div></li>
						<li class="home"><div onclick="scrollTab(3)">질문</div></li>
					</ul>
				</nav>
		    </div>
		</div>
		
		<div id="nav1">
			<h4>장소 소개</h4>
			<div>${sdvo.scontents}</div>
		</div>
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		<div id="nav2">
			<h4>장소 이용 규칙</h4>
			<div>${sdvo.srule}</div>
		</div>
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		<div id="nav3">
			<c:import url="/spaceDetail/reviewlist"/>
		</div>
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		<div id="nav4">
			<c:import url="/spaceDetail/qnalist"/>
		</div>
		
		<hr>
		
		
		<div class="space_host" style="position:relative;">
			<div class="h_row_center">
			    <p>호스트의 다른 장소</p>
			    <c:if test="${svoArr eq null or empty svoArr}">
					<div>
						<span><b>이 호스트의 다른 공간은 없습니다.</b></span>
					</div>
				</c:if>
				
				<c:if test="${svoArr ne null or not empty svoArr}">
				<c:forEach var="otherspace" items="${svoArr}">
					<div class="ospace">
						<div class="box">
							<p>${otherspace.sname}</p>
							<strong class="user_name">${otherspace.simage1}</strong>
						</div>
					</div>
				</c:forEach>
				</c:if>
			    
			</div>
		</div>
	
	</div>

            
<c:import url="/Spacefoot"/>

<script>



</script>