package com.space.app.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
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
import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.reservation.mapper.ReservationMapper;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;
import com.project.space.user.mapper.Mem_InfoMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/resources/config/spring/datasource-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReviewTest {
	
	@Resource(name="dataSource-oracle")
	private DataSource ds;
	//서비스 테스트시에 필요한 객체
	@Inject
	private Mem_InfoMapper mapper;
	
	@Inject
	private SpaceInfoMapper smapper;
	
	
	@Inject
	private ReservationMapper rmapper;
	
	@Inject
	private AdminMapper testmapper;
	
	private final static Random random = new Random();
	private final static Calendar cal = Calendar.getInstance();
	
	@Test
	public void testRes() throws Exception{
		
		
	}

	public int randomNumber(int bound) throws Exception {
		return random.nextInt(bound);
	}
}
