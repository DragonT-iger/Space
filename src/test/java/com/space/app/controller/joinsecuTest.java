package com.space.app.controller;

import java.util.Random;

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

import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;
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
	
	@Inject
	private SpaceInfoMapper smapper;
	
	@Test
	public void testUser() throws Exception{
		/*
		//어드민 계정 생성
		Mem_InfoVO vo = new Mem_InfoVO();
		vo.setUserid("admin");
		vo.setMpwd(pwencoder.encode("admin"));
		vo.setMname("이관리");
		vo.setStatus(9);
		vo.setNickname("admin");
		vo.setHp("01000001234");
		long ac = 123124123;
		vo.setAccount(ac);
		vo.setBirth(20001111);
		vo.setPoint(10000000);
		int i = mapper.createUser(vo);
		*/
		/*
		//시큐리티 암호화 테스트코드
		Mem_InfoVO vo2 = mapper.getUser("test11");
		log.info("test==>"+vo2);
		
		boolean test = pwencoder.matches("test11",vo2.getMpwd() );
		log.info("비밀번호 복호화 후 일치하는지?? ==>"+test);
		*/
		
		Random r = new Random();
		Space_InfoVO svo = new Space_InfoVO();
		for(int j=0; j<30;j++) {
			svo.setSname("공간테스트"+j);
			svo.setUserid("owner3"); //회원아이디
			svo.setMinn(1); /* 최소인원 */
			svo.setMaxn(10); /* 최다인원 */
			svo.setBcost(23412); /* 기본비용 */
			svo.setEcost(100000); /* 인원추가금 */
			svo.setSpost("06152");
			svo.setSaddr1("서울 강남구 언주로 508");
			svo.setSaddr2("14층");
			svo.setSlong("127.042909941112");
			svo.setSlat("37.5039660612952");
			svo.setH_code(r.nextInt(4)+1);  //해시태그 fk
			svo.setSimage1("dog2.jpg");
			svo.setScontents("테스트입니다(내용)"+j);
			svo.setSrule("테스트입니다(규칙)"+j);
			smapper.SpaceInfoInsert(svo);
		}
	}
	
}
