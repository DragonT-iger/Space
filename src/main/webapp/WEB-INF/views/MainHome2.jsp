<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	body {
	margin: 0;
}

ul {
	padding: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #000000;
}

a:visited {
	color: #000000;
}

button, .nav>span {
	outline: none;
	cursor: pointer;
}

img {
	border-radius: 10px;
}

#aside {
	padding: 20px 40px;
	margin: auto auto;
	background: #000000;
	text-align: center;
}

#aside>:link, #aside>:visited {
	color: #DDDDDD;
	text-decoration: underline;
}

.padding80 {
	padding: 0 80px;
}

.padding5080 {
	padding: 50px 80px;
}

.margin50 {
	margin: 50px 0;
}

header {
	height: 83vh;
	background-image:
		url("https://a0.muscache.com/im/pictures/cf39f4c4-e860-43d4-85be-deddd7b2da90.jpg?im_w=1440");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

#logo {
	display: flex;
	height: 80px;
	place-items: center;
}

#logo>:nth-child(1) {
	font-weight: bold;
	font-size: 22px;
}

#logo>div {
	flex: auto;
	width: 37%;
}

#logo>div>a:visited {
	color: #FFFFFF;
}

.flex_center {
	display: inline-flex;
	align-items: center;
}

.nav * {
	color: #FFF;
}

.nav>:hover {
	border-bottom: 1px solid #FFF;
}

.text_center {
	text-align: center;
}

.text_end {
	text-align: end;
}

.text_end a:hover {
	background-color: rgba(121, 163, 185, 0.5);
	border-radius: 20px;
}

.height54 {
	height: 54px;
}

.nav>*, .text_end>* {
	padding: 10px;
}

#nav_button {
	position: relative;
	height: 42px;
	width: 77px;
	border: none;
	border-radius: 110px;
	top: 7px;
}

.search_input {
	display: flex;
	align-items: center;
	text-align: center;
	height: 66px;
	width: 850px;
	margin: auto;
	background-color: #FFFFFF;
	border-radius: 110px;
}

.search_input>div {
	width: 13rem;
	border-right: 1px solid #dadada;
}

.search_input>:nth-child(1) {
	width: 18rem;
}

.search_input>:nth-last-child(2) {
	width: 11rem;
	border: none;
}

.search_input>:nth-last-child(1) {
	width: 65px;
	border: none;
}

.search_input>:nth-last-child(1):hover {
	background: none;
}

.search_input>div div, .search_input>div input {
	width: 70%;
	margin: auto;
	border: none;
	text-align: left;
}

.search_input>div:hover {
	padding: 10px 0;
	background-color: #e7e7e7;
	border-radius: 110px;
	cursor: pointer;
}

.search_input input {
	cursor: default;
	background: transparent;
}

.search_button {
	width: 45px;
	height: 45px;
	border: none;
	border-radius: 50%;
	background-color: #fa215b;
}

.search_button:hover {
	background-color: #DC0E64;
}

#preface {
	display: flex;
	height: 625px;
	flex-direction: column;
	justify-content: center;
}

#preface>span {
	width: 400px;
	color: #FFFFFF;
	font-size: 58px;
	font-weight: bold;
}

#preface>button {
	width: 155px;
	height: 32px;
	margin-top: 15px;
	border-radius: 10px;
	border: none;
}

.items {
	display: flex;
	flex-wrap: wrap;
	margin: 10px 0;
}

.items.third>li {
	margin: 0 0px;
}

.img70 img {
	width: 70px;
}

.cities li {
	display: flex;
}

.cities>a {
	margin-top: 15px;
}

.cities li>span {
	place-self: center;
	margin-left: 20px;
}

.cities li>span>* {
	display: block;
}

.quarter>* {
	width: 25%;
	padding-right: 13px;
	box-sizing: border-box;
}

.third>* {
	width: 33.33%;
	padding-right: 13px;
	box-sizing: border-box;
}

.font32 {
	font-size: 32px;
}

.font18 {
	font-size: 18px;
}

.font16 {
	font-size: 16px;
}

.font14 {
	font-size: 14px;
}

.font12 {
	font-size: 12px;
}

.font_weight600 {
	font-weight: 600;
}

.font_bold {
	font-weight: bold;
}

.font_gray {
	color: rgb(113, 113, 113);
}

