package com.project.space;

import java.io.File;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.interceptor.CommonUtil;
import com.project.space.domain.PagingVO;
import com.project.space.domain.ReviewVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.review.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/spaceDetail")
@Log4j
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private CommonUtil util;
	
	@GetMapping("/reviewlist")
	public String qnaListPaging(Model m, @ModelAttribute("page") PagingVO page, 
			HttpServletRequest req, @RequestHeader("User-Agent") String userAgent) {
		String myctx=req.getContextPath();
		HttpSession ses=req.getSession();
		Space_InfoVO svo=(Space_InfoVO)ses.getAttribute("sdvo"); //세션에 저장된 공간 정보
		log.info("sdvo: "+svo);
		int svoNum=svo.getSnum(); //공간 번호 불러오기
		page.setSnum(svoNum); //페이지에 공간 정보 넣어주기

		//1. 총 게시글 수 받아오기 & 검색한 게시글 수 가져오기
		log.info("1. page: "+page);
		int totalCount=this.reviewService.getReviewCountPaging(page);  
		page.setTotalCount(totalCount); //총 게시글 수 넘겨주기
		
		page.setPagingBlock(5);  //페이징 블럭 단위값
		/////////////////
		page.init(ses);  //페이징 관련 연산 수행하는 메서드 호출 
		/////////////////
		log.info("2. page: "+page);
		
		m.addAttribute("paging",page);
		//2. 게시글 목록 가져오기 & 검색한 게시글 목록 가져오기
		List<ReviewVO> reviewArr=this.reviewService.listReviewPaging(page);
		m.addAttribute("reviewArr", reviewArr);
		
		//3. 페이지 네비게이션 문자열 받아오기
		String loc="space/spaceDetail";
		String pageNavi=page.getPageNavi(myctx,loc,userAgent);
		
		
		m.addAttribute("pageNavi",pageNavi);
		
		return "ajax/spaceDetail/ReviewSpace";
	}
	
	@PostMapping("/reviewwrite")
	public String qnaForm() {
		return "ajax/spaceDetail/reviewWrite";
	}
	
	@PostMapping("/reviewwriteEnd")
	public String boardInsert(Model m, HttpServletRequest req, 
			@RequestParam("mfilename") MultipartFile mfilename, @ModelAttribute ReviewVO revo) {
		log.info("revo: "+revo);
		
		//1. 파일 업로드 처리
		//업로드 절대경로 얻어오기
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/review_upload");
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(!mfilename.isEmpty()) {  //첨부파일이 있다면
			//먼저 첨부파일명과 파일크기 알아내자
			String originFname=mfilename.getOriginalFilename(); //원본파일명
			long fsize=mfilename.getSize();

			//*mode가 edit(수정)이고 예전에 첨부했던 파일이 있다면 예전 파일 삭제 처리
			if(revo.getMode().equals("edit") && revo.getOld_rimage1()!=null) {
				//수정모드라면 예전에 업로드했던 파일은 삭제처리
				File delF=new File(upDir, revo.getOld_rimage1());
				if(delF.exists()) {
					boolean b=delF.delete();
					log.info("old File delete: "+b);
				}
			}
			
			//업로드 처리
			try {
				mfilename.transferTo(new File(upDir, originFname));
				log.info("upDir: "+upDir);
			}catch(Exception e) {
				log.error("review write upload error: "+e);
			}
			
			//boardVO객체에 업로드파일명,원본파일명,파일사이즈 세팅
			revo.setRimage1(originFname);
		}
		
		//2. 유효성 체크 (subject, name, passwd) ==> redirect "write"
		if(revo.getRtitle()==null || revo.getRcontent()==null || revo.getRpwd()==null ||
				revo.getRtitle().trim().isEmpty() || revo.getRcontent().trim().isEmpty() ||
				revo.getRpwd().trim().isEmpty()) {
			return "redirect:reviewlist";
		}
		//3. boardService의 insertBoard()호출
		int n=0;
		String str="",loc="";
		if("write".equals(revo.getMode())) {  //글쓰기 모드라면
			n=reviewService.addReview(revo);
			str="글쓰기 ";
		}else if("rewrite".equals(revo.getMode())) {  //답변 글쓰기 모드라면
			n=reviewService.rewriteReview(revo);
			str="답변글쓰기 ";
		}else if("edit".equals(revo.getMode())) {  //글 수정이라면
			n=reviewService.updateReview(revo);
			str="글수정 ";
		}
		
		str+=(n>0)? "성공":"실패";
		loc=(n>0)? "reviewlist":"reviewlist";

		return util.addMsgLoc(m, str, loc);  //msg를 반환
	}
	
	@PostMapping("/reviewdelete")
	public String qnaDelete(Model m, HttpServletRequest req, 
			@RequestParam(defaultValue="0") int renum, @RequestParam(defaultValue="") String repwd) {
		log.info("num: "+renum+", passwd: "+repwd);
		
		if(renum==0 || repwd.isEmpty()) {
			return "redirect:reviewlist";
		}
		
		//해당글을 db에서 가져오기
		ReviewVO revo=this.reviewService.getReview(renum);
		if(revo==null) {
			return util.addMsgBack(m, "존재하지 않는 글입니다");
		}
		//비밀번호 일치여부 체크
		String dbPwd=revo.getRpwd();
		if(!dbPwd.equals(repwd)) {  //일치하지 않는다면
			return util.addMsgBack(m, "비밀번호가 일치하지 않습니다");
		}
		//db에서 글 삭제 처리
		int n=this.reviewService.deleteReview(renum);
		
		String str=(n>0)? "삭제되었습니다":"삭제 실패";
		String loc=(n>0)? "reviewlist":"reviewlist";
		return util.addMsgLoc(m, str, loc);
	}
	
	@PostMapping("/reviewedit")
	public String qnaEditform(Model m,
			@RequestParam(defaultValue="0") int renum, @RequestParam(defaultValue="") String repwd) {

		if(renum==0 || repwd==null || repwd.trim().isEmpty()) {
			return "redirect:qnalist";
		}

		ReviewVO revo=this.reviewService.getReview(renum);
		if(revo==null) {
			return util.addMsgBack(m, "존재하지 않는 글입니다");
		}

		if(!revo.getRpwd().equals(repwd)) {  //일치하지 않는다면
			return util.addMsgBack(m, "비밀번호가 일치하지 않습니다");
		}
		//4. model에 해당 글 저장 board		
		m.addAttribute("revo", revo);
		
		return "ajax/spaceDetail/spaceD";
	}
	
	@PostMapping("/reviewrewrite")
	public String boardRewrite(Model m, @ModelAttribute ReviewVO revo) {
		log.info("vo: "+revo);
		m.addAttribute("renum", revo.getReview_num());
		m.addAttribute("rtitle", revo.getRtitle());
		return "ajax/spaceDetail/spaceD";
	}
	
}
