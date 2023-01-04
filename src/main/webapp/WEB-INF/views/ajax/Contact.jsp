<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ include file="/WEB-INF/views/Spacetop.jsp" %> --%>
<c:import url="/Spacetop" charEncoding="utf-8"/>
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


.faq {
	background-color: transparent;
	border: 1px solid #9fa4a8;
	border-radius: 10px;
	margin: 30px;
	padding: 30px;
	position: relative;
	overflow: hidden;
	transition: 0.3s ease;
	width:50%;


}

.faq.active {
	background-color: #fff;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
}

.faq.active::before, .faq.active::after {
	content: '\f075';
	font-family: 'Font Awesome 5 Free';
	color: #2ecc71;
	font-size: 7rem;
	position: absolute;
	opacity: 0.2;
	top: 20px;
	left: 20px;
	z-index: 0;
}

.faq.active::before {
	color: #3498db;
	top: -10px;
	left: -30px;
	transform: rotateY(180deg);
}

.faq-title {
	margin: 0 35px 0 0;
}

.faq-text {
	display: none;
	margin: 30px 0 0;
}

.faq.active .faq-text {
	display: block;
}

.faq-toggle {
	background-color: transparent;
	border: 0;
	border-radius: 50%;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	padding: 0;
	position: absolute;
	top: 30px;
	right: 30px;
	height: 30px;
	width: 30px;
}

.faq-toggle:focus {
	outline: 0;
}

.faq-toggle .fa-times {
	display: none;
}

.faq.active .faq-toggle .fa-times {
	color: #fff;
	display: block;
}

.faq.active .faq-toggle .fa-chevron-down {
	display: none;
}

.faq.active .faq-toggle {
	background-color: #9fa4a8;
}
</style>
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=d5kg3rvwc0">
</script>

