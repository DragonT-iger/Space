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
        "url": "https://api.iamport.kr/payments/cancel", // 예: http://www.myservice.com/payments/cancel
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
            "merchant_uid": "${merchant_uid}", // 주문번호
            "cancel_request_amount": "${amount}", // 환불금액
            "reason": "${reason}", // 환불사유
            "checksum": "${checksum}", // 환불 남은 금액
            "refund_holder": "${refundHoleder}", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
            "refund_bank": "4", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
            "refund_account": "26150204210738" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
        }),
            contentType: "application/json",
            headers: {
                "Authorization": 5840207338036471
            },
            success: function(response) {
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }

    </script>
</body>
</html>
