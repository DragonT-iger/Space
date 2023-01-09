package com.project.space;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {
	
	
	@RequestMapping(value="/admin/AdminPage", method=RequestMethod.GET)
	public String AdminPage(Model model) {
		log.info("connected AdminPage.");
		return "ajax/AdminPage/AdminHomePage";
	}
	@GetMapping("admin/adminpage")
	public String adminPage() {
	      
		return "ajax/AdminPage/AdminNav";
	}
	@GetMapping("admin/userlist")
	public String userList() {
	      
		return "ajax/AdminPage/UserList";
	}
	@GetMapping("admin/userbooking")
	public String userBooking() {
	      
		return "ajax/AdminPage/UserBooking";
	}
	@GetMapping("admin/hostlist")
	public String hostList() {
	      
		return "ajax/AdminPage/HostList";
	}
	@GetMapping("admin/hostupload")
	public String hostUpload() {
	      
		return "ajax/AdminPage/HostUpload";
	}
}
