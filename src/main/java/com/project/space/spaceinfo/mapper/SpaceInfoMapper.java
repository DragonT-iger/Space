package com.project.space.spaceinfo.mapper;

import java.util.List;
import java.util.Map;

import com.project.space.domain.Space_InfoVO;

public interface SpaceInfoMapper {
	//해시태그별로 공간정보가져오기
	public List<Space_InfoVO> selectByHashTag(String hashTag);
	//공간정보 전체출력
	public List<Space_InfoVO> getSpaceInfoPageAll(Map<String,Integer> map);
	//공간번호로 공간정보 가져오기
	public Space_InfoVO selectBySnum(int snum);
	//찜많은순 조회
	public List<Space_InfoVO> selectBySnum(Space_InfoVO vo);
	//지역으로 공간검색
	public List<Space_InfoVO> selectByLoc(String keyword);
	//공간이름으로 검색
	public List<Space_InfoVO> selectByPname(String keyword);
	//공간금액으로 검색 최소금액과 최대금액사이 || 왼쪽 null값이면 오른쪽값 이하금액 || 오른쪽이 null값이면 왼쪽금액 이상
	public List<Space_InfoVO> selectBy(Map<Integer,Integer> cost);
	
	/* 등록자or관리자 정보 관리 */
	//공간추가
	public int SpaceInfoInsert(Space_InfoVO prod);
	//공간수정
	public int SpaceInfoUpdate(Space_InfoVO prod);
	//공간삭제
	public int SpaceInfoDelete(int pnum);
	//등록자별 공간가져오기
	public List<Space_InfoVO> selectBySpaceInfo(int mnum);

	public Space_InfoVO selectByUserid(String userid);

	public String selectByh_code(int h_code);
		
		
}
