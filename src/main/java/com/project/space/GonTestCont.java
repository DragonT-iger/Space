package com.project.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class GonTestCont {
	
	@GetMapping("/ZzimList")
	public String zimmList() {
		return "ajax/ilgon/MyZimm";
	}
	@GetMapping("/ReviewList")
	public String myReviewList() {
		return "ajax/ilgon/MyReviewList";
	}
}
