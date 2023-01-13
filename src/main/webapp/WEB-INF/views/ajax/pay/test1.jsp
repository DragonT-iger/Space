<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!-- jQuery -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
    var IMP = window.IMP; // 생략 가능
        IMP.init("imp74514601"); // 예: imp00000000
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button>

  <script>
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis", // 상수
          pay_method: "card", // 상수
          merchant_uid: "${merchant_uid}",
          name: "${sname}",  // space_info(sname)
          amount: "${amount}", //100원 미만은 결제 불가능 // model requestparam
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
            url: "complete", // 예: localhost:9090/payments/complete
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: JSON.stringify({
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid,
                amount: "100"
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
</body>
</html>

