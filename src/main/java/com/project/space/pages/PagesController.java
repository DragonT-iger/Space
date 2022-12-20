package com.project.space.pages;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PagesController {
//	@GetMapping("/MyPage")
//	public String myPage() {
//		log.info("mypage connect");
//		return "ajax/Pages/MyPage";
//	}
//	@GetMapping("/MyReservation")
//	public String myreservation() {
//		log.info("connected myreservation.");
//		return "ajax/Pages/MyReservation";
//	}
	@GetMapping("/MyModify")
	public String myModify() { 
		log.info("mypage connect");
		return "ajax/Pages/MyModify";
	}
}
