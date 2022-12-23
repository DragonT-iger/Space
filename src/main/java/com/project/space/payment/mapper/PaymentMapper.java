package com.project.space.payment.mapper;

import java.util.List;

import com.project.space.domain.PaymentVO;

public interface PaymentMapper {
	public PaymentVO getPayMent(int paynum);
    public List<PaymentVO> getPayMentList();
    public int insertPayMent(PaymentVO payment);
    public int updatePayMent(PaymentVO payment);
    public int deletePayMent(int paynum);
}
