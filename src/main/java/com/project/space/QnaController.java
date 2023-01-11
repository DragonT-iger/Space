package com.project.space;

import java.util.List;

import javax.inject.Inject;
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

import com.project.interceptor.CommonUtil;
import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.qna.service.QnaService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/spaceDetail")
@Log4j
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	@Inject
	private CommonUtil util;
	
	@GetMapping("/qnalist")
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
		int totalCount=this.qnaService.getQnaCount(page);  
		page.setTotalCount(totalCount); //총 게시글 수 넘겨주기
		
		page.setPagingBlock(5);  //페이징 블럭 단위값
		/////////////////
		page.init(ses);  //페이징 관련 연산 수행하는 메서드 호출 
		/////////////////
		log.info("2. page: "+page);
		
		m.addAttribute("paging",page);
		//2. 게시글 목록 가져오기 & 검색한 게시글 목록 가져오기
		List<Qna_BoardVO> qnaArr=this.qnaService.listQnaPaging(page);
		m.addAttribute("qnaArr", qnaArr);
		
		//3. 페이지 네비게이션 문자열 받아오기
		String loc="space/spaceDetail";
		String pageNavi=page.getPageNavi(myctx,loc,userAgent);
		
		
		m.addAttribute("pageNavi",pageNavi);
		
		return "ajax/spaceDetail/QnaSpace";
	}
	
	@PostMapping("/qnawrite")
	public String qnaForm() {
		return "ajax/spaceDetail/qnaWrite";
	}
	
	@PostMapping("/qnawriteEnd")
	public String qnaInsert(Model m, HttpServletRequest req, @ModelAttribute Qna_BoardVO qna) {
		HttpSession ses=req.getSession();
		int snum=(int)ses.getAttribute("snum");
		log.info(snum);
		
		//유효성 체크 (subject, name, passwd) ==> redirect "write"
		if(qna.getQtitle()==null || qna.getQcontent()==null || qna.getQpwd()==null ||
				qna.getQtitle().trim().isEmpty() || qna.getQcontent().trim().isEmpty() ||
				qna.getQpwd().trim().isEmpty()) {
			return "redirect:qnalist";
		}
		log.info("qna>>>>>"+qna);
		
		int n=0;
		String str="",loc="";
		if("write".equals(qna.getMode())) {  //글쓰기 모드라면
			n=qnaService.addQna(qna);
			str="글쓰기 ";
		}else if("rewrite".equals(qna.getMode())) {  //답변 글쓰기 모드라면
			n=qnaService.rewriteQna(qna);
			str="답변글쓰기 ";
		}else if("edit".equals(qna.getMode())) {  //글 수정이라면
			n=qnaService.updateQna(qna);
			str="글수정 ";
		}
		
		str+=(n>0)? "성공":"실패";
		loc=(n>0)? "/space/spaceDetail?snum="+snum:"/space/spaceDetail?snum="+snum;
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";  
	}
	
	@PostMapping("/qnadelete")
	public int qnaDelete(Model m, HttpServletRequest req, 
			@RequestParam(defaultValue="0") int qnum, @RequestParam(defaultValue="") String qpwd) {
		log.info("num: "+qnum+", passwd: "+qpwd);
		
		if(qnum==0 || qpwd.isEmpty()) {
			return 0;
		}
		//db에서 글 삭제 처리
		int n=this.qnaService.deleteQna(qnum);
		
		return n;
	}
	
	@PostMapping("/qnaedit")
	public String qnaEditform(Model m,
			@RequestParam(defaultValue="0") int qnum, @RequestParam(defaultValue="") String qpwd) {

		if(qnum==0 || qpwd==null || qpwd.trim().isEmpty()) {
			return "redirect:qnalist";
		}

		Qna_BoardVO qvo=this.qnaService.getQna(qnum);
		if(qvo==null) {
			return util.addMsgBack(m, "존재하지 않는 글입니다");
		}

		if(!qvo.getQpwd().equals(qpwd)) {  //일치하지 않는다면
			return util.addMsgBack(m, "비밀번호가 일치하지 않습니다");
		}
		//4. model에 해당 글 저장 board		
		m.addAttribute("qvo", qvo);
		
		return "ajax/spaceDetail/spaceD";
	}
	
	@PostMapping("/qnarewrite")
	public String boardRewrite(Model m, @ModelAttribute Qna_BoardVO qvo) {
		log.info("vo: "+qvo);
		m.addAttribute("qnum", qvo.getQnum());
		m.addAttribute("qtitle", qvo.getQtitle());
		return "ajax/spaceDetail/spaceD";
	}
	
}
