<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <style>
			.review_list{
				width:100%;
				background-color : var(--light);
				border : 1px solid black;
				margin-bottom : 20px;
			}
			.myreview_wrap{
				width:80%;
				margin:auto;
			}
			.review-profile{
				width:100%;
				height:200px;
			}
			.review_img{
				float:left;
				width:200px;
				height:100%;
				margin-right:5%;
			}
			.review_delbtn{
				float:right;
			}
			.review {
				height:20%;
				align-items:center;
			}
			.review-content-wrap, .review-reple-wrap{
				overflow:hidden;
				display: flex;
 				align-items: center;
			}
			.review-user,.review-host {
				float:left;
				height:100%;
				margin-right:5%;
				padding:10px;
				text-align:center;
				width:20%;
			}
			.review-content,.review-reple{
				display:inline-block;
				padding:10px;
				margin-left:5px;
				width:70%;
			}
			
		</style>
		<h1 class="text-center"> 나의 리뷰내역</h1>
        <div class="myreview_wrap mt-5">
        	<!-- 리뷰내역 필요리스트 (로그인한 회원번호로 select) 사진 장소이름 장소주소 별점 리뷰제목 리뷰내용 리뷰 답변 -->
        		<!-- 내가등록한 리뷰들 반복출력 forEach start -->
        		<div class="review_list">
        			<button class="review_delbtn btn btn-danger" onclick="del_review('리뷰번호')">삭제</button>
        			<div class="review-profile">
        				<a href="#"><img class="review_img" src="img/menu-1.jpg"></img></a>
        			
	        			<div class="review review-star">O O O O O (해당공간리뷰개수)</div>
	        			<div class="review review-time">2022-12-18 (글작성시간)</div>
	        			
	
	        			<div class="review space-name">장소이름</div>
	
	        			<div class="review space-addr">장소주소</div>
	
	        			<div class="review review-title">예약날짜</div>
					</div>
        			<div class="review-content-wrap">
	        			<p class="review-user">아이디</p>
	        			<p class="review-content">
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			</p>
        			</div>

        			<div class="review-reple-wrap">
        				<p class="review-host">사장님</p>
	        			<p class="review-reple">
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			</p>
					</div>
        		</div>
        		<!-- foreach End -->
        		<div class="review_list">
        			<button class="review_delbtn btn btn-danger" onclick="del_review('리뷰번호')">삭제</button>
        			<div class="review-profile">
        				<a href="#"><img class="review_img" src="img/menu-1.jpg"></img></a>
        			
	        			<div class="review review-star">별 별 별 별 X (19)</div>
	        			<div class="review review-time">2022-12-20 13:12 (글작성시간)</div>
	        			
	
	        			<div class="review space-name">OOO 파티룸</div>
	
	        			<div class="review space-addr">부산광역시 강서구 녹산산단382로14번가길 10~29번지(송정동)<-제일긴주소</div>
	
	        			<div class="review review-title">2022-12-19 17:00~19:00</div>
					</div>
        			<div class="review-content-wrap">
	        			<p class="review-user">아이디</p>
	        			<p class="review-content">
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			</p>
        			</div>

        			<div class="review-reple-wrap">
        				<p class="review-host">사장님</p>
	        			<p class="review-reple">
	        			사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글
	        			사장님답변글사장님답변글사장님답변글사장님답변글사장님답변글
	        			</p>
					</div>
        		</div>
        		<div class="review_list">
        			<button class="review_delbtn btn btn-danger" onclick="del_review('리뷰번호')">삭제</button>
        			<div class="review-profile">
        				<a href="#"><img class="review_img" src="img/menu-1.jpg"></img></a>
        			
	        			<div class="review review-star">O O O O O (해당공간리뷰개수)</div>
	        			<div class="review review-time">2022-12-18 (글작성시간)</div>
	        			
	
	        			<div class="review space-name">장소이름</div>
	
	        			<div class="review space-addr">장소주소</div>
	
	        			<div class="review review-title">예약날짜</div>
					</div>
        			<div class="review-content-wrap">
	        			<p class="review-user">아이디</p>
	        			<p class="review-content">
	        			리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글리뷰후기글
	        			리뷰후기글리뷰
	        			</p>
        			</div>

<!--         			<div class="review-reple-wrap">
        				<p class="review-host">사장님</p>
	        			<p class="review-reple">
	        			사장님답변글사장님답변글사장님답변글
	        			</p>
					</div> -->
        		</div>
        		<div class="review_list">
        			<button class="review_delbtn btn btn-danger" onclick="del_review('리뷰번호')">삭제</button>
        			<div class="review-profile">
        				<a href="#"><img class="review_img" src="img/menu-1.jpg"></img></a>
        			
	        			<div class="review review-star">O O O O O (해당공간리뷰개수)</div>
	        			<div class="review review-time">2022-12-18 (글작성시간)</div>
	        			
	
	        			<div class="review space-name">장소이름</div>
	
	        			<div class="review space-addr">장소주소</div>
	
	        			<div class="review review-title">예약날짜</div>
					</div>
        			<div class="review-content-wrap">
	        			<p class="review-user">아이디</p>
	        			<p class="review-content">
	        			리뷰후기글리뷰후기
	        			</p>
        			</div>

        			<div class="review-reple-wrap">
        				<p class="review-host">사장님</p>
	        			<p class="review-reple">
	        			사장님답변글
	        			
	        			</p>
					</div>
        		</div>
        </div>    