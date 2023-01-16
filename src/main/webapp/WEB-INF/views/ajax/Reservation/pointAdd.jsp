<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/Spacetop" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
    var IMP = window.IMP; // 생략 가능
        IMP.init("imp74514601"); // 예: imp00000000
</script>

<div class="point_total">
	<div class="container">
		
		<div class="point_header">
			<div class="point_user">
				<h1 class="havePoint">${mivo.mname}님의 현재 잔여 포인트</h1>
				<h2 class="havePoint"><fmt:formatNumber value="${mivo.point}" pattern="###,###"/></h2>
				

				<input type="text" id="amount" placeholder="금액을 입력하세요">
				<button onclick="requestPay()" class="btn-primary btn">충전하기</button>
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

<script>
    function requestPay() {

        var amount = document.getElementById("amount").value;


      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
        

        pg: "html5_inicis", // 상수
        pay_method: "card", // 상수
        merchant_uid: "${merchant_uid}",
        name: "포인트 충전",  // space_info(sname)
        amount: amount, //100원 미만은 결제 불가능 // model requestparam
        buyer_email: "gildong@gmail.com", // 이메일이 없으므로 고정값을 넣거나 해야됨
        buyer_name: "${mname}", // mname
        buyer_tel: "${hp}", //hp
        buyer_addr: "서울특별시 강남구 신사동", //addr 정보도 없음 --> 임의값
        buyer_postcode: "01181" // 마찬가지로 정보 없음. --> 임의값
          
          
          //즉 model에서 가져와야 하는 정보
          //1. mearchant_uid , 2.sname, 3.param(amount), 4.mname, 5.hp
          
          
          
      }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        // jQuery로 HTTP 요청
        jQuery.ajax({
            url: "../payments/complete", // 예: localhost:9090/payments/complete
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify({
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid,
                amount: amount
            })
        }).done(function (data) {
            alert("성공 (디버깅용)");
        })
        } else {
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
      });
    }
  </script>