package com.space.app.controller;
/*
import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.user.mapper.Mem_InfoMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/resources/config/spring/datasource-context.xml"})
@Log4j
public class UserTestController {
	/*
	//而⑦듃濡ㅻ윭 �뀒�뒪�듃�떆�뿉 �븘�슂�븳 媛앹껜	
	@Inject
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public  void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testUser() throws Exception{
		log.info(
					mockMvc.perform(MockMvcRequestBuilders.get("/MySpaceInfoView").param("snum", "1"))
					.andReturn()
					.getModelAndView()
					.getModelMap()
				);
	}
	*/

	//�꽌鍮꾩뒪 �뀒�뒪�듃�떆�뿉 �븘�슂�븳 媛앹껜
	/*
	@Inject
	private Mem_InfoMapper mapper;
	
	@Test
	public void testUser() throws Exception{
		Mem_InfoVO vo = mapper.getUser("owner1");
		log.info("Mem_InfoVO===>"+vo);
		
		log.info("getAuthorities===>"+vo.getAuthorities());

	}
	*/
//}
