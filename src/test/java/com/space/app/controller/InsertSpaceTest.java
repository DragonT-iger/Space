package com.space.app.controller;

import java.util.Calendar;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.space.admin.mapper.AdminMapper;
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
public class InsertSpaceTest {
	
	@Resource(name="dataSource-oracle")
	private DataSource ds;
	//서비스 테스트시에 필요한 객체
	@Inject
	private Mem_InfoMapper mapper;
	
	@Inject
	private AdminMapper testmapper;
	
	private final static Random random = new Random();
	private final static Calendar cal = Calendar.getInstance();
	
	@Test
	public void testSpace() throws Exception{
	
	
		Space_InfoVO svo = new Space_InfoVO();
		for(int j=0; j<30;j++) {
			svo.setSname("공간테스트"+j);
			svo.setUserid("owner3"); //회원아이디
			svo.setMinn(1); // 최소인원 
			svo.setMaxn(10); // 최다인원 
			svo.setBcost(23412); // 기본비용 
			svo.setEcost(100000); // 인원추가금 
			svo.setSpost("06152");
			svo.setSaddr1("서울 강남구 언주로 508");
			svo.setSaddr2("14층");
			svo.setSlong("127.042909941112");
			svo.setSlat("37.5039660612952");
			svo.setH_code(randomNumber(4)+1);  //해시태그 fk
			svo.setSimage1("dog2.jpg");
			svo.setScontents("테스트입니다(내용)"+j);
			svo.setSrule("테스트입니다(규칙)"+j);
			testmapper.SpaceInfoInsertTest(svo);
		}
	
		
	}
	
	public int randomNumber(int bound) throws Exception {
		return random.nextInt(bound);
	}
}
