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
        	</style>
            <!-- set defalut Ajax   -->
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
					<c:forEach var="sl" items="${hlArr}">
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
							<li>★★★★★</li>
							<li>(후기개수)</li>
							<!-- <li>찜개수</li> -->
						</ul>
						<ul class="myzzim-col">
							<li><fmt:formatDate value="${sl.hdate}" pattern="yyyy-MM-dd"/></li>
						</ul>
						<ul class="myzzim-col">
							<li><a href="/space/Reservation?snum=${sl.snum}">예약하기</a><li>
							<li><a href="/space/user/MyZimmdelete?hnum=${sl.hnum}">찜 취소</a><li>
						</ul>
					</div>
					</c:forEach>
					</c:if>
					<!-- 반복문 end -->
				</div>
			</div>
<c:import url="/Spacefoot" charEncoding="utf-8" />