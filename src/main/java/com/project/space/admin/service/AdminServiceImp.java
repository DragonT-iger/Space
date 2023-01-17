package com.project.space.admin.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.admin.mapper.AdminMapper;
import com.project.space.admin.service.AdminMemberInquiryVO;
import com.project.space.domain.HashtagVO;
import com.project.space.domain.PagingVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImp implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<AdminMemberInquiryVO> searchUserByFilter(Map<String, String> filter) {
		log.info("filter==>"+filter);
		return adminMapper.searchUserByFilter(filter);
	}
	
	@Override
	public List<HashtagVO> getHashTagAll(){
		return adminMapper.getHashTagAll();
	}

	@Override
	public List<AdminMemberInquiryVO> listUser(PagingVO pvo) {
		return adminMapper.listUser(pvo);
	}

	@Override
	public List<AdminSpaceInquiryVO> listSpace(PagingVO pvo) {
		// TODO Auto-generated method stub
		return adminMapper.listSpace(pvo);
	}
	
	@Override
	public List<AdminSpaceInquiryVO> searchSpaceByFilter(Map<String, String> filter){
		return adminMapper.searchSpaceByFilter(filter);
	}
	
	@Override
	public List<String> getSpaceAddr(){
		List<String> spaceaddr = adminMapper.getSpaceAddr();
		
		String[] splitaddr = null ;
		HashSet<String> local = new HashSet<String>(); //중복데이터 삽입을 방지
		for(int i =0 ; i<spaceaddr.size();i++) {
			splitaddr = spaceaddr.get(i).split(" ");
			local.add(splitaddr[0]);
		}
		List<String> list = new ArrayList<>(local); //hashset을 리스트로변환
		return list;
	}

	@Override
	public List<AdminMemberHistoryVO> getUserHistory(String userid) {
		// TODO Auto-generated method stub
		return adminMapper.getUserHistory(userid);
	}

	@Override
	public List<AdminMemberInquiryVO> todayJoinMember(String date) {
		// TODO Auto-generated method stub
		return adminMapper.todayJoinMember(date);
	}

	@Override
	public List<AdminSpaceInquiryVO> todayInsertSpace(String date) {
		// TODO Auto-generated method stub
		return adminMapper.todayInsertSpace(date);
	}

	@Override
	public List<AdminSpaceInquiryVO> todayPopSpace(String date) {
		// TODO Auto-generated method stub
		return adminMapper.todayPopSpace(date);
	}

	@Override
	public List<AdminGraphDataVO> DatabyDate(String date) {
		
		return adminMapper.DatabyDate(date);
	}
}