.black-background {
	background: black;
	color: white;
}

.black-background * {
	color: white;
}

.white_font {
	color: #FFFFFF;
}

.white_background {
	background: #FFF;
}

.gray-background {
	background: #F7F7F7;
	box-shadow: 0 0 4px 0 #F7F7F7, 4px 0 4px 0 #F7F7F7
}

.gray-border-top {
	border-top: 1px solid #DDDDDD;
}

footer a:hover {
	text-decoration: underline;
}

footer ul>* {
	margin-top: 10px;
}

footer ul>b {
	font-size: 12px;
}

footer ul>li {
	font-size: 14px;
}

.last_footer {
	display: flex;
	margin-bottom: 20px;
}

.last_footer>div {
	width: 25%;
	text-align-last: right;
}

.last_footer>div:nth-child(1) {
	width: 50%;
	text-align-last: left;
}

.tap_ui {
	position: relative;
	float: right;
	top: 16px;
	width: 65%;
	padding: 10px 0;
	background-color: #FFF;
	border-radius: 10px;
	z-index: 1;
}

.tap_ui .tap_ui__anchor {
	display: block;
	padding: 12px 16px;
	text-align: left;
}

.tap_ui .tap_ui__anchor:hover {
	background-color: rgb(236, 236, 236);
	border-radius: 0;
}

.margin8 {
	margin: 8px 0;
}

.dark-gray_background {
	background: #d6d6d6;
}

.height1 {
	height: 1px;
}

.search_button>.magnifying_glass {
	width: 16px;
	transform: translate3d(0, 1px, 0);
}

input[type='radio'] {
	display: none;
}

input[type='radio']:checked+span {
	border-bottom: 1px solid #FFF;
	cursor: default;
}

.width50per {
	width: 50%;
}

.calender_box {
	position: absolute;
	display: flex;
	width: 850px;
	margin: 10px 0 0 -425px;
	left: 50%;
}

.calender_box__inside_box {
	padding: 16px 32px 25px;
	display: grid;
}

.calender_box__table {
	padding: 0 6px;
}

.calender_box__table tr>td {
	height: 45px;
	width: 45px;
}

.calender_box__table tr:nth-child(n+3)>td:not(:empty):hover {
	box-shadow: 0 0 0 1px #000;
	border-radius: 50%;
	cursor: pointer;
}

.calender_box__table__td-clicked {
	background: #222;
	color: #FFF;
	border-radius: 50%;
}

.calender_box__table__past_date {
	color: #b9b9b9;
}

.calender_box__inside_box .calender_box__table .calender_box__table__tr .calender_box__table__past_date:hover
	{
	/* 순서점수 높이려고.. 나열함.. 더 좋은방법은 뭘까요? 
    !important를 사용해야될 시점인가요? 
    scss를 사용하여 태그안에 태그를 연결해서 사용하면 해결될 문제인가요?*/
	box-shadow: 0 0 0 0;
	cursor: default;
}

.calender_box__table tr:nth-child(2)>td {
	height: 17px;
}

.calender_box__table tr:nth-child(-n+2)>td {
	cursor: default;
}

.calender_box__inside_box--month {
	padding: 22px 0 20px;
}

.calender_box--left_button {
	position: absolute;
	display: flex;
	width: 32px;
	height: 32px;
	border: none;
	background: #FFF;
	left: 469px;
	top: 35px;
	place-content: center;
	place-items: center;
}

.calender_box--right_button {
	position: absolute;
	display: flex;
	width: 32px;
	height: 32px;
	border: none;
	background: #FFF;
	right: 44px;
	top: 35px;
	place-content: center;
	place-items: center;
}

.calender_box--left_button:hover, .calender_box--right_button:hover {
	background: #F7F7F7;
	border-radius: 50%;
}

.display_none {
	display: none;
}

