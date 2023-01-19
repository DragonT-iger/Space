package com.project.space.payment.service;

import java.util.List;

import com.project.space.domain.PointVO;

public interface PaymentService {
    public PointVO getPayMent(int paynum);
    public List<PointVO> getPayMentList();
    public int insertPayMent(PointVO payment);
    public int updatePayMent(PointVO payment);
    public int deletePayMent(int paynum);
}
