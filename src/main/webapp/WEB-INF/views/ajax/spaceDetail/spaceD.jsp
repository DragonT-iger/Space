<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.wrap {
	padding: 0px 100px 0px 100px;
}

#kakao-link-btn, #love_btn {
	float: right;
	margin: 10px;
	padding: 10px;
}

#goReservation {
	float: left;
	margin: 20px 10px 0px 10px;
}

.nav {
	font-weight: bold;
	display: flex;
	justify-content: center;
}

.information {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width: 100%
}

.list1 {
	display: inline;
	margin: 20px;
}

.spaceUserLogin {
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	text-align: center;
}

.reservation {
	margin: 30px 0px 0px 10px;
}

.inner_space.detail {
	padding: 0px 100px 0px 100px;
}

.share {
	width: 20px;
	height: 20px;
	margin: 0px 0px 30px 0px;
}

.zzim {
	width: 30px;
	height: 30px;
	margin: 0px 0px 40px 0px;
}

.image4{
	width:200px;
	height:200px;
	padding:10px;
	margin:10px;

}
.spaced{


	padding: 0px 200px 0px 200px;

}
</style>
<!-- 지도 관련 -->
<style>
.map_wrap {
	position: relative;
	width: 900px;
	height: 400px;
	margin: auto;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d46c89f3b6dd702f6ea692b4e562a79&libraries=services"></script>

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
			$('#map').css({"background":"url(img/noimage.jpg)"});
			$("#map_tag").hide();
		}
	}
	
	  
	function love_btn(snum,userid){
		if(userid=='' || userid==null || userid=='undefined'){
			alert('로그인 후 이용이 가능합니다');
			return false;
		}
		
		data={
			snum:snum,
			userid:userid
		}
		
		$.ajax({
			type:'get',
			url:'/space/spaceDetail/like',
			data:data,
			cache:false,
			success:function(res){
				if(res>0){
					alert('공간이 찜 되었습니다');	
				}else{
					alert('이미 찜한 공간입니다');				
				}
			},
			error:function(err){
				alert('err: '+err.status); 
				console.log(err);
			}
		});
	};
	
</script>

<c:import url="/Spacetop" charEncoding="utf-8" />