.border-radius32 {
	border-radius: 32px;
	
</style>


<body>
	<aside id="aside">
		<a href="#"><span>에어비앤비의 코로나19 대응 방안에 대한 최신 정보를 확인하세요.</span></a>
	</aside>

	<header class="padding80 font_weight600">
		<div id="logo">
			<div>
				<a class="flex_center white_font" href="#"><svg width="30"
						height="32" fill="#FFFFFF">
            <path
							d="M29.24 22.68c-.16-.39-.31-.8-.47-1.15l-.74-1.67-.03-.03c-2.2-4.8-4.55-9.68-7.04-14.48l-.1-.2c-.25-.47-.5-.99-.76-1.47-.32-.57-.63-1.18-1.14-1.76a5.3 5.3 0 00-8.2 0c-.47.58-.82 1.19-1.14 1.76-.25.52-.5 1.03-.76 1.5l-.1.2c-2.45 4.8-4.84 9.68-7.04 14.48l-.06.06c-.22.52-.48 1.06-.73 1.64-.16.35-.32.73-.48 1.15a6.8 6.8 0 007.2 9.23 8.38 8.38 0 003.18-1.1c1.3-.73 2.55-1.79 3.95-3.32 1.4 1.53 2.68 2.59 3.95 3.33A8.38 8.38 0 0022.75 32a6.79 6.79 0 006.75-5.83 5.94 5.94 0 00-.26-3.5zm-14.36 1.66c-1.72-2.2-2.84-4.22-3.22-5.95a5.2 5.2 0 01-.1-1.96c.07-.51.26-.96.52-1.34.6-.87 1.65-1.41 2.8-1.41a3.3 3.3 0 012.8 1.4c.26.4.45.84.51 1.35.1.58.06 1.25-.1 1.96-.38 1.7-1.5 3.74-3.21 5.95zm12.74 1.48a4.76 4.76 0 01-2.9 3.75c-.76.32-1.6.41-2.42.32-.8-.1-1.6-.36-2.42-.84a15.64 15.64 0 01-3.63-3.1c2.1-2.6 3.37-4.97 3.85-7.08.23-1 .26-1.9.16-2.73a5.53 5.53 0 00-.86-2.2 5.36 5.36 0 00-4.49-2.28c-1.85 0-3.5.86-4.5 2.27a5.18 5.18 0 00-.85 2.21c-.13.84-.1 1.77.16 2.73.48 2.11 1.78 4.51 3.85 7.1a14.33 14.33 0 01-3.63 3.12c-.83.48-1.62.73-2.42.83a4.76 4.76 0 01-5.32-4.07c-.1-.8-.03-1.6.29-2.5.1-.32.25-.64.41-1.02.22-.52.48-1.06.73-1.6l.04-.07c2.16-4.77 4.52-9.64 6.97-14.41l.1-.2c.25-.48.5-.99.76-1.47.26-.51.54-1 .9-1.4a3.32 3.32 0 015.09 0c.35.4.64.89.9 1.4.25.48.5 1 .76 1.47l.1.2c2.44 4.77 4.8 9.64 7 14.41l.03.03c.26.52.48 1.1.73 1.6.16.39.32.7.42 1.03.19.9.29 1.7.19 2.5z">
            </path>
          </svg>&nbsp;airbnb</a>
			</div>
			<div class="nav text_center">
				<input type="radio" name="popup_layer" checked="checked"><span
					class="rooms">숙소</span> <input type="radio" name="popup_layer"><span
					class="experience">체험</span> <a href="#"><span>온라인 체험</span></a>
			</div>
			<div class="text_end height54">
				<a href="#"><span>호스트 되기</span></a> <a href="#"><span><svg
							viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="height: 16px; width: 16px; fill: currentcolor; position: relative; top: 2px;">
              <path
								d="m8.002.25a7.77 7.77 0 0 1 7.748 7.776 7.75 7.75 0 0 1 -7.521 7.72l-.246.004a7.75 7.75 0 0 1 -7.73-7.513l-.003-.245a7.75 7.75 0 0 1 7.752-7.742zm1.949 8.5h-3.903c.155 2.897 1.176 5.343 1.886 5.493l.068.007c.68-.002 1.72-2.365 1.932-5.23zm4.255 0h-2.752c-.091 1.96-.53 3.783-1.188 5.076a6.257 6.257 0 0 0 3.905-4.829zm-9.661 0h-2.75a6.257 6.257 0 0 0 3.934 5.075c-.615-1.208-1.036-2.875-1.162-4.686l-.022-.39zm1.188-6.576-.115.046a6.257 6.257 0 0 0 -3.823 5.03h2.75c.085-1.83.471-3.54 1.059-4.81zm2.262-.424c-.702.002-1.784 2.512-1.947 5.5h3.904c-.156-2.903-1.178-5.343-1.892-5.494l-.065-.007zm2.28.432.023.05c.643 1.288 1.069 3.084 1.157 5.018h2.748a6.275 6.275 0 0 0 -3.929-5.068z">
              </path>
            </svg></span></a> <span><button id="nav_button">
						<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible; position: relative; bottom: 4px;">
              <g fill="none" fill-rule="nonzero">
                <path d="m2 16h28"></path>
                <path d="m2 24h28"></path>
                <path d="m2 8h28"></path>
              </g>
            </svg>

						<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="height: 29px; width: 29px; fill: currentcolor; position: relative; left: 6px; top: 2px;">
              <g fill="gray" fill-rule="nonzero">
                <path
								d="m16 .7c-8.437 0-15.3 6.863-15.3 15.3s6.863 15.3 15.3 15.3 15.3-6.863 15.3-15.3-6.863-15.3-15.3-15.3zm0 28c-4.021 0-7.605-1.884-9.933-4.81a12.425 12.425 0 0 1 6.451-4.4 6.507 6.507 0 0 1 -3.018-5.49c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5a6.513 6.513 0 0 1 -3.019 5.491 12.42 12.42 0 0 1 6.452 4.4c-2.328 2.925-5.912 4.809-9.933 4.809z">
                </path>
              </g>
            </svg>
					</button></span>
			</div>
		</div>
		<div class="search_input_box">
			<div class="search_input rooms_box">
				<div>
					<a href="#">
						<div>위치</div> <input type="text" placeholder="어디로 여행가세요?">
					</a>
				</div>
				<div class="search_input__start_date">
					<a href="#">
						<div>체크인</div> <input type="datetime" placeholder="날짜 추가" readonly>
					</a>
				</div>
				<div class="search_input__end_date">
					<a href="#">
						<div>체크아웃</div> <input type="datetime" placeholder="날짜 추가"
						readonly>
					</a>
				</div>
				<div>
					<a href="#">
						<div>인원</div> <input type="number" placeholder="게스트 추가">
					</a>
				</div>
				<div>
					<button class="search_button" style="text-align: center;">
						<img src="./images/magnifyingGlass.svg" class="magnifying_glass">
					</button>
				</div>
			</div>
			<div class="search_input experience_box display_none">
				<div style="width: 52%">
					<a href="#">
						<div style="margin: 0 39px">위치</div> <input type="text"
						placeholder="어디로 여행가세요?" style="width: 80.5%">
					</a>
				</div>
				<div class="search_input__full_date" style="width: 52%">
					<a href="#">
						<div style="margin: 0 39px">날짜</div> <input type="datetime"
						placeholder="원하는 날짜를 입력하세요." style="width: 80.5%" readonly>
					</a>
				</div>
				<div>
					<button class="search_button" style="text-align: center;">
						<img src="./images/magnifyingGlass.svg" class="magnifying_glass">
					</button>
				</div>
			</div>
		</div>
		<div id="preface">
			<span> 이제, 여행은&nbsp; 가까운 곳에서 </span>
			<button class="font_bold">근처의 숙소 둘러보기</button>
		</div>
	</header>

	<section class="padding80 margin50">
		<ul class="items quarter img70 cities">
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/71e23854-a3c7-491c-b715-6e86233a293f.jpg?im_q=medq&im_w=720"
					alt=""> <span><span class="font_bold">서울</span><span>차로
							30분 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/8b318783-723f-4584-9b9b-0eb2c8b6078e.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">인천</span><span>차로
							1시간 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/76e5f1c6-a788-418c-a28b-f0ee29cffd41.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">대구</span><span>차로
							3.5시간 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/ac2086c9-df0d-4085-94c0-94fe3fb94862.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">의정부시</span><span>차로
							30분 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/8340bd19-ee32-4669-8b10-a8ac7e7735d4.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">대전</span><span>차로
							2시간 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/7c424b7e-0f02-4282-93cf-c5fc5e5e157d.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">수원시</span><span>차로
							45분 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/560c06e1-a396-4414-9e38-4fbe8e9f04c4.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">부천시</span><span>차로
							45분 거리</span></span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/847cfb7f-788d-42dc-9148-f375348dde76.jpg?im_q=medq&im_w=240"
					alt=""> <span><span class="font_bold">안산시</span><span>차로
							1시간 거리</span></span></li>
			</a>
		</ul>
	</section>

	<section class="padding80 margin50">
		<div>
			<b class="font32">어디에서나, 여행은 살아보는거야!</b>
		</div>
		<ul class="items quarter">
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/a0316ecb-e49b-4b3a-b6b6-c2876b820e8c.jpg?im_w=480"
					width="100%"><b class="font18">집 전체</b></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/ff69ac49-64e7-4f4a-ae2b-ee01163d0790.jpg?im_w=480"
					width="100%"><b class="font18">통나무집 및 전원주택</b></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/ce6814ba-ed53-4d6e-b8f8-c0bbcf821011.jpg?im_w=480"
					width="100%"><b class="font18">독특한 공간</b></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/34b9d53a-8952-47f8-876d-bb927ea487b2.jpg?im_w=480"
					width="100%"><b class="font18">온수 욕조</b></li>
			</a>
		</ul>
	</section>

	<section class="black-background padding5080">
		<div>
			<b class="font32">세상을 만나는 특별한 방법</b>
			<div class="font14">현지 전문가와 함께하는 독특한 액티비티를 직접 체험하거나 온라인으로
				만나보세요.</div>
		</div>
		<ul class="items third">
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/4d353c80-e73a-4b04-9e15-ec3d8381b106.jpg?im_w=320"
					width="100%"> <b class="font18">온라인 체험</b>
					<div class="font14">집에서 즐기는 랜선 세계 여행</div></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/e81fce5f-2f51-4342-938e-5bc18ae237f4.jpg?im_w=320"
					width="100%"> <b class="font18">체험</b>
					<div class="font14">어디에서든 즐길 수 있는 체험</div></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/b9adfc39-6e2a-4e5f-b6f3-681b306fae5c.jpg?im_w=320"
					width="100%"> <b class="font18">어드벤쳐</b>
					<div class="font14">숙박과 식사가 포함된 며칠 일정의 여행입니다.</div></li>
			</a>
		</ul>
	</section>

	<section class="padding80 margin50">
		<div>
			<b class="font32">수백만 명에 이르는 에어비앤비 호스트 커뮤니티의 일원이 되어보세요.</b>
		</div>
		<ul class="items third">
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/2a16f833-464c-446c-8d74-33eb8c643975.jpg?im_w=320"
					width="100%"> <span class="font_bold">숙소 호스트 되기</span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/426a8116-0b94-4407-ae87-924126c81d78.jpg?im_w=320"
					width="100%"> <span class="font_bold">온라인 체험 호스팅하기</span></li>
			</a>
			<a href="#">
				<li><img
					src="https://a0.muscache.com/im/pictures/a84e92bd-68e6-4ce2-9fdf-b2ce1a377f53.jpg?im_w=320"
					width="100%"> <span class="font_bold">체험 호스팅하기</span></li>
			</a>
		</ul>
	</section>

	<footer class="padding80 gray-background gray-border-top">
		<section>
			<div class="items quarter">
				<ul>
					<span class="font_bold">소개</span>
					<li><a href="#">에어비앤비 이용 방법</a></li>
					<li><a href="#">뉴스룸</a></li>
					<li><a href="#">투자자 정보</a></li>
					<li><a href="#">에어비앤비 플러스</a></li>
					<li><a href="#">에어비앤비 Luxe</a></li>
					<li><a href="#">호텔투나잇</a></li>
					<li><a href="#">에어비앤비 비즈니스 프로그램</a></li>
					<li><a href="#">올림픽</a></li>
					<li><a href="#">채용정보</a></li>
				</ul>
				<ul>
					<span class="font_bold">커뮤니티</span>
					<li><a href="#">다양성 및 소속감</a></li>
					<li><a href="#">접근성</a></li>
					<li><a href="#">에어비앤비 어소시에이트</a></li>
					<li><a href="#">구호 인력을 위한 숙소</a></li>
					<li><a href="#">친구 초대하기</a></li>
					<li><a href="#">Airbnb.org</a></li>
				</ul>
				<ul>
					<span class="font_bold">호스팅하기</span>
					<li><a href="#">숙소 호스팅</a></li>
					<li><a href="#">온라인 체험 호스팅하기</a></li>
					<li><a href="#">체험 호스팅하기</a></li>
					<li><a href="#">책임감 있는 호스팅</a></li>
					<li><a href="#">자료 센터</a></li>
					<li><a href="#">커뮤니티 센터</a></li>
				</ul>
				<ul>
					<span class="font_bold">에어비앤비 지원</span>
					<li><a href="#">에어비앤비의 코로나19 대응 방안</a></li>
					<li><a href="#">도움말 센터</a></li>
					<li><a href="#">예약 취소 옵션</a></li>
					<li><a href="#">에어비앤비 이웃 민원 지원</a></li>
					<li><a href="#">신뢰와 안전</a></li>
				</ul>
			</div>
		</section>

		<hr style="height: 1px; border-width: 0; background-color: #cecece;">
		<section class="last_footer font14">
			<div>
				<div>© 2021 Airbnb, Inc. All rights reserved</div>
				<div>
					<a href="#">개인정보 처리방침</a> · <a href="#">이용약관</a> · <a href="#">사이트맵</a>
					· <a href="#">한국의 변경된 환불 정책</a> · <a href="#">회사 세부정보</a>
				</div>
			</div>
			<div>
				<span> <a href="#"><svg viewBox="0 0 16 16"
							xmlns="http://www.w3.org/2000/svg"
							style="height: 16px; width: 16px; fill: currentColor; position: relative; top: 2px;"
							aria-hidden="true" role="presentation" focusable="false">
              <path
								d="m8.002.25a7.77 7.77 0 0 1 7.748 7.776 7.75 7.75 0 0 1 -7.521 7.72l-.246.004a7.75 7.75 0 0 1 -7.73-7.513l-.003-.245a7.75 7.75 0 0 1 7.752-7.742zm1.949 8.5h-3.903c.155 2.897 1.176 5.343 1.886 5.493l.068.007c.68-.002 1.72-2.365 1.932-5.23zm4.255 0h-2.752c-.091 1.96-.53 3.783-1.188 5.076a6.257 6.257 0 0 0 3.905-4.829zm-9.661 0h-2.75a6.257 6.257 0 0 0 3.934 5.075c-.615-1.208-1.036-2.875-1.162-4.686l-.022-.39zm1.188-6.576-.115.046a6.257 6.257 0 0 0 -3.823 5.03h2.75c.085-1.83.471-3.54 1.059-4.81zm2.262-.424c-.702.002-1.784 2.512-1.947 5.5h3.904c-.156-2.903-1.178-5.343-1.892-5.494l-.065-.007zm2.28.432.023.05c.643 1.288 1.069 3.084 1.157 5.018h2.748a6.275 6.275 0 0 0 -3.929-5.068z">
              </path>
            </svg><span class="font_bold"><u>한국어 (KR)</u></span></a> &nbsp;&nbsp;
					<a href="#"><span class="font_bold">₩ <u>KRW</u></span></a>
				</span>
			</div>
			<div>
				<span> <a href="#"> <img
						src="https://cdn.icon-icons.com/icons2/791/PNG/128/FB_icon-icons.com_65484.png"
						width="16px">
				</a> &nbsp; <a href="#"> <img
						src="https://cdn.icon-icons.com/icons2/512/PNG/512/twitter-3_icon-icons.com_50735.png"
						width="16px">
				</a> &nbsp; <a href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB78iTs9tK4_7FBxExJ1op0lVtJ_-enqdgHhEZbdTUvzw1vGy76dwu9rWbMMAV9Wi3Z-vWy_XRyEz919Mcjzk&usqp=CAU&ec=45774424"
						width="16px">
				</a> &nbsp; <a href="#"> <img
						src="https://image.winudf.com/v2/image1/Y29tLm5obi5hbmRyb2lkLmJsb2dfaWNvbl8xNTk1NDAxNzAzXzA2OA/icon.png?w=&fakeurl=1"
						width="16px">
				</a> &nbsp; <a href="#"><img
						src="https://image.winudf.com/v2/image1/Y29tLm5obi5hbmRyb2lkLnBvc3RfaWNvbl8xNTY3MDAwMDg1XzAxNg/icon.png?w=&fakeurl=1"
						alt="" width="16px"></a>
				</span>
			</div>
		</section>
	</footer>
	<script src="./main_bundle.js"></script>


</body>
</html>