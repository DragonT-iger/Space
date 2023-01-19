package com.project.space;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sound.sampled.Port.Info;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.interceptor.PapagoService;
import com.project.space.domain.HashtagVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.service.SpaceInfoService;

import lombok.extern.log4j.Log4j;


/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	SpaceInfoService spaceinfoservice;
	
	@RequestMapping("/changeLang")
	@ResponseBody
	public String changeEng(@RequestParam String html) {
		log.info("변환 전 값========"+html);
		PapagoService ps=new PapagoService();
		String str=ps.getTransPages(html);
		log.info("영어 변환========="+str);
		return str;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test1(Model model) {
		return "NewFile";
	}
	// MainHome
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String Mainhome(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
	      logger.info("connected Home");
	      Map<String, String> pagingMap = new HashMap<String, String>();
	      int pageSize = 8;
	      int pagingNumber = currentPage;

	      pagingMap.put("pagingSize", Integer.toString(pageSize));
	      pagingMap.put("pagingNumber", Integer.toString(pagingNumber));
	      // pagingMap.put("keyword", keyword);
	      // , @RequestParam(value="keyword") String keyword
	      List<Space_InfoVO> inArr = spaceinfoservice.getSpaceInfoPageAll(pagingMap);
	      for (int i = 0; i < inArr.size(); i++) {
	         System.out.println(inArr.get(i));
	      }
	      log.info(inArr);
	      model.addAttribute("spaceArr", inArr);
	      model.addAttribute("currentPage", pagingNumber);
	      
	      
	      List<HashtagVO> hashtag = spaceinfoservice.getHashTagAll();
	      for (int i = 0; i < hashtag.size(); i++) {
	         System.out.println(hashtag.get(i));
	      }
	      log.info(hashtag);
	      model.addAttribute("hashtag", hashtag);
	   

	   
	      
	      

	      return "Home";
	   }
	//해야할것 : hashTag 들어왔을때 조건 처리 , 현재 해쉬태그로 메서드를 들어왔다면 model에 현재 상태가 hashTag로 리스트를 불러왔다는 정보를 View 넘겨줘야함 --> hashTag 동작 이후에 다음버튼 누른다면?
	   //검색후에 페이징 처리 마찬가지로 해쉬태그 검색후에 페이징 처리
	   @RequestMapping(value = "/home", method = RequestMethod.GET, produces = "application/json")
	   @ResponseBody
	   public Map<String, Object> spaceListPaging(@RequestParam(value = "currentPage") String currentPage,
	         @RequestParam("pagingType") String pagingType, @RequestParam("keyword") String keyword , @RequestParam Integer HashTag) { //원래 int
	      if(HashTag==null) {
	         HashTag=0;
	      }
	      Map<String, String> pagingMap = new HashMap<String, String>();
	      log.info("param====>" + currentPage + "/" + pagingType + "/" + keyword + "/" + HashTag);
	      int pageSize = 8; // 띄우고싶은 개수
	      int pagingNumber = Integer.parseInt(currentPage); // 현재페이지
	      int maxpage = spaceinfoservice.getCountAny(keyword);

	      if (pagingType.equals("next") && pagingType != null) {// 다음버튼
	         if (pagingNumber + pageSize < maxpage) {
	            pagingNumber += pageSize;
	         }
	      } else if (pagingType.equals("prev") && pagingType != null) {// 이전버튼
	         if (pagingNumber - pageSize < 0) {
	            pagingNumber = 1;
	         } else {
	            pagingNumber -= pageSize;
	         }
	      } else { // 이전 다음버튼 호출이아니면 검색으로 간주
	         pagingNumber = 1;
	      }
	      
	   
	      
	      
	   
	      
	      pagingMap.put("pagingSize", Integer.toString(pageSize));
	      pagingMap.put("pagingNumber", Integer.toString(pagingNumber));
	      pagingMap.put("findkeyword", keyword);
	      pagingMap.put("hashtag", Integer.toString(HashTag)); 
	      //숫자를 스트링객체로 변환하는데 null값이오면 에러 69번줄에서 처리해줌 

	      List<Space_InfoVO> inArr = spaceinfoservice.getSpaceInfoPageAll(pagingMap);
	      for (int i = 0; i < inArr.size(); i++) {
	         System.out.println(inArr.get(i));
	      }
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("spaceArr", inArr);
	      log.info(pagingMap.get("pagingNumber"));
	      map.put("currentPage", pagingMap.get("pagingNumber"));
	      
	      
	   

	      return map;
	   }

	   @GetMapping(value = "/search", produces = "application/json")
	   @ResponseBody
	   public List<Space_InfoVO> spaceSearch(@RequestParam(value = "keyword") String keyword) {
	      log.info("keyword===>" + keyword);
	      List<Space_InfoVO> map = spaceinfoservice.selectByPname(keyword);
	      log.info("result===>" + map);

	      return map;
	   }

	   @GetMapping(value = "/hashTag", produces = "application/json")
	   @ResponseBody
	   public List<Space_InfoVO> spacehashTag(@RequestParam(value = "hashTag") int hashTag) {
	      log.info("keyword===>" + hashTag);
	      List<Space_InfoVO> map = spaceinfoservice.selectByHashTag(hashTag);
	      ;
	      log.info("result===>" + map);
	      
//	      int h_code = 0;
//	      List<Space_InfoVO> hashtag = spaceinfoservice.getSpaceInfoByHcode(h_code);
//	      for (int i = 0; i < hashtag.size(); i++) {
//	         System.out.println(hashtag.get(i));
//	      }
//	      log.info(hashtag);
//	      model.addAttribute("hashtag", hashtag);
	      
	      
	      return map;
	      
	      
	   }
	// MainHome
	@RequestMapping(value = "/MainHome2", method = RequestMethod.GET)
	public String MainHome(Model model) {
		logger.info("connected MainHome2.");
		return "MainHome2";
	}
	
	// Home
	@RequestMapping(value = "/Home", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("connected Home.");
		return "ajax/Home";
	}
	

	//Reservation
//	@RequestMapping(value = "/Reservation", method = RequestMethod.GET)
//	public String services(Model model) {
//		logger.info("connected Reservation.");
//		return "ajax/Reservation";
//	}

	//Services
	@RequestMapping(value = "/Services", method = RequestMethod.GET)
	public String Services(Model model) {
		logger.info("connected Services.");
		return "ajax/Services";
	}

	
	@RequestMapping(value = "/user/MyPage", method = RequestMethod.GET)
	public String mypage(Model model) {
		logger.info("connected mypage.");
		return "ajax/Pages/MyPage";
	}


	@RequestMapping(value = "/naverMap")
	public String naverMap() {
		
		return "naverMap";
	}
  

  

	/*
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String mylogin(Model model) {
		logger.info("connected Login.");
		return "ajax/Login";
	}
	*/
	
	
	/*
	 * @RequestMapping(value="/UserList", method=RequestMethod.GET) public String
	 * UserList(Model model) { logger.info("connected UserList."); return
	 * "ajax/User/UserList"; }
	 */
	
	
	
	
	
}
