package com.project.space.user.service;

import java.util.List;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PagingVO;
import com.project.space.domain.NotUserException;

public interface UserService {
	
	int createUser(Mem_InfoVO memvo);  //유저등록

	int getUserCount(PagingVO pvo);  //페이지

	List<Mem_InfoVO> listUser(PagingVO pvo);  //페이지 유저 리스트

	boolean idCheck(String userid);

	int deleteUser(Integer midx);

	int updateUser(Mem_InfoVO user);

	Mem_InfoVO getUser(Integer midx);

	Mem_InfoVO findUser(Mem_InfoVO findUser) throws NotUserException;

	Mem_InfoVO loginCheck(String userid, String pwd) throws NotUserException;
	

}
