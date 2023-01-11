<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script><!-- jQuery CDN --->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="cancelPay()">환불하기</button>


    
    <script>
    function cancelPay() {
        jQuery.ajax({
        "url": "cancel", // 예: http://www.myservice.com/payments/cancel
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
            "merchant_uid": "ORD20180131-0000011", // 예: ORD20180131-0000011
            "cancel_request_amount": 100, // 환불금액
            "reason": "테스트 결제 환불", // 환불사유
            "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
            "refund_bank": "4", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
            "refund_account": "26150204210738" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
        }),
        "dataType": "json"
        });
    }
    </script>
</body>
</html>