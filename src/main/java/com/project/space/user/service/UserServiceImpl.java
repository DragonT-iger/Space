package com.project.space.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NotUserException;
import com.project.space.domain.PagingVO;
import com.project.space.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserMapper usermapper;
	
	@Override
	public int insertUser(Mem_InfoVO vo) {
		System.out.println("insert memberVO ==>>");
		return usermapper.insertUser(vo);
	}

	@Override
	public int getUserCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Mem_InfoVO> listUser(PagingVO pvo) {
		return usermapper.listUser(pvo);
	}

	@Override
	public Integer idCheck(String userid) {
		System.out.println("userid="+userid);
		System.out.println("idcheck=="+usermapper.idCheck(userid));
		return usermapper.idCheck(userid);
	}

	@Override
	public int deleteUser(Integer midx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(Mem_InfoVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Mem_InfoVO getUser(String userid) {
		// TODO Auto-generated method stub
		return usermapper.getUser(userid);
	}

	@Override
	public Mem_InfoVO findUser(Mem_InfoVO findUser) throws NotUserException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Mem_InfoVO loginCheck(String userid, String pwd) throws NotUserException {
		// TODO Auto-generated method stub
		return null;
	}


}
