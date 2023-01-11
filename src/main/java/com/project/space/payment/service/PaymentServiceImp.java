package com.project.space.payment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.PaymentVO;
import com.project.space.domain.PointVO;
import com.project.space.payment.mapper.PaymentMapper;


@Service
public class PaymentServiceImp implements PaymentService {

    @Inject
	private PaymentMapper paymentmapper;
    
    @Override
    public int insertPayment(PaymentVO pvo){
        return this.paymentmapper.insertPayment(pvo);
    }
}
