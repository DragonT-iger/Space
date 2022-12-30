<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	<style>
        		*{
        			list-style:none;
        		}
        		.myzzim-wrap{
        			width:90%;
        			margin:auto;
        		}
        		.myzzim-item{
        			background-color : var(--light);
        			overflow:hidden;
        			height:150px;
        			margin : 10px 0;
        		}
        		.myzzim-img{
        			width:20%;
        			height:100%
        		}
        		.myzzim-col{
        			padding:10px;
        			float:left;
        			height:100%;
        			width:25%;
        			display: flex;
		            flex-direction: column;
		            justify-content: center;
  					align-items: center;
        		}
        		.myzzim-img>a{
        			width:70%;
        			height:100%;
        		}
        		.space-info-img {
        			width:100%;
        			height:100%;
        		}
        	</style>
            <!-- set defalut Ajax   -->
            <h1 class="text-center">나의 찜목록</h1>
			<div class="myzzim-wrap mt-5">
				<div class="myzzim-list">
					<!-- 반복문 start-->
					<div class="myzzim-item">
						<input type="hidden" value="장소번호"/>
						<div class="myzzim-col myzzim-img"><a href="#"><img class="space-info-img" src="img/menu-1.jpg"/></a></div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>장소명</a></li>
							<li>★★★★★(8 ->후기개수)</li>
							<li>찜개수</li>
						</ul>
						<ul class="myzzim-col">
							<li>찜한날짜</li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="#">예약하기</a><li>
							<li><a href="#">찜 취소</a><li>
						</ul>
					</div>
					<!-- 반복문 end -->
					<div class="myzzim-item">
						<input type="hidden" value="장소번호"/>
						<div class="myzzim-col myzzim-img"><a href="#"><img class="space-info-img" src="img/menu-1.jpg"/></a></div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>장소명</a></li>
							<li>★★★★★(8 ->후기개수)</li>
							<li>찜개수</li>
						</ul>
						<ul class="myzzim-col">
							<li>찜한날짜</li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="#">예약하기</a><li>
							<li><a href="#">찜 취소</a><li>
						</ul>
					</div>
					<div class="myzzim-item">
						<input type="hidden" value="장소번호"/>
						<div class="myzzim-col myzzim-img"><a href="#"><img class="space-info-img" src="img/menu-1.jpg"/></a></div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>장소명</a></li>
							<li>★★★★★(8 ->후기개수)</li>
							<li>찜개수</li>
						</ul>
						<ul class="myzzim-col">
							<li>찜한날짜</li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="#">예약하기</a><li>
							<li><a href="#">찜 취소</a><li>
						</ul>
					</div>
					<div class="myzzim-item">
						<input type="hidden" value="장소번호"/>
						<div class="myzzim-col myzzim-img"><a href="#"><img class="space-info-img" src="img/menu-1.jpg"/></a></div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>장소명</a></li>
							<li>★★★★★(8 ->후기개수)</li>
							<li>찜개수</li>
						</ul>
						<ul class="myzzim-col">
							<li>찜한날짜</li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="#">예약하기</a><li>
							<li><a href="#">찜 취소</a><li>
						</ul>
					</div>
					<div class="myzzim-item">
						<input type="hidden" value="장소번호"/>
						<div class="myzzim-col myzzim-img"><a href="#"><img class="space-info-img" src="img/menu-1.jpg"/></a></div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>장소명</a></li>
							<li>★★★★★(8 ->후기개수)</li>
							<li>찜개수</li>
						</ul>
						<ul class="myzzim-col">
							<li>찜한날짜</li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="#">예약하기</a><li>
							<li><a href="#">찜 취소</a><li>
						</ul>
					</div>
				</div>
			</div>