<div class="spaced detail wrap main detail meetspace">
	<div class="inner_space">

		<div class="space_title">
			<c:choose>
				<c:when test="${sdvo.userid eq loginUser.userid}">
					<div class="h_space">
						<br>
						<h1 class="spaceUserLogin">내가 등록한 공간 상세페이지</h1>
						<br> <br>
						<h2 class="space_name">${sdvo.sname}</h2>
					</div>
					<a id="ReservationStatus" class="reservation btn btn-primary"
						href="/space/ReservationStatus?snum=${sdvo.snum}">예약현황</a>
				</c:when>
				<c:otherwise>
					<div class="h_space">
						<br>
						<h2 class="space_name">${sdvo.sname}</h2>
						<br>
						<h6 class="loc_space">${sdvo.saddr1}</h6>

						<%-- <p class="h_code">${sdvo.h_code} (여기에 해시태그명)</p> --%>
					</div>

					<div>

						<a id="love_btn"
							onclick="love_btn(${sdvo.snum},'${loginUser.userid}')"> <img
							class="zzim"
							src="https://e7.pngegg.com/pngimages/22/527/png-clipart-heart-open-free-content-heart-thumbnail.png">
						</a> 
						<a id="kakao-link-btn" href="javascript:sendLink()"> 
						<img class="share" src="https://cdn-icons-png.flaticon.com/512/1250/1250709.png">
						</a> 
						<a id="goReservation" class="btn btn-primary"
							href="/space/Reservation?snum=${sdvo.snum}">예약하기</a>
					</div>

				</c:otherwise>
			</c:choose>
		</div>
		<br> <br> <br>
		<div>
			<c:import url="/spaceDetail/spaceImage" />
		</div>
		<!-- <div class="photo_box_wrap type9">
			<ul class="swiper-wrapper slides">
				<li class="swiper-slide1">이미지1</li>
				<li class="swiper-slide2">이미지2</li>
				<li class="swiper-slide3">이미지3</li>
				<li class="swiper-slide4">이미지4</li>
			</ul>
		</div> -->

		<hr>
		<div class="host_info">
			<div>
				<p class="fa-solid fa-meteor">호스트 정보</p>
				<p>호스트 이름: ${mivo.nickname}</p>
				<p>호스트 연락처: ${mivo.hp}</p>
				<p>${sdvo.snum}번</p>
			</div>
		</div>
		<hr>

	</div>

	<div class="nav">
		<div class="space_info_nav">
			<nav>
				<ul class="information">
					<li class="list1"><a data-scroll="one" href="#one"
						class="dot active"><span>장소 소개</span></a></li>
					<li class="list1"><a data-scroll="two" href="#two" class="dot"><span>이용
								규칙</span></a></li>
					<li class="list1"><a data-scroll="three" href="#three"
						class="dot"><span>리뷰</span></a></li>
					<li class="list1"><a data-scroll="four" href="#four"
						class="dot"><span>질문</span></a></li>
					<!-- <li class="home"><div onclick="scrollTab(0)">장소 소개</div></li>
						<li class="home"><div onclick="scrollTab(1)">이용 규칙</div></li>
						<li class="home"><div onclick="scrollTab(2)">리뷰</div></li>
						<li class="home"><div onclick="scrollTab(3)">질문</div></li> -->
				</ul>
			</nav>
		</div>
	</div>
	<br> <br> <br> <br> <br>
	<section id="one">
		<div id="nav1">
		<br>
			<h4 class="fa-solid fa-meteor">장소 소개</h4>
			<div>${sdvo.scontents}</div>
			<!-- 지도 -->
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<div id="map_tag" class="hAddr">
					<span class="title"> ${sdvo.saddr1 } </span> <span id="centerAddr"></span>
				</div>
			</div>
			<!--  -->
		</div>
	</section>

	<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>

	<section id="two">
		<div id="nav2">
		<br>
			<h4 class="fa-solid fa-meteor" >장소 이용 규칙</h4>
			<br>
			<div>${sdvo.srule}</div>
		</div>
	</section>

	<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>

	<section id="three">
		<div id="nav3">
		<br>
			<c:import  url="/spaceDetail/reviewlist" />
		</div>
		<div id="nav3_re"></div>
	</section>

	<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>

	<section id="four">
		<div id="nav4">
		<br>
			</span><c:import  url="/spaceDetail/qnalist" />
		</div>
		<div id="nav4_re"></div>
	</section>

	<hr>


	<div class="space_host" style="position: relative;">
		<div class="h_row_center">
			<p class="fa-solid fa-meteor">호스트의 다른 장소</p>
			<c:if test="${svoArr eq null or empty svoArr}">
				<div>
					<span><b>이 호스트의 다른 공간은 없습니다.</b></span>
				</div>
			</c:if>

			<c:if test="${svoArr ne null or not empty svoArr}">
				<c:forEach var="otherspace" items="${svoArr}">
					<div class="ospace">
						<div class="box">
							<c:if test="${otherspace.simage1 eq null}">
								<img class="image4"src="./img/noSpaceImage.jpg" />
							</c:if>
							<c:if test="${otherspace.simage1 ne null}">
								<img class="image4" src="./resources/SpaceInfoImg/${otherspace.simage1}" />
							</c:if>
							<a href="/space/spaceDetail?snum=${otherspace.snum}">${otherspace.sname}</a>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>

</div>


<c:import url="/Spacefoot" charEncoding="utf-8" />

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('2046abd15b422dc649ffdf9b8c7adf98');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'SPACE',
        description: '내가 원하던 그 세계속으로 빠져볼까요',
        imageUrl: 'img/space.jpg',
        link: {
          mobileWebUrl: 'http://localhost:9090/space/',
          webUrl: 'http://localhost:9090/space/',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:9090/space/',
            webUrl: 'http://localhost:9090/space/',
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }

</script>