package com.project.space;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<AdminMemberInquiryVO> getSearchUser(@RequestBody Map<String,String> filter , HttpServletRequest req , Model m){
		//log.info("test");
		//log.info(filter.get("keyword"));
		//log.info(filter.get("maxFmage"));
		//log.info(filter);
		List<AdminMemberInquiryVO> memArr = adminservice.searchUserByFilter(filter);
		//log.info(memArr);
		return memArr;
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
	public List<AdminSpaceInquiryVO> getsearchSpace(@RequestBody Map<String,String> filter , HttpServletRequest req , Model m){
		
		List<AdminSpaceInquiryVO> spaceArr = adminservice.searchSpaceByFilter(filter);
		log.info("memArr==>"+spaceArr);
		return spaceArr;
	}
}
