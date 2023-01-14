<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
<style>
			.review_list{
				width:100%;
				background-color : #fdf5e6;
				border : 1px solid #faf0e6;
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
			
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #ff4500;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: #ff4500;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}			
</style>
		
<h1 class="text-center"> 나의 리뷰내역</h1>
	<div class="myreview_wrap mt-5">
        	<!-- 리뷰내역 필요리스트 (로그인한 회원번호로 select) 사진 장소이름 장소주소 별점 리뷰제목 리뷰내용 리뷰 답변 -->
        		<!-- 내가등록한 리뷰들 반복출력 forEach start -->
		<c:if test="${reviewArr eq null or empty reviewArr}">
			<div class="review_List">
				<span><b>작성한 리뷰 내역이 없습니다.</b></span>
			</div>
		</c:if>
      			
		<c:if test="${reviewArr ne null or not empty reviewArr}">
		<c:set var="w" value="0"/>
		<c:forEach var="ra" items="${reviewArr}">
		<c:set var="w" value="${ra.rscore*20}"/>
		<div class="review_list">
		<button class="review_delbtn btn btn-danger" onclick="del_review('${ra.review_num}')">삭제</button>
			<div class="review-profile">
				<div class="review review-time">${ra.review_date}</div>
				
				<div class="star-ratings">
					<div class="star-ratings-fill space-x-2 text-lg" style="width:${w}%">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base space-x-2 text-lg">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
				</div>
				
				<c:if test="${ra.rimage1 ne null or ra.rimage2 ne null}">
					<div class="review_img">
					<img class="review_img" src="./resources/SpaceInfoImg/${ra.rimage1})"></img>
					<img class="review_img" src="./resources/SpaceInfoImg/${ra.rimage2})"></img>
					</div>
				</c:if>
				
				<div class="review space-name"><a href="/space/spaceDetail?snum=${ra.snum}">${ra.snum}</a></div>
				<div class="review review-title">예약날짜</div>
			</div>
			
			<div class="review-content-wrap">
				<p class="review-user">내가 쓴 리뷰</p>
				<p class="review-content">
					${ra.rcontent}
				</p>
			</div>

			<div class="review-reple-wrap">
				<p class="review-host">댓글</p>
				<p class="review-reple">
					${ra.rcontent}
				</p>
			</div>
		</div>
		</c:forEach>
		</c:if>
		<!-- 반복문 end -->
	</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />
<script>
$(function(){
	ratingPercent();
})
function ratingToPercent() {
	let rscore=$('.check_rscore').val();
	alert(rscore);
    const score = rscore * 20;
    $('#star').css('width',score+"%")
    return score;
}
</script>