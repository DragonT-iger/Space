package com.project.space;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.qna.service.QnaService;
import com.project.space.review.service.ReviewService;
import com.project.space.spaceinfo.service.SpaceInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SpacedetailController {

	@Inject
	private SpaceInfoService spaceinfoService;
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private QnaService qnaService;

	@GetMapping(value = "/spaceDetail")
	public String contact(Model m, @RequestParam(defaultValue = "0") int snum, HttpSession ses) {
		log.info("snum: " + snum);
		
		Space_InfoVO sdvo = this.spaceinfoService.selectBySnum(snum);
		int reviewCount=this.reviewService.getReviewCount(snum);
		List<Space_InfoVO> svoArr=this.spaceinfoService.selectBySpaceInfo(sdvo.getUserid());
		
		
		log.info(sdvo + "<<<<공간번호");
		log.info("snum: " + snum);
		
		m.addAttribute("sdvo", sdvo);
		m.addAttribute("rc", reviewCount);
		m.addAttribute("svoArr", svoArr);
		ses.setAttribute("snum", snum);  // 세션에 snum 저장
		ses.setAttribute("sdvo", sdvo);

		return "ajax/spaceDetail/spaceD";
	}


}
