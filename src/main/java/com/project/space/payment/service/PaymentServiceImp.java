package com.project.space.payment.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.PaymentVO;
import com.project.space.payment.mapper.PaymentMapper;


@Service
public class PaymentServiceImp implements PaymentService {

    @Inject
	private PaymentMapper paymentmapper;
    
    @Override
    public int insertPayment(PaymentVO pvo){
        return this.paymentmapper.insertPayment(pvo);
    }

    @Override
    public int getPaynum() {
        return this.paymentmapper.getPaynum();
    }

    @Override
    public int getpaymentcount(){
        return this.paymentmapper.getpaymentcount();
    }

    @Override
    public PaymentVO getpaymentbyuseridandmerchant_uid(String userid, String merchant_uid) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("userid", userid);
        map.put("merchant_uid", merchant_uid);
        return this.paymentmapper.getpaymentbyuseridandmerchant_uid(map);
    }
}
