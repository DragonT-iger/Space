package com.project.space;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NotUserException;
import com.project.space.user.mapper.Mem_InfoMapper;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
	private Mem_InfoService memberService;
	
	
	@Autowired
	private PasswordEncoder pwencoder; //암호화 객체
	
	@PostMapping("/login")
	public String loginProcess(HttpSession session, @ModelAttribute("user") Mem_InfoVO user) 
	throws NotUserException
	{
		log.info("user====="+user);
		if(user.getUserid().trim().isEmpty()||user.getMpwd().trim().isEmpty()) {
			return "redirect:/";
		}
		//반환타입 UserVO
		Mem_InfoVO loginUser=memberService.loginCheck(user.getUserid(), user.getMpwd());
		if(loginUser!=null) {
			//로그인 인증을 받았다면
			session.setAttribute("loginUser",loginUser);
		}
		
		return "redirect:/";
	}//----------------------------
	
	@GetMapping("/logout")
	public String logout(HttpSession session) { 
		session.invalidate(); //세션에 저장된 모든 것 삭제하는 메소드
		logger.info("logout.");
		return "redirect:/";
		
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/user/deleteUser", method = RequestMethod.POST)
	public String deleteUser(Mem_InfoVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		Mem_InfoVO user = (Mem_InfoVO) session.getAttribute("loginUser");
		log.info("user ****************************"+user);
		// 세션에있는 비밀번호
		String sessionPass = user.getMpwd();
		vo.setUserid(user.getUserid()); //vo에 아이디 넣기
		
		// vo로 들어오는 비밀번호
		String voPass = vo.getMpwd();
		log.info(vo);
		log.info("voPass===============>"+voPass);
		log.info(pwencoder.matches(voPass, sessionPass));
		if(!pwencoder.matches(voPass, sessionPass)) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/";
		}
		memberService.deleteUser(vo); 
		session.invalidate();
		return "redirect:/";
	}
	
	//예외처리하는 메서드 앞에 @ExceptionHandler를 붙이고 구체적인 예외 클래스를 지정한다
	@ExceptionHandler(NotUserException.class)
	public String exceptionHandler(Exception ex) {
		log.error(ex);
		return "ajax/errorAlert";
	}
	
	//회원가입
	@PostMapping("/join")
	public String joinEnd(Model m, @ModelAttribute("user") Mem_InfoVO user, BindingResult b) {
		b.getFieldError();
		log.info("join ===user: "+user);
		if(user.getMname()==null||user.getUserid()==null||user.getMpwd()==null||
				user.getMname().trim().isEmpty()||user.getUserid().trim().isEmpty()
				||user.getMpwd().trim().isEmpty()) {
			return "redirect:/";
		}
		int n=memberService.createUser(user);
		log.info(n);
		String str=(n>0)?"회원가입 완료":"가입 실패";
		String loc=(n>0)?"Login":"javascript:history.back()";
		
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";
	}//-----------------------------------
		
	/*아이디 중복체크 ajax처리-------------------*/
	
	 @GetMapping(value = "/idcheck",produces="application/json")
	 public @ResponseBody Map<String, String>
	 idCheck(@RequestParam("userid")String userid){ log.info("user==="+userid);
	 int isUse=memberService.idCheck(userid); 
		/* String result=(isUse)?"ok":"no"; */
	 
	 String result="";
	 if(isUse==0) {
		 result="ok";
	 }else if(isUse==1) {
		 result="no";
	 }
	 
	 Map<String, String> map=new HashMap<>(); 
	 map.put("result", result);
	 
	 return map; 
	 
	 }//--------------------------------------
	
	 //회원정보수정
	 @GetMapping("/user/MyModify")
		public String mymodify(Model m) {
			List<Mem_InfoVO> bankcode=memberService.listBankcode();
			log.info("bankcode=="+bankcode);
			m.addAttribute("bankcode", bankcode);
			return "ajax/Pages/MyModify";
		}
		
		 //회원정보수정
		 @PostMapping("/user/updateUser")
			public String updateUser(Model m, @ModelAttribute("user") Mem_InfoVO user, HttpSession ses) 
					throws NotUserException 
		 	{
			  
			 log.info("user====="+user);
			 log.info("user.getUserid()==="+user.getUserid());
				
				/*
				 * log.info("user====="+user);
				 * if(user.getUserid().trim().isEmpty()||user.getMpwd().trim().isEmpty()) {
				 * return "redirect:/"; }
				 */
				//반환타입 UserVO
				Mem_InfoVO updateUser=memberService.pwCheck(user.getUserid(), user.getMpwdcheck());
				if(updateUser!=null) {
					
				
				int n=memberService.updateUser(user);
				if(n>0) {
					Mem_InfoVO loginUser = memberService.getUser(user.getUserid());
					ses.setAttribute("loginUser", loginUser);
				}
				log.info(n);
				String str=(n>0)?"회원정보 수정 완료":"수정 실패";
				String loc=(n>0)?"/space/user/MyPage":"javascript:history.back()";
				
				log.info("update1 ===user: "+user);
				m.addAttribute("message",str);
				m.addAttribute("loc",loc);
				
				return "msg";
				}else {
					String str="수정 실패-현재 비밀번호가 일치하지 않아요";
					String loc="javascript:history.back()";
					
					log.info("update2 ===user: "+user);
					m.addAttribute("message",str);
					m.addAttribute("loc",loc);
					
					return "msg";
				}		
		 }//-------------------------------- 

	 @RequestMapping(value="/Join", method=RequestMethod.GET)
		public String Join(Model m) {
			logger.info("connected Join.");
			List<Mem_InfoVO> bankcode=memberService.listBankcode();
			//log.info("bankcode=="+bankcode);
			m.addAttribute("bankcode", bankcode);
			return "ajax/Join";
		}
}

