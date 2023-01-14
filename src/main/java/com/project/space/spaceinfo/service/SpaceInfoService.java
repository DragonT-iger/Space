package com.project.space.spaceinfo.service;

import java.util.List;
import java.util.Map;

import com.project.space.domain.HashtagVO;
import com.project.space.domain.Heart_LikeVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.Space_Like;

public interface SpaceInfoService {

	//지역으로 공간검색
    public List<Space_InfoVO> selectByLoc(String keyword);
    //공간이름으로 검색
    public List<Space_InfoVO> selectByPname(String keyword);
    //공간금액으로 검색 최소금액과 최대금액사이 || 왼쪽 null값이면 오른쪽값 이하금액 || 오른쪽이 null값이면 왼쪽금액 이상
    public List<Space_InfoVO> selectBy(Map<Integer,Integer> cost);
	
	//해시태그별로 공간정보가져오기
	public List<Space_InfoVO> selectByHashTag(int h_code);
	//공간정보 전체출력
	public List<Space_InfoVO> getSpaceInfoAll();
	//공간번호로 공간정보 가져오기
	public Space_InfoVO selectBySnum(int snum);
	//찜많은순 조회
	public List<Space_InfoVO> selectBySnum(Space_InfoVO sivo); 
	
	
	/* 등록자or관리자 정보 관리 */
	//공간추가
	public int SpaceInfoInsert(Space_InfoVO sivo);
	//공간수정
	public int SpaceInfoUpdate(Space_InfoVO sivo);
	//공간삭제
	public int SpaceInfoDelete(int pnum);
	//등록자별 공간가져오기
	public List<Space_InfoVO> selectBySpaceInfo(String userid);

	public List<Space_InfoVO> selectByUserid(String userid);

	public String selectByh_code(int h_code);
	
	public List<String> GetAllSpaceNameByUserid(String userid);

	public Space_InfoVO selectByuseridSname(String userid , String sname);
	
	public int insertSpaceLike(Heart_LikeVO hlvo); //좋아요 누르기
	//유저별 공간 가져오기(현재 보고있는 공간 제외)
	public List<Space_InfoVO> selectBySpaceInfoExcept(Space_InfoVO sivo);
	public List<Space_Like> selectUserLikeSpace(String userid); //유저 아이디로 좋아요 목록 가져오기
	public int deleteLike(int hnum);
	
	public int deleteBySname(String userid, String sname);
	
	public int getCountAny(String keyword);
	public List<Space_InfoVO> getSpaceInfoPageAll(Map<String, String> map);
	
	//해시태그 목록가져오기
	public List<HashtagVO> getHashTagAll();
}
