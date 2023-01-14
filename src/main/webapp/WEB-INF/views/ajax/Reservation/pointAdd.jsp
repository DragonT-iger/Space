<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/Spacetop" />

<div class="point_total">
	<div class="container">
		
		<div class="point_header">
			<div class="point_user">
				<h1 class="havePoint">${mivo.mname}님의 현재 잔여 포인트</h1>
				<h2 class="havePoint"><fmt:formatNumber value="${mivo.point}" pattern="###,###"/></h2>



				<a href="../payments/pointAdd">
					<button class="btn-primary btn">충전하기</button>
				</a>
			</div>
		</div>


		<div class="point_body">
			<div class="point_inner">
				<div class="point_1" >
					<h5>포인트 충전 내역</h5>
					<span>충전된 총 포인트: <fmt:formatNumber value="${mivo.pointadd}" pattern="###,###"/></span>
					<ul class="point_list">
					<c:if test="${pvoArr eq null or empty pvoArr}">
						<div>
							<span><b>포인트 충전 내역이 없습니다.</b></span>
						</div>
					</c:if>
					
					<c:if test="${pvoArr ne null or not empty pvoArr}">
					<c:forEach var="pp" items="${pvoArr}">
						<li class="pointaddlist">
							<div class="box">
								<p>충전처 : ${pp.paykind}</p>
								<p>충전된 포인트 : <fmt:formatNumber value="${pp.plusPoint}" pattern="###,###,###"/></p>
								<p><fmt:formatDate value="${pp.paydate}" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></p>
							</div>
						</li>
					</c:forEach>
					</c:if>
					</ul>
				</div>
				
				<div class="point_1">
					<h5>포인트 사용 내역</h5>
					<span>사용된 총 포인트: <fmt:formatNumber value="${resPrice}" pattern="###,###,###"/></span>
					<ul class="point_list">
					<c:if test="${resArr eq null or empty resArr}">
						<div>
							<span><b>포인트 사용 내역이 없습니다.</b></span>
						</div>
					</c:if>
					
					<c:if test="${resArr ne null or not empty resArr}">
					<c:forEach var="pu" items="${resArr}">
						<li class="pointuselist">
							<div class="box">
								<p><a href="/space/user/MyReservation">사용처 : ${pu.snum}</a></p>
								<p>사용된 포인트 : <fmt:formatNumber value="${pu.totalprice}" pattern="###,###"/></p>
								<p><fmt:formatDate value="${pu.rdate}" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></p>
							</div>
						</li>
					</c:forEach>
					</c:if>
					</ul>
				</div>
				
			</div>

						
		</div>
		
		
	</div>
</div>
<c:import url="/Spacefoot" />

<style>
.btn{
	margin-top:20px;
	margin-bottom:20px;
}
.havePoint{
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
}

.point_total{
	width:100%;
	height:800px;
}
.point_1{
	width:48%;
	height:500px;
	float:left;
}	
</style>