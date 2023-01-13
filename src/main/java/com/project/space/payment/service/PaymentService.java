package com.project.space.payment.service;


import com.project.space.domain.PaymentVO;



public interface PaymentService {

    public int insertPayment(PaymentVO pvo);

    public int getPaynum();

    public int getpaymentcount();

    public PaymentVO getpaymentbyuseridandmerchant_uid(String userid, String merchant_uid);
}
