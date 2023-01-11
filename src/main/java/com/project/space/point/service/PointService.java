package com.project.space.point.service;

import java.util.List;

import com.project.space.domain.PointVO;

public interface PointService {

	List<PointVO> getPointUser(String mvoId);  //회원 아이디로 충전 내역 가져오기
	
	
}
