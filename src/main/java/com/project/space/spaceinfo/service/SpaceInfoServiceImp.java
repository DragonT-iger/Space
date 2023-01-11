package com.project.space.spaceinfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;

@Service
public class SpaceInfoServiceImp implements SpaceInfoService{
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
		return spaceinfoMapper.selectByPname(keyword);
	}

	@Override
	public List<Space_InfoVO> selectBy(Map<Integer, Integer> cost) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Space_InfoVO> selectByHashTag(int h_code) {
		return this.spaceinfoMapper.selectByHashTag(h_code);
	}

	@Override
	public List<Space_InfoVO> getSpaceInfoAll() {
		return this.spaceinfoMapper.getSpaceInfoAll();
	}
	@Override
	public List<Space_InfoVO> getSpaceInfoPageAll(Map<String, String> map){
		return this.spaceinfoMapper.getSpaceInfoPageAll(map);
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
		return this.spaceinfoMapper.SpaceInfoInsert(sivo);
	}

	@Override
	public int SpaceInfoUpdate(Space_InfoVO sivo) {
		return this.spaceinfoMapper.SpaceInfoUpdate(sivo);
	}

	@Override
	public int SpaceInfoDelete(int pnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Space_InfoVO> selectBySpaceInfo(String userid) {
		return this.spaceinfoMapper.selectBySpaceInfo(userid);
	}

	@Override
	public List<Space_InfoVO> selectByUserid(String userid) {
		return this.spaceinfoMapper.selectByUserid(userid);
	}

	@Override
	public String selectByh_code(int h_code) {
		return this.spaceinfoMapper.selectByh_code(h_code);
	}

	@Override
	public List<String> GetAllSpaceNameByUserid(String userid) {
		return this.spaceinfoMapper.GetAllSpaceNameByUserid(userid);
	}

	@Override
	public Space_InfoVO selectByuseridSname(String userid, String sname) {
		Map<String,String> map=new HashMap<>();
		map.put("userid", userid);
		map.put("sname", sname);
		
		return this.spaceinfoMapper.selectByuseridSname(map);
	}
	@Override
	public int getCountAny(String keyword) {
		return this.spaceinfoMapper.getCountAny(keyword);
	}
	
	@Override
	public List<Space_InfoVO> getSpaceInfoByHcode(int h_code) {
		return this.spaceinfoMapper.getSpaceInfoByHcode(h_code);
	}


}
