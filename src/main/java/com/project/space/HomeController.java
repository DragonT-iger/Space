package com.project.space;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test1(Model model) {
		return "NewFile";
	}
	// MainHome
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Mainhome(Model model) {
		logger.info("connected Mainhome2.");
		return "MainHome2";
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

	//Contact
	@RequestMapping(value = "/Contact", method = RequestMethod.GET)
	public String contact(Model model) {
		logger.info("connected contact.");
		return "ajax/Contact";
	}

	
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public String mypage(Model model) {
		logger.info("connected mypage.");
		return "ajax/Pages/MyPage";
	}

	//MyReservation mapping 안됐음
	@RequestMapping(value = "/MyReservation", method = RequestMethod.GET)
	public String myreservation(Model model) {
		logger.info("connected myreservation.");
		return "ajax/Pages/MyReservation";
	}
	
	
	@RequestMapping(value = "/naverMap")
	public String naverMap() {
		
		return "naverMap";
	}
  

  

	
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String mylogin(Model model) {
		logger.info("connected Login.");
		return "ajax/Login";
	}
	
	@RequestMapping(value="/Join", method=RequestMethod.GET)
	public String Join(Model model) {
		logger.info("connected Join.");
		return "ajax/Join";
	}
	@RequestMapping(value="/AdminPage", method=RequestMethod.GET)
	public String AdminPage(Model model) {
		logger.info("connected AdminPage.");
		return "ajax/Pages/AdminPage";
	}
	
	
	/*
	 * @RequestMapping(value="/UserList", method=RequestMethod.GET) public String
	 * UserList(Model model) { logger.info("connected UserList."); return
	 * "ajax/User/UserList"; }
	 */
	
	@GetMapping("/adminpage")
	public String adminPage() {
	      
		return "ajax/AdminPage2";
	}
	  
	@GetMapping("/userlist")
	public String userList() {
	      
		return "ajax/User/UserList";
	}
	@GetMapping("/userbooking")
	public String userBooking() {
	      
		return "ajax/User/UserBooking";
	}
	@GetMapping("/hostlist")
	public String hostList() {
	      
		return "ajax/Host/HostList";
	}
	@GetMapping("/hostupload")
	public String hostUpload() {
	      
		return "ajax/Host/HostUpload";
	}
	
	
	
}
