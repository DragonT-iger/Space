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
public class ReservationTest {
	
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
		ReservationVO vo = new ReservationVO();
		for(int i=100; i<105; i++) {
			vo.setRtnum(i); //예약번호
			List<Space_InfoVO> space = smapper.getSpaceInfoAll(); //space 모든공간가져와서 랜덤한 리스트중 공간번호 입력
			vo.setSnum(space.get(randomNumber(space.size())).getSnum()); //공간번호
			
			List<Mem_InfoVO> member = testmapper.testUserList(); //모든 일반유저 목록 
			vo.setUserid(member.get(randomNumber(member.size())).getUserid()); //회원아이디 랜덤으로 회원아이디 입력
			
			int ranstart = randomNumber(20);
			String rstart="";
			int ranend = ranstart+ randomNumber(4)+1;
			String rend ="";
			if(ranstart<10) {
				rstart = "0"+ranstart;
			}else {
				rstart = Integer.toString(ranstart);
			}
			if(ranend<10) {
				rend= "0"+ranend;
			}else {
				rend=Integer.toString(ranend);
			}
			log.info("Rtstart==>"+rstart+":00");
			log.info("Rend==>"+rend+":00");
			vo.setRtstart(rstart+":00"); //예약시작날짜
			vo.setRtend(rend+":00"); //예약종료시간
			
			Space_InfoVO s = testmapper.testselectBySnum(vo.getSnum()); //랜덤으로 선택된 공간
			
			log.info("s.getMinn()==>"+s.getMinn());
			log.info("s.getMaxn()==>"+s.getMaxn());
			vo.setRtnumber(randomNumber(s.getMaxn()-s.getMinn())+s.getMinn()); //예약인원
			
			vo.setCountprice(vo.getRtnumber(), s.getMinn(), s.getEcost());
			vo.setTimePrice(ranend-ranstart, s.getBcost());
			vo.setTotalPrice(vo.getCountPrice(),vo.getTimePrice()); //TimePrice+CountPrice ==> 총 결제 금액
			vo.setRtstatus(0); //예약상태
			
			
			int day = randomNumber(18)+1;
			Date date = Date.valueOf("2023-01-"+Integer.toString(day));
			vo.setRdate(date); //예약완료 시간
			int rtday = day+randomNumber(31-day)+1;
			if(rtday<10) {
				vo.setRtstartdate("2023010"+rtday);
			}else {
				vo.setRtstartdate("202301"+rtday);
			}
			log.info(vo);
			
			testmapper.testinsertBooking(vo);
			rmapper.updateUserRes(vo); //포인트차감
		}
		
	}

	public int randomNumber(int bound) throws Exception {
		return random.nextInt(bound);
	}
}
