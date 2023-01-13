package com.project.space.user.mapper;

import java.util.List;
import java.util.Map;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NotUserException;
import com.project.space.domain.PagingVO;

public interface Mem_InfoMapper {
	int createUser(Mem_InfoVO memvo);  //�쑀���벑濡�

	int getUserCount(PagingVO pvo);  //�럹�씠吏�

	List<Mem_InfoVO> listUser(PagingVO pvo);  //�럹�씠吏� �쑀�� 由ъ뒪�듃

	int idCheck(String userid);

	int deleteUser(Mem_InfoVO mpwd);//�쉶�썝�깉�눜

	int updateUser(Mem_InfoVO user);//�쉶�썝�닔�젙

	Mem_InfoVO getUser(String userid);

	Mem_InfoVO findUser(Mem_InfoVO findUser) throws NotUserException;

	Mem_InfoVO loginCheck(String userid, String mpwd) throws NotUserException;
	
	List<Mem_InfoVO> searchUserByFilter(Map<String,String> filter);

	int getStatusByUserid(String userid);

}
