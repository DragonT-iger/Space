package com.space.app.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.user.mapper.Mem_InfoMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/resources/config/spring/datasource-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class joinsecuTest {
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Resource(name="dataSource-oracle")
	private DataSource ds;
	//서비스 테스트시에 필요한 객체
	@Inject
	private Mem_InfoMapper mapper;
	
	@Test
	public void testUser() throws Exception{
		/*
		Mem_InfoVO vo = new Mem_InfoVO();
		vo.setUserid("test123");
		vo.setMpwd(pwencoder.encode("test"));
		vo.setMname("테스트");
		vo.setStatus(1);
		vo.setNickname("test11");
		vo.setHp("00001234");
		int i = mapper.createUser(vo);
		*/
		Mem_InfoVO vo2 = mapper.getUser("test11");
		log.info("test==>"+vo2);
		
		boolean test = pwencoder.matches("test11",vo2.getMpwd() );
		log.info("비밀번호 복호화 후 일치하는지?? ==>"+test);
		

	}
	
}
