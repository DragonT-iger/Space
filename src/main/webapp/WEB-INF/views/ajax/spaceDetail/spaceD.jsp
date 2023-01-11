<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="myctx" value="${pageContext.request.contextPath }"/> 
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

.slider-2 {
    height:400px;
    position:relative;
}

.slider-2 .slides > div {
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-position:center;
    /* 이미지를 최대한 안짤리게 한다. */
    background-size:cover;
    /* 배경 반복 금지 */
    background-repeat:no-repeat;
    opacity:0;
    transition: opacity 0.5s;
}

.slider-2 .slides > div.active {
    opacity:1;
}

@media ( max-width:700px ) {
    .slider-2 {
        height:300px;
    }
}

.slider-2 .page-nav {
    position:absolute;
    width:100%;
    text-align:center;
    bottom:0;
    left:0;
}

.slider-2 .page-nav > div {
    display:inline-block;
    width:15px;
    height:15px;
    background-color:rgba(255,255,255,0.5);
    border-radius:2px;
    cursor:pointer;
}

.slider-2 .page-nav > div.active {
    background-color:rgba(255,255,255,1);
}

.slider-2>.side-btns>div{
    position:absolute;
    top:0;
    left:0;
    width:30%;
    height:100%;
    cursor:pointer;
    z-index:10;

}
/* 슬라이드 이미지 */
.slider-2>.side-btns>div>span:active{
    transform:translatey(-40%);
}
.slider-2>.side-btns>div:last-child{
    left:auto;
    right:0;
}

.slider-2>.side-btns>div>span{
    position:absolute;
    top:50%;
    transform:translatey(-50%);
    left:inherit;
    right:inherit;
    width:70px;
    height:70px;
    background-color:rgba(255,255,255,0.4);
    border-radius:100%;
    margin:0 10px;
}
.slider-2>.side-btns>div>span > i{
    position:absolute;
    top:50%;
    left:50%;
    font-size:3rem;
    color:rgba(0,0,0,0.4);
    transform:translateX(-70%) translateY(-50%);
}

.slider-2>.side-btns>div:last-child>span > i {
    transform:translateX(-20%) translateY(-50%);
}
/* 슬라이드 버튼 끝 */

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
<!-- 슬라이드 이미지 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<!--  -->
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
					alert('실패');				
				}
			},
			error:function(err){
				alert('err: '+err.status); 
				console.log(err);
			}
		});
	};
	
	$('.slider-2 .page-nav > div').click(function() {
	    
	    var $this = $(this);
	    var $pagenav = $this.parent()
	    var $current = $pagenav.find('.active');
	    
	    $current.removeClass('active');
	    $this.addClass('active');

	    var index = $this.index();
	    var $슬라이더 = $this.closest('.slider-2');
	    
	    $슬라이더.find('.slides > div.active').removeClass('active');
	    $슬라이더.find('.slides > div').eq(index).addClass('active');
	    
	    
	});

	$('.slider-2 > .side-btns > div:first-child').click(function() {
	    var $this = $(this);
	    var $slider = $this.closest('.slider-2');
	    
	    var $current = $slider.find('.page-nav > div.active');
	    var $post = $current.prev();
	    
	    if ( $post.length == 0 ) {
	        $post = $slider.find('.page-nav > div:last-child');
	    }
	    
	    $post.click();
	});

	$('.slider-2 > .side-btns > div:last-child').click(function() {
	    var $this = $(this);
	    var $slider = $this.closest('.slider-2');
	    
	    var $current = $slider.find('.page-nav > div.active');
	    var $post = $current.next();
	    
	    if ( $post.length == 0 ) {
	        $post = $slider.find('.page-nav > div:first-child');
	    }
	    
	    $post.click();
	});
</script>
<!--  -->
<c:import url="/Spacetop"/>


<div class="wrap main detail meetspace">
	<div class="inner_space">
		
		<div class="space_title">
		<div class="h_space">
			<h6 class="loc_space">${sdvo.saddr1}</h6>
			<h2 class="space_name">${sdvo.sname}</h2>
			<p class="h_code">${sdvo.h_code} (여기에 해시태그명)</p>
			
			<a id="goReservation" href="/space/Reservation">예약하기</a>
		</div>
		<a id="kakao-link-btn" href="javascript:sendLink()">공유</a>
		<a id="love_btn" onclick="love_btn(${sdvo.snum},'${loginUser.userid}')">찜</a>
		</div>
	
		<div class="slider-2">
		    <div class="side-btns">
		        <div><span><i class="fas fa-caret-left"></i></span></div>
		        <div><span><i class="fas fa-caret-right"></i></span></div>
		    </div>
		    
		    <div class="slides">
		    	<c:if test="${sdvo.simage1 eq null}">
	    			<div><img src="${myctx }/img/noSpaceImage.jpg"/></div>
	    		</c:if>
	    		<c:if test="${sdvo.simage1 ne null}">
		        <div><img src="${myctx }/resources/SpaceInfoImg/${sdvo.simage1}"></div>
		        <div><img src="${myctx }/resources/SpaceInfoImg/${sdvo.simage2}"></div>
		        <div><img src="${myctx }/resources/SpaceInfoImg/${sdvo.simage3}"></div>
		        <div><img src="${myctx }/resources/SpaceInfoImg/${sdvo.simage4}"></div>
		        </c:if>
		    </div>
		    
		    <div class="page-nav">
		        <div class="active"></div>
		        <div></div>
		        <div></div>
		        <div></div>
		    </div>
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
					<p>호스트 정보</p>
					<p>${mivo.nickname}</p>
					<p>${mivo.hp}</p>
					<p>${sdvo.snum}번</p>
		        </div>
		    </div>
		    <hr>
		    
	</div>
		
		<div class="nav">
		    <div class="space_info_nav">
		        <nav>
					<ul>
						<li><a data-scroll="one" href="#one" class="dot active"><span>장소 소개</span></a></li>
						<li><a data-scroll="two" href="#two" class="dot"><span>이용 규칙</span></a></li>
						<li><a data-scroll="three" href="#three" class="dot"><span>리뷰</span></a></li>
						<li><a data-scroll="four" href="#four" class="dot"><span>질문</span></a></li>
						<!-- <li class="home"><div onclick="scrollTab(0)">장소 소개</div></li>
						<li class="home"><div onclick="scrollTab(1)">이용 규칙</div></li>
						<li class="home"><div onclick="scrollTab(2)">리뷰</div></li>
						<li class="home"><div onclick="scrollTab(3)">질문</div></li> -->
					</ul>
				</nav>
		    </div>
		</div>
		
		<section id="one">
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
		</section>
		
		<section id="two">
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		<div id="nav2">
			<h4>장소 이용 규칙</h4>
			<div>${sdvo.srule}</div>
		</div>
		</section>
		
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		
		<section id="three">
		<div id="nav3">
			<c:import url="/spaceDetail/reviewlist"/>
		</div>
		</section>
		
		<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
		
		<section id="four">
		<div id="nav4">
			<c:import url="/spaceDetail/qnalist"/>
		</div>
		</section>
		
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