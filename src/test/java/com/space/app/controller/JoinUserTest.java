package com.space.app.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
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

import com.project.space.admin.mapper.AdminMapper;
import com.project.space.domain.Mem_InfoVO;
import com.project.space.user.mapper.Mem_InfoMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/resources/config/spring/datasource-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class JoinUserTest {
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Resource(name="dataSource-oracle")
	private DataSource ds;
	//서비스 테스트시에 필요한 객체
	@Inject
	private Mem_InfoMapper mapper;
	
	private AdminMapper testmapper;
	
	private final static Random random = new Random();
	private final static Calendar cal = Calendar.getInstance();
	public final static String ALL_KOREAN_LAST_NAME = "김이박최정강조윤장임한오서신권황안송류전홍고문양손배백허유남심지노하곽성차주우구라민진엄채원천방공현함변염여추도소석선설마길연위표명기반왕금옥육인맹제모탁국어은편용예경봉사부가복태목형계피두감음빈동온호범좌팽승간상시갈단견당화창";
	public final static String ALL_KOREAN_NAMABLE_KOR = "가각간갈감갑강개객갱갹거건걸검겁게격견결겸경계고곡곤골공곶과곽관괄광괘괴괵굉교구국군굴궁권궐궤귀규균귤극근글금급긍기긴길김끽나낙난날남납낭내녀녁년념녑녕노농뇌뇨누눈눌뉴뉵능니닉닐다단달담답당대댁덕도독돈돌동두둔둘득등라락란랄람랍랑래랭"
            +"략량려력련렬렴렵령례로록론롱뢰료룡루류륙륜률륭륵름릉리린림립마막만말망매맥맹멱면멸명몌모목몰몽묘무묵문물미민밀박반발방배백번벌범법벽변별병보복본볼봉부북분불붕비빈빙사삭산살삼삽상새색생서석선설섬섭성세소속손솔송쇄쇠수숙순술숭쉬슬습승시"
            +"식신실심십쌍씨아악안알암압앙애액앵야약양어억언얼엄업에엔여역연열염엽영예오옥온올옹와완왈왕왜외요욕용우욱운울웅원월위유육윤율융은을음읍응의이익인일임입잉자작잔잠잡장재쟁저적전절점접정제조족존졸종좌죄주죽준줄중즉즐즙증지직진질짐집징차착"
            +"찬찰참창채책처척천철첨첩청체초촉촌총촬최추축춘출충췌취측층치칙친칠침칩칭쾌타탁탄탈탐탑탕태택탱터토톤통퇴투퉁특틈파판팔패팽퍅편폄평폐포폭표품풍피픽필핍하학한할함합항해핵행향허헌헐험혁현혈혐협형혜호혹혼홀홍화확환활황회획횡효후훈훌훙훤훼휘휴휼흉흑흔흘흠흡흥희히힐";
	@Test
	public void testUser() throws Exception{
		
		
		for(int i=30;i<50;i++) {
		Mem_InfoVO vo = new Mem_InfoVO();
		vo.setUserid("user"+i);
		vo.setMpwd(pwencoder.encode("user"+i));
		vo.setMname(randomSelect(ALL_KOREAN_LAST_NAME,1)+randomSelect(ALL_KOREAN_NAMABLE_KOR,2));
		vo.setStatus(0);
		vo.setNickname("일반유저"+i);
		vo.setMrank(1);
		String hp = "010";
		for(int rhp=0; rhp<8; rhp++ ) {
			hp += randomNumber(10);
		}
		vo.setHp(hp);
		String acparam = "";
		for(int rac=0; rac<11; rac++ ) {
			acparam += randomNumber(10);
		}
		Long ac = Long.parseLong(acparam);
		vo.setAccount(ac);
		
		List<Mem_InfoVO> listbc = mapper.listBankcode();
		int rbc = randomNumber(listbc.size());
		String bc=listbc.get(rbc).getBank_code();
		vo.setBank_code(bc);
		
		vo.setBirth(Integer.parseInt(randomBirth(1980,2008)));
		int rpoint = 100000+randomNumber(999999);
		vo.setPoint(rpoint);
		vo.setPointadd(rpoint);
		int day = randomNumber(18)+1;
		Date date = Date.valueOf("2023-01-"+Integer.toString(day));
		vo.setMdate(date);
		int j = testmapper.createUserTest(vo);
		}
		
		
		/*
		String acparam = "";
		for(int rac=0; rac<11; rac++ ) {
			acparam += randomNumber(10);
		}
		Long ac = Long.parseLong(acparam);
		log.info(ac);
		*/
		//log.info(randomSelect(ALL_KOREAN_LAST_NAME,1)+randomSelect(ALL_KOREAN_NAMABLE_KOR,2));
		
		/*
		String hp = "010";
		for(int rhp=0; rhp<8; rhp++ ) {
			hp += randomNumber(10);
		}
		log.info(hp);
		/*
		List<Mem_InfoVO> listbc = mapper.listBankcode();
		
		for(int i=0;i<50;i++) {
			int rbc = randomNumber(listbc.size());
			String bc=listbc.get(rbc).getBank_code();
			log.info(bc);
		}
		*/	
		
	}
	public String randomBirth(int startYear, int endYear) throws Exception {
		
		if (startYear > endYear) {
			throw new Exception();
		}
		
		int randYear = startYear + randomNumber(endYear - startYear);
		int randMonth = randomNumber(12) + 1;
        cal.set(randYear, randMonth, 1);
        
		int randDate = randomNumber(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		return LocalDate.of(randYear, randMonth, randDate == 0 ? 1 : randDate)
						.format(DateTimeFormatter.BASIC_ISO_DATE);
	}
	
	public String randomSelect(String sidx, int size) throws Exception {
		
		if (size < 1) {
			throw new Exception("글자수 1이상만가능해요");  
		}
		
		StringBuilder bStr = new StringBuilder(); 
		
		int i=0;
		while(i++ < size) {
			int random_idx = randomNumber(sidx.length());
			bStr.append(sidx.substring(random_idx, random_idx+1));
		}
		return bStr.toString();
	}
	
	public int randomNumber(int bound) throws Exception {
		return random.nextInt(bound);
	}
}
