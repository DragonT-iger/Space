package com.project.space.user.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NotUserException;
import com.project.space.domain.PagingVO;
import com.project.space.user.mapper.UserMapper;


@Service("userService")
public class UserServiceImpl implements UserService {

	
	@Inject
	private UserMapper userDao;
	
	@Override
	public int createUser(Mem_InfoVO user) {
		
		return userDao.createUser(user);
	}

	@Override
	public int getUserCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Mem_InfoVO> listUser(PagingVO pvo) {
		return userDao.listUser(pvo);
	}

	@Override
	public boolean idCheck(String userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int deleteUser(Mem_InfoVO vo) {
		return userDao.deleteUser(vo);
	}

	@Override
	public int updateUser(Mem_InfoVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Mem_InfoVO getUser(Integer midx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Mem_InfoVO findUser(Mem_InfoVO findUser) throws NotUserException {
		Mem_InfoVO user=userDao.findUser(findUser);
		if(user==null) {
			throw new NotUserException("존재하지 않는 아이디입니다");
		}
		return user;
	}

	@Override
	public Mem_InfoVO loginCheck(String userid, String mpwd) throws NotUserException {
		Mem_InfoVO tmpVo=new Mem_InfoVO();
		tmpVo.setUserid(userid);
		
		Mem_InfoVO user=this.findUser(tmpVo);
		if(user==null) {
			throw new NotUserException("존재하지 않는 아이디입니다");
		}
		if(!user.getMpwd().equals(mpwd)) { 
			throw new NotUserException("비밀번호가 일치하지 않습니다");
		}
		
		return user;
	}

}
