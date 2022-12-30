package com.project.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class GonTestCont {
	
	@GetMapping("/MyZimm")
	public String zimmList() {
		return "ajax/ilgon/MyZimm";
	}
	@GetMapping("/MyReviewList")
	public String myReviewList() {
		
		return "ajax/ilgon/MyReviewList";
	}
	@GetMapping("/MyReservationCheck")
	public String myReservationCheck() {
		return "ajax/OwnerPage/MyReservationCheck";
	}
	@GetMapping("/MySpaceEdit")
	public String mySpaceEdit() {
		
		return "ajax/OwnerPage/MySpaceEdit";
	}
	@GetMapping("/MySpaceInsert")
	public String mySpaceInsert() {
		
		return "ajax/OwnerPage/MySpaceInsert";
	}
	@GetMapping("/MySpaceList")
	public String mySpaceList() {
		
		return "ajax/OwnerPage/MySpaceList";
	}
}
