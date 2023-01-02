package com.project.space.spaceinfo.service;

import java.util.List;

import com.project.space.spaceinfo.service.Space_InfoVO;
	
public interface SpaceInfoService {
	//해시태그별로 공간정보가져오기
	public List<Space_InfoVO> selectByHashTag(String hashTag);
	//공간정보 전체출력
	public List<Space_InfoVO> getSpaceInfoAll();
	//공간번호로 공간정보 가져오기
	public Space_InfoVO selectBySnum(int snum);
	//찜많은순 조회
	public List<Space_InfoVO> selectBySnum(Space_InfoVO vo);
	
	
	/* 등록자or관리자 정보 관리 */
	//공간추가
	public int SpaceInfoInsert(Space_InfoVO prod);
	//공간수정
	public int SpaceInfoUpdate(Space_InfoVO prod);
	//공간삭제
	public int SpaceInfoDelete(int pnum);
	//등록자별 공간가져오기
	public List<Space_InfoVO> selectBySpaceInfo(int mnum);
		
}
