package com.project.space;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.interceptor.CommonUtil;
import com.project.space.domain.Heart_LikeVO;
import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;
=======
import org.springframework.web.bind.annotation.RequestParam;

>>>>>>> origin/SPACE-7
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.Space_Like;
import com.project.space.qna.service.QnaService;
import com.project.space.review.service.ReviewService;
import com.project.space.spaceinfo.service.SpaceInfoService;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SpacedetailController {

	@Inject
	private SpaceInfoService spaceinfoService;
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private Mem_InfoService meminfoService;

	@Inject
	private CommonUtil util;

	@GetMapping(value = "/spaceDetail")
	public String contact(Model m, @RequestParam(defaultValue = "0") int snum, HttpSession ses) {
		log.info("snum: " + snum);
		
		Space_InfoVO sdvo = this.spaceinfoService.selectBySnum(snum); //공간정보 
		
		int reviewCount=this.reviewService.getReviewCount(snum); //리뷰개수
		
		Space_InfoVO sivo=new Space_InfoVO();
		sivo.setUserid(sdvo.getUserid());
		sivo.setSnum(snum);
		List<Space_InfoVO> svoArr=this.spaceinfoService.selectBySpaceInfoExcept(sivo);
		
		Mem_InfoVO mivo=this.meminfoService.getUser(sdvo.getUserid());
		
		
		log.info(sdvo + "<<<<공간번호");
		log.info("snum: " + snum);
		
		m.addAttribute("sdvo", sdvo); //공간 정보
		m.addAttribute("rc", reviewCount); //리뷰개수
		m.addAttribute("svoArr", svoArr); //공간등록 유저가 보유한 공간 리스트
		m.addAttribute("mivo", mivo); //공간등록 유저의 정보
		
		ses.setAttribute("snum", snum);  // 세션에 snum 저장
		ses.setAttribute("sdvo", sdvo);

		return "ajax/spaceDetail/spaceD";
	}
	
	@GetMapping("/spaceDetail/spaceImage")
	public String spaceImageForm() {
		System.out.println("sdfsdfs");
		return "ajax/spaceDetail/SpaceImage";
	}
	
	@GetMapping("/spaceDetail/like")
	@ResponseBody
	public int spaceDetailLike(Model m, @RequestParam int snum, @RequestParam String userid) { 
		Heart_LikeVO hlvo=new Heart_LikeVO();
		hlvo.setSnum(snum);
		hlvo.setUserid(userid);
		log.info("hlvo: "+hlvo);
		int spaceLike=this.spaceinfoService.insertSpaceLike(hlvo);
		if(spaceLike==0) {
			System.out.println("이미 찜한 공간입니다");
		}
		
		log.info(spaceLike);
		return spaceLike;
	}


	@GetMapping("/user/MyZimm")
	public String zimmList(Model m, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		Mem_InfoVO mivo=(Mem_InfoVO)ses.getAttribute("loginUser"); //세션에 저장된 유저 정보
		
		List<Space_Like> hlArr=this.spaceinfoService.selectUserLikeSpace(mivo.getUserid());
		
		log.info("hlArr: "+hlArr);
		m.addAttribute("hlArr", hlArr);
		
		return "ajax/ilgon/MyZimm";
	}
	
	@GetMapping("/user/MyZimmdelete")
	public String zimmDelete(Model m, HttpServletRequest req, @RequestParam int hnum) {
		log.info("hnum: "+hnum);

		//db에서 글 삭제 처리
		int n=this.spaceinfoService.deleteLike(hnum);
		
		String str=(n>0)? "삭제되었습니다":"삭제 실패";
		String loc=(n>0)? "/space/user/MyZimm":"/space/user/MyZimm";
		return util.addMsgLoc(m, str, loc);
	}
	
	

}
