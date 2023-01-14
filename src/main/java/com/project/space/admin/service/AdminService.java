package com.project.space.admin.service;

import java.util.List;
import java.util.Map;

import com.project.space.admin.service.AdminMemberInquiryVO;
import com.project.space.domain.HashtagVO;
import com.project.space.domain.PagingVO;

public interface AdminService {
	public List<AdminMemberInquiryVO> searchUserByFilter(Map<String,String> filter);
	
	public List<HashtagVO> getHashTagAll();
	
	public List<AdminMemberInquiryVO> listUser(PagingVO pvo);
	
	public List<AdminSpaceInquiryVO> listSpace(PagingVO pvo);
	
	public List<String> getSpaceAddr();
	
	public List<AdminSpaceInquiryVO> searchSpaceByFilter(Map<String, String> filter);
	
	public List<AdminMemberHistoryVO> getUserHistory(String userid);

	public List<AdminMemberInquiryVO> todayJoinMember(String string);
	
	public List<AdminSpaceInquiryVO> todayInsertSpace(String string);
	
	public List<AdminSpaceInquiryVO> todayPopSpace(String string);
}
