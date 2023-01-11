package com.project.space;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.project.interceptor.CommonUtil;
import com.project.space.domain.Heart_LikeVO;
import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NaverLoginCallbackVO;
import com.project.space.domain.NaverLoginVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.Space_Like;
import com.project.space.spaceinfo.service.SpaceInfoService;
import com.project.space.user.naverlogintest.bo.NaverLoginBO;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;
@Controller
@Log4j
public class GonTestCont {
	
	@Inject
	private NaverLoginBO naverLoginBO;
	
	@Inject
	private Mem_InfoService memberService;
	
	@Inject
	private SpaceInfoService spaceinfoService;
	
	@Inject
	private CommonUtil util;
	
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
	
	
	@GetMapping("/user/MyReviewList")
	public String myReviewList() {
		
		return "ajax/ilgon/MyReviewList";
	}
	@GetMapping("/user/MyModify")
	public String mymodify() {
		return "ajax/Pages/MyModify";
	}
	/* ----등록유저------ */
	@GetMapping("/owner/MyReservationCheck")
	public String myReservationCheck() {
		return "ajax/OwnerPage/MyReservationCheck";
	}
	@GetMapping("/owner/MySpaceEdit")
	public String mySpaceEdit() {
		
		return "ajax/OwnerPage/MySpaceEdit";
	}
	
	/*네로아 테스트*/
	//네로아 인증요청 url 반환
	@GetMapping("/Login")
	public ModelAndView naverLogin(HttpSession session) {
		log.info("NaverLogin connect");
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        log.info("naverAuthUrl===>"+naverAuthUrl);
        // 생성한 인증 url을 ajax/Login 뷰로 전달
        return new ModelAndView("ajax/Login", "url", naverAuthUrl);
	}
	@GetMapping("/NaverCallback")
	public ModelAndView naverCallback(HttpSession session,@RequestParam String code, @RequestParam String state) throws Exception{
		log.info("NaverCallback connect");
		log.info("NaverCallback code ==>"+code);
		log.info("NaverCallback state ==>"+state);
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//발급받은 토큰 세션저장 테스트
		session.setAttribute("naver_oauthToken", oauthToken);
		//---------------------
		String naverProfileInfo = naverLoginBO.getUserProfile(oauthToken);
		log.info("check naverCallback try");
		
		/*json문자열 gson을 이용해서 vo객체생성*/
		Gson gson = new Gson();
		//callback 요청값으로 받아온 naverProfileInfo json문자열을 VO객체로 파싱
		NaverLoginCallbackVO nlcVO = gson.fromJson(naverProfileInfo, NaverLoginCallbackVO.class);
		//log.info(nlcVO.getMessage());
		//NaverLoginCallbackVO 안에 response에 네이버 프로필정보를 nlVO 에담아줌 (굳이할필욘없음 애초에 NaverLoginVO 타입으로 받음) 
		NaverLoginVO nlVO = nlcVO.getResponse();
		log.info("네이버 로그인 API 프로필정보 ===> "+nlVO);
		
		int result = memberService.idCheck(nlVO.getId());
		if(result>0) {
			Mem_InfoVO memInfoVO = memberService.getUser(nlVO.getId());
			log.info("id일치"+memInfoVO.getUserid()+"////"+memInfoVO);
			session.setAttribute("loginUser", memInfoVO);
			session.setAttribute("snsLoginState", true);
			return new ModelAndView("redirect:/");
		}else{
			//회원가입을위해 Naver Profile 정보를 넘겨준다.
			return new ModelAndView("ajax/NaverCallback","result",nlVO);
		}
		//return new ModelAndView("ajax/NaverCallback", "result", nlVO);
	}
	//로그아웃or회원탈퇴시 access_token 삭제처리
	//밑에 코드가 안되는 이유 => 토큰발급받을때 code값은 1회용 근데 code값을 재사용해서 토큰발급을 받지못함
	//https://developers.naver.com/forum/posts/8844 <<참고링크
	/*
	@GetMapping("/NaverDelete")
	public String naverDelete(HttpSession session,@RequestParam String code, @RequestParam String state) throws Exception{
		log.info("test");
		log.info("NaverDelete state값 ==>"+state);
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String deleteTokenUrl = naverLoginBO.NaverDeleteToken(oauthToken);
		URL obj = new URL(deleteTokenUrl); // 호출할 url
        HttpURLConnection con = (HttpURLConnection)obj.openConnection();
        con.setRequestMethod("GET");
		
		session.invalidate();
		return "ajax/Pages/MyPage";
	}
	*/
	@GetMapping("/NaverDelete")
	public String naverDelete(HttpSession session) throws Exception{
		OAuth2AccessToken ReadSessionToken = (OAuth2AccessToken) session.getAttribute("naver_oauthToken");
		//log.info("NaverDelete // access_token ===>"+ReadSessionToken.getParameter("access_token"));
		log.info(ReadSessionToken.getAccessToken());
		String deleteTokenUrl = naverLoginBO.NaverDeleteToken(ReadSessionToken.getAccessToken());
		log.info("deleteTokenUrl====>"+deleteTokenUrl);
		URL obj = new URL(deleteTokenUrl); // 호출할 url
        HttpURLConnection con = (HttpURLConnection)obj.openConnection();
        con.setRequestMethod("GET");
        con.connect();
		log.info(con.getResponseCode());
		session.invalidate();
		return "redirect:/";
	}
	@PostMapping("/NaverJoin")
	public String memberInfoAdd(Model m , @ModelAttribute Mem_InfoVO vo) {
		log.info("NaverJoin post value VO===>"+vo);
		m.addAttribute("MemInfo",vo);
		m.addAttribute("flag","NAVER");
		return "ajax/ilgon/NaverJoin";
	}
	@PostMapping("/Join")
	public String joinEnd(Model m, @ModelAttribute Mem_InfoVO vo) {
		log.info("join === user :"+vo);
		if(vo.getMname()==null||vo.getUserid()==null||vo.getMpwd()==null||
				vo.getMname().trim().isEmpty()||vo.getUserid().trim().isEmpty()
				||vo.getMpwd().trim().isEmpty()) {
			return "redirect:ajax/ilgon/NaverJoin";
		}
		
		int n=memberService.createUser(vo);
		//성공하면 home 실패시 뒤로가기
		String loc=(n>0)?"redirect:/":"redirect:ajax/ilgon/NaverJoin";
		
		return loc;
	}//----------------
	
	//비동기처리 테스트 코드
	/*
	@PostMapping("/NaverJoin2")
	public String memberInfoAdd2(Model m , @ModelAttribute Mem_InfoVO vo ,RedirectAttributes r) {
		log.info("NaverJoin post value VO===>"+vo);
		r.addFlashAttribute("flag", "naver");
		r.addFlashAttribute("userid",vo.getUserid());
		r.addFlashAttribute("mname",vo.getMname());
		r.addFlashAttribute("birth",vo.getBirth());
		r.addFlashAttribute("hp",vo.getHp());
		return "redirect:/";
	}
	@GetMapping("/NaverJoinTest")
	public String naverJointest() {
		return "ajax/ilgon/NaverJoinTest";
	}
	*/
	//-------------------------
}
