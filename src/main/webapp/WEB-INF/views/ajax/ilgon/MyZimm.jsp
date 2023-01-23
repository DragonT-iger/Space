<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/Spacetop" charEncoding="utf-8" />
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
        		.btn1{
        		color:white;
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
       
            <!-- set defalut Ajax   -->
            <br>
            <h1 class="text-center">나의 찜목록</h1>
			<div class="myzzim-wrap mt-5">
				<div class="myzzim-list">
					<!-- 반복문 start-->
					<c:if test="${hlArr eq null or empty hlArr}">
						<div>
							<span><b>아직 찜한 공간이 없습니다.</b></span>
						</div>
					</c:if>
					
					<c:if test="${hlArr ne null or not empty hlArr}">
					<c:set var="w" value="0"/>
					<c:forEach var="sl" items="${hlArr}">
					<c:set var="w" value="${sl.rscore*20}"/>
					<div class="myzzim-item">
						<input type="hidden" value="${sl.hnum}"/>
						<div class="myzzim-col myzzim-img">
							<a href="/space/spaceDetail?snum=${sl.snum}">
								<c:if test="${sl.simage1 eq null}">
									<img class="space-info-img" src="../img/noSpaceImage.jpg"/>
								</c:if>
								<c:if test="${sl.simage1 ne null}">
									<img class="space-info-img" src="../resources/SpaceInfoImg/${sl.simage1}"/>
								</c:if>
							</a>
						</div>
						<ul class="myzzim-col myzzim-space-info">
							<li><a>${sl.sname}</a></li>
							<li class="star-ratings">
								<div class="star-ratings-fill space-x-2 text-lg" style="width:${w}%">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-base space-x-2 text-lg">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
							</li>
							<li>${sl.rcount}</li>
							<!-- <li>찜개수</li> -->
						</ul>
						<ul class="myzzim-col">
							<li><fmt:formatDate value="${sl.hdate}" pattern="yyyy-MM-dd"/></li>
						</ul>
						<ul class="myzzim-col">
							<li class="btn btn-primary"><a class="btn1" href="/space/Reservation?snum=${sl.snum}">예약하기</a><li>
							<br>
							<li class="btn btn-primary"><a class="btn1" href="/space/user/MyZimmdelete?hnum=${sl.hnum}">찜 취소</a><li>
						</ul>
					</div>
					</c:forEach>
					</c:if>
					<!-- 반복문 end -->
				</div>
			</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />