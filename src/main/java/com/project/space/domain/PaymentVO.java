package com.project.space.domain;

import lombok.Data;


@Data
public class PaymentVO {
    private int paynum; // nextval
    private String imp_uid;
    private String merchant_uid; 
    private java.util.Date paydate; //sysdate
    private int amount;  
    private String status;  //0 = 결제완료, 1 = 환불완료
    private String refund_reason; // varchar남겨두고
    private String userid; //session
}
