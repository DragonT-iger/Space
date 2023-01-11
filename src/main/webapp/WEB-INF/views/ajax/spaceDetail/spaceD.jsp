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
<!-- 지도 관련 -->
<style>
    .map_wrap {position:relative;width:900px;height:400px; margin:auto;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d46c89f3b6dd702f6ea692b4e562a79&libraries=services"></script>
<script>
	window.onload = function() {
		let lat = "<c:out value='${sdvo.slat}'/>";
		let lon = "<c:out value='${sdvo.slong}'/>";
		if(lat != "" || lon != "" ){
			let slat = lat.substr(0,9);
			let slon = lon.substr(0,10);
			//alert(slat+slon);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(slat,slon), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
			    marker: 
			    	[{
			    	position: new kakao.maps.LatLng(slat, slon), 
			        text: "<c:out value='${sdvo.sname}'/>" // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
		        	}]
		    };  
			var latlng = new kakao.maps.LatLng(slat, slon);
			//alert(latlng);
			var marker = new kakao.maps.Marker();
			marker.setPosition(new kakao.maps.LatLng(latlng));
			// 지도를 생성합니다    
			var map = new kakao.maps.StaticMap(mapContainer, mapOption);
			marker.setMap(map);
			marker.getMap();
		}else{
			$('#map').css({"background":"url(img/nocoord.png)"});
			$("#map_tag").hide();
		}
	}
</script>
<!--  -->
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
			<!-- 지도 -->
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="map_tag" class="hAddr">
			        <span class="title"> ${sdvo.saddr1 } </span>
			        <span id="centerAddr"></span>
			    </div>
			</div>	
			<!--  -->
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