package com.project.space;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.space.admin.service.AdminGraphDataVO;
import com.project.space.admin.service.AdminMemberHistoryVO;
import com.project.space.admin.service.AdminMemberInquiryVO;
import com.project.space.admin.service.AdminService;
import com.project.space.admin.service.AdminSpaceInquiryVO;
import com.project.space.domain.HashtagVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService adminservice;
	
	@RequestMapping(value="/AdminHome", method=RequestMethod.GET)
	public String AdminPage(Model model) {
		
		return "ajax/AdminPage/AdminHomePage";
	}
	@GetMapping("/adminNav")
	public String adminPage() {
	      
		return "ajax/AdminPage/AdminNav";
	}
	
	@GetMapping("/userbookingform")
	public String userBooking() {
	      
		return "ajax/AdminPage/UserBooking";
	}
	@GetMapping("/hostlistform")
	public String hostList() {
	
		return "ajax/AdminPage/HostList";
	}
	//=============홈화면 ajax======================
	@GetMapping(value="/getTodayData", produces = "application/json")
	@ResponseBody
	public Map<String,Object> getTodayData(){
		LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
        String nowDate = now.format(formatter);
		log.info(nowDate);
		
		Map<String,Object> map = new HashMap<>();
		map.put("todayJoinMem", adminservice.todayJoinMember(nowDate));
		map.put("todayInsSpace", adminservice.todayInsertSpace(nowDate));
		map.put("todayPopSpace", adminservice.todayPopSpace(nowDate));
		log.info("todayJoinMember"+adminservice.todayJoinMember(nowDate));
		log.info("todayInsertSpace"+adminservice.todayInsertSpace(nowDate));
		log.info("todayPopSpace"+adminservice.todayPopSpace(nowDate));
		
		return map;
	}
	
	//날짜별 그래프에 필요한 데이터 받아오는 컨트롤러
	@GetMapping(value="/databydate" , produces = "application/json")
	@ResponseBody
	public List<Object> databydate(@RequestParam String data){
		List<Object> result = new ArrayList<>();
		List<AdminGraphDataVO> map = adminservice.DatabyDate(data);
		log.info("DatabyDate==>"+map);
		
		for(int i =0;i<map.size();i++) {
		Map<String,Object> elements = new HashMap<>();
		String[] newDate = null;
		try {
			newDate = map.get(i).getMsearchdate().split("/");
		}catch (NullPointerException e){
			log.info("npe발생!!");
			newDate = map.get(i).getRsearchdate().split("/");
		}
		log.info(newDate[0]+"/"+newDate[1]+"/"+newDate[2]);
		elements.put("year", newDate[0]);
		elements.put("month", newDate[1]);
		elements.put("day", newDate[2]);
		
		/*
		String joincount = map.get(i).getJoincount();
		elements.put("joincount", Integer.parseInt(joincount));
		*/
		String rescount = map.get(i).getRescount();
		elements.put("rescount", Integer.parseInt(rescount));
		
	
		result.add(elements);
		log.info("list add!!");
		}
		log.info(result);
		return result;
	}
	//해시태그별 예약횟수 조회
	@GetMapping(value = "databyHashTag" , produces = "application/json")
	@ResponseBody
	public List<Object> databyHashTag(){
		List<Object> result = new ArrayList<>();
		List<AdminGraphDataVO> map = adminservice.DataByHashTag();
		
		for(int i = 0 ; i<map.size(); i++) {
			Map<String,Object> elements = new HashMap<>();
			elements.put("hashTagName", map.get(i).getH_name());
			elements.put("rescount", Integer.parseInt(map.get(i).getRescount()));
			
			result.add(elements);
		}
		log.info("result==>"+result);
		log.info("hashname==>"+result.get(0));
		log.info("rescount==>"+result.get(1));
		return result;
	}
	
	//===================유저 조회========================
	@GetMapping("/userlistform")
	public String userList() {
	      
		return "ajax/AdminPage/UserList";
	}
	
	@PostMapping(value="/userlist" , produces = "application/json")
	@ResponseBody
	public List<AdminMemberInquiryVO> getUserList(Model m){
		List<AdminMemberInquiryVO> memArr = adminservice.listUser(null);
		log.info("getUserList userArr====>"+memArr);
		return memArr;
	}
	@PostMapping(value="/searchUser" , produces = "application/json")
	@ResponseBody
	public List<AdminMemberInquiryVO> getSearchUser(@RequestBody Map<String,String> filter){
		//log.info("test");
		//log.info(filter.get("keyword"));
		//log.info(filter.get("maxFmage"));
		//log.info(filter);
		List<AdminMemberInquiryVO> memArr = adminservice.searchUserByFilter(filter);
		//log.info(memArr);
		return memArr;
	}
	@GetMapping(value="/UserHistroyCheck" ,produces = "application/json")
	@ResponseBody
	public Map<String,Object> UserHistroyCheck(@RequestParam String userid){
		Map<String,Object> map = new HashMap<>();
		List<AdminMemberHistoryVO> historylist = adminservice.getUserHistory(userid);
		int sumtotal =0;
		for(int i =0; i<historylist.size();i++) {
			sumtotal += Integer.parseInt(historylist.get(i).getSumtp());//총사용금액
		}
		log.info("sumtotal 총사용금액은??===>"+sumtotal);
		map.put("historylist", historylist);
		map.put("sumtotal", sumtotal);
		return map;
	}
	
	
	
	
	
	
	//===============공간등록내역조회============================
	@GetMapping("/spacelistform")
	public String hostUpload(Model m) {
		List<HashtagVO> hashtag = adminservice.getHashTagAll();
		log.info(hashtag);
		List<String> spaceaddr = adminservice.getSpaceAddr();
		log.info(spaceaddr);
		
		m.addAttribute("spaceaddr",spaceaddr);
		m.addAttribute("hashtag",hashtag);
		//페이징 이동
		return "ajax/AdminPage/SpaceList";
	}
	@PostMapping(value="/spacelist" , produces = "application/json")
	@ResponseBody
	public List<AdminSpaceInquiryVO> getSpaceList(Model m){
		List<AdminSpaceInquiryVO> spaceArr = adminservice.listSpace(null);
		log.info("getUserList userArr====>"+spaceArr);
		return spaceArr;
	}
	@PostMapping(value="/searchSpace" , produces = "application/json")
	@ResponseBody
	public List<AdminSpaceInquiryVO> getsearchSpace(@RequestBody Map<String,String> filter){
		
		List<AdminSpaceInquiryVO> spaceArr = adminservice.searchSpaceByFilter(filter);
		log.info("memArr==>"+spaceArr);
		return spaceArr;
	}
	
}
