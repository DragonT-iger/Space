package com.project.space.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.PointVO;
import com.project.space.point.mapper.PointMapper;

@Service
public class PointServiceImp implements PointService {
	
	@Autowired
	private PointMapper pointMapper;

	@Override
	public List<PointVO> getPointUser(String mvoId) {
		return this.pointMapper.getPointUser(mvoId);
	}

}
