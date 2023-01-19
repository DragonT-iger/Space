package com.project.space.payment.mapper;

import java.util.List;

import com.project.space.domain.PointVO;

public interface PaymentMapper {
	public PointVO getPayMent(int paynum);
    public List<PointVO> getPayMentList();
    public int insertPayMent(PointVO payment);
    public int updatePayMent(PointVO payment);
    public int deletePayMent(int paynum);
}
