package com.project.space.point.mapper;

import java.util.List;

import com.project.space.domain.PointVO;

public interface PointMapper {

	List<PointVO> getPointUser(String mvoId);

}
