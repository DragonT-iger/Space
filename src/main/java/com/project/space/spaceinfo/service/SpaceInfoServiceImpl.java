package com.project.space.spaceinfo.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;

@Service
public class SpaceInfoServiceImpl implements SpaceInfoService{
	@Inject
	private SpaceInfoMapper spaceinfoMapper;

	@Override
	public List<Space_InfoVO> selectByLoc(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Space_InfoVO> selectByPname(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Space_InfoVO> selectBy(Map<Integer, Integer> cost) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Space_InfoVO> selectByHashTag(String hashTag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Space_InfoVO> getSpaceInfoAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Space_InfoVO selectBySnum(int snum) {
		return this.spaceinfoMapper.selectBySnum(snum);
	}

	@Override
	public List<Space_InfoVO> selectBySnum(Space_InfoVO sivo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int SpaceInfoInsert(Space_InfoVO sivo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int SpaceInfoUpdate(Space_InfoVO sivo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int SpaceInfoDelete(int pnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Space_InfoVO> selectBySpaceInfo(String userid) {
		// TODO Auto-generated method stub
		return null;
	}
}
