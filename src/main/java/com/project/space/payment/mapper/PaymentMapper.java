package com.project.space.payment.mapper;

import java.util.List;
import java.util.Map;

import com.project.space.domain.PaymentVO;

public interface PaymentMapper {

    public int insertPayment(PaymentVO pvo);
    
    public int getPaynum();

    public int getpaymentcount();

    public PaymentVO getpaymentbyuseridandmerchant_uid(Map<String, String> map);
}