<main>
	<div class="text-table ">
			<div>
				<center>
					<h4>Information</h4>
				</center>
				<p>
					<br>
				</p>
				<p>
				<center>
					<b>깔끔하고 밝은 느낌으로 추억에 남을 파티 혹은 스튜디오 촬영등 다양한 공간활용등이 가능합니다 
				</center>

				<br> <br>
				<center>
					<img
						src="https://naverbooking-phinf.pstatic.net/20220327_79/1648383331430Px3RO_JPEG/KakaoTalk_20220325_205623101_03.jpg?type=f804_408_60_sharpen"
						class="fr-fin fr-dib">
				</center>

				<nav>
					<ul>

						<li class="home"><a href="#tag1">장소소개</a></li>
						<li class="home"><a href="#tag2">이용규칙</a></li>
						<li class="home"><a href="#tag3">리뷰</a></li>
						<li class="home"><a href="#tag4">질문</a></li>


					</ul>
				</nav>
				<br> <br> <br> <br> <br> <br> <br>

				<div id="tag1">
					<br> <br>
				</div>
				<p>
					<br>
				</p>
				<h4 class="plaform">
					<font color="skyblue">장소 소개</font>
				</h4>
				<br>
				<ul>
					<li class="list">온수역에서 아주아주 가까운 옛날 빌라를 작업실 겸 거주 공간으로 쓰고 있습니다.
						<br> <br> 0. 사전 방문은 시간 협의 후 가능합니다. 대여 불가 시간은 딱히 없지만, 많은
						삶들이 각자의 자리를 살아가고 있는 주거 공간이라서요. 발성이 좋은 배우님과 함께하는 밤 늦은 시각의 촬영 같은 건
						어렵습니다..! <br> <br> 이 공간에서의 첫 촬영은 제가 연출한 웹드라마(아래 콘텐츠 속 이
						장소)였는데요. 베란다가 있고 공간이 생각보단 여유가 있어 조명 치기 나쁘진 않았습니다(다만 가지고 올라오기가 무거울
						뿐...) 그리고 역이 가깝긴 해도 창문 닫으면 외부 사운드도 거의 안 들리는 편이었습니다. <br> <br>
						장소에서 촬영한 부분은 하단 콘텐츠 속 이 장소의 영상 링크 일부 구간에서 확인하실 수 있습니다. (서재와 침실
						공간이고, 모바일/pc에선 뜨지만 아워플레이스 앱에서는 확인이 어려운 것 같아요..!) <br> <br>
						<br> 1. 책과 귀염뽀짝한 친구들이 많습니다. 사진상 보이는 것들(맥북/개인 짐 빼고 자잘한 조명, 소품
						친구들)은 촬영 때 사용하시든 치우시든 상관 없지만, 원복만 잘 해주세요. 책상엔 1인 의자, 2인 쇼파가 있으며
						모니터는 고정이 아니라서 원하시면 미리 치워 드립니다. 사진의 책상은 작업 열심히 하는 사람인 척 굳이 컨셉을 잡아 본
						샷이고, 오시기 전엔 짐은 거의 없을 겁니다. <br> <br> <br> 2. 부분 조명으로
						쓰고 있는 친구들 중 일부는 HUE라이트(총 5구) 입니다. 필요시 쓰셔도 됩니다. 그 외 부분 조명들도 있습니다. <br>
						<br> - 다만 제가 외부 작업을 하는 날과 겹치면 가지고 나갈 수도 있어서, 사진에 있는 소품 아이템의
						일부가 공간에 없을 수도 있습니다. <br> <br> 반드시 필요하시다면 후술되어 있는 장비처럼 미리
						협의해주셔야 합니다. <br> <br> <br> 3. 대여 공간은 사진에 있는 공간(작업실,
						거실), 화장실까지 입니다. 작은 방이 있지만 침실+옷방으로 쓰고 있어 사진은 올리지 않았습니다. 이 공간은 대여
						공간이 아니므로 사용을 원할 시 협의가 필요합니다. <br> <br> <br> 4. 저는
						원래 고양이와 함께 살지만, 촬영 중엔 저와 함께 잠시 사라질 거고, 제가 평소 청소를 열심히 하긴 합니다만(아예
						업체에 맡기고 있습니다) 고양이 알러지에 매우 예민하신 분은 참고 부탁드립니다. (저희 고양이와 제가 집을 비우지
						않아도 되는 짧은 촬영이라면 - 사운드가 안 들어간다거나 - 할인 가능합니다. <br> <br>다만
						알아 두셔야 하는 건, 전 아니지만 저희 고양이가 꽤인싸입니다... 그래도 첨엔 신기해해도 조금 있으면 아마 잘거에요)
						<br> <br> <br>5. 저는 글을 쓰는 사람이기도 하지만 전공도 그렇고... 이런저런
						촬영을 하고 있어, 집에 아래의 장비를 보유하고 있습니다. 오시는 날에 제가 다른 촬영이 없다면 가격 협의 후 대여
						가능하니 참고 부탁드립니다. 뭘 하셔도 좋지만 뿌시지만 마세요..!
				</ul>
				<p>
					<br>
				</p>
				<p>
					<br>
				</p>



				<div id='tag2'>
					<br> <br>
					<div class="line_box holder" style="width: 100%;">
						<hr style="" />
					</div>
					<br>
				</div>
				<h4 class="plaform">
					<font color="skyblue">이용규칙</font>
				</h4>
				<br>
				<ul>
					<li class="list">[시간 엄수] - 계약된 시간을 꼭 준수하여 주시기 바랍니다. <br>
						<br> - 이용요금은 [시작 시간] 및 [종료 시간]으로 계약됩니다. <br> <br> -
						촬영 준비 및 세팅, 장비 철수 및 장소 원상복구 시간은 계약시간에 포함 되어있습니다. <br> <br>
						- 계약된 촬영 시간을 초과할 경우 호스트가 추가결제를 요청할 수 있습니다. <br> <br> [파손
						주의] 삼각대, 조명, 철제박스, 감독 의자, 기타 장비로 인한 나무 바닥과 벽지 파손에 꼭 주의해주세요. <br>
						<br> - 준비물 : 간단한 돗자리나 모포, 테니스공을 준비해서 장비 밑에 꼭 깔아 놓아주세요. <br>
						<br> - 파손 시 : 현장에서 함께 확인 > 사진촬영 > 견적 확인 후, 배상 요청을 진행하게 됩니다. <br>
						<br> [스탭 인원] 설정한 최대 스탭 인원이 지켜지지 않을 경우, 호스트가 촬영을 취소하거나 추가결제를
						요청할 수 있습니다. <br> <br> [취식 금지] 공간에서 취식은 항상 금지되어있습니다. 부득이한
						경우 호스트에게 먼저 양해를 꼭 구해주세요. <br> <br> [에티켓] - 주변 주민들을 위해 기본
						에티켓을 지켜주세요. <br> -주변 야외 촬영은 불가능합니다. <br> - 촬영 도중 발생한
						쓰레기는 모두 정리해주셔야 합니다. <br> - 주차는 안내된 주차대수만 제공됩니다. <br> -
						기존의 가구 세팅 및 구조를 필요에 의해 변경하신 경우 마감 시간 전에 원상복구 해주셔야 합니다.
					</li>
				</ul>



				<div id='tag3'>
					<br> <br>
					<div class="line_box holder" style="width: 100%;">
						<hr style="" />
					</div>
					<br>
				</div>
				<h4 class="plaform">
					<font color="skyblue">리뷰</font>
				</h4>
				<br> <br> <br>


				<div id='tag4'>
					<br> <br>
					<div class="line_box holder" style="width: 100%;">
						<hr style="" />
					</div>
					<br>
				</div>
				<h4 class="plaform">
					<font color="skyblue">질문</font>
				</h4>
				<br> <br> <br> <br>
				<div id='tag4'>
					<br> <br>
					<div class="line_box holder" style="width: 100%;">
						<hr style="" />
					</div>
					<br>
				</div>
				<h4 class="plaform">
					<font color="skyblue">위치</font>
				</h4>
				<br>


				<div id="map" style="width: 50%; height: 500px;"></div>

				<script>
				window.onload = function() {
                    var map = new naver.maps.Map('map', {
                        center: new naver.maps.LatLng(37.5112, 127.0981), // 잠실 롯데월드를 중심으로 하는 지도
                        zoom: 15
                    });
				}
               </script>



				<div id='tag5'>
					<br> <br>
					<div class="line_box holder" style="width: 100%;">
						<hr style="" />
					<br>
					</div>
				</div>
				<h4 class="plaform">
					<font color="skyblue">자주 묻는 질문</font>
				</h4>
				
				<br>
			<fag-container>
			<div class="faq">
				<p class="faq-text">대답 1</p>

				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h6 class="faq-title">자주 묻는 질문 2</h6>

				<p class="faq-text">대답 2</p>

				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h6 class="faq-title">자주 묻는 질문 3</h6>

				<p class="faq-text">대답 3</p>

				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			<div class="faq">
				<h6 class="faq-title">자주 묻는 질문 4</h6>

				<p class="faq-text">대답 4</p>

				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
			</fag-container>


				<script>
                    const toggles = document.querySelectorAll(".faq-toggle");

                    toggles.forEach((toggle) => {
                      toggle.addEventListener("click", () => {
                        toggle.parentNode.classList.toggle("active");
                      });
                    });
                  </script>
            
<c:import url="/Spacefoot" charEncoding="utf-8"/>