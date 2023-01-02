package com.project.space;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.NotUserException;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
	private Mem_InfoService memberService;
	
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
	@RequestMapping(value="/deleteUser", method = RequestMethod.POST)
	public String deleteUser(Mem_InfoVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		Mem_InfoVO user = (Mem_InfoVO) session.getAttribute("loginUser");
		log.info("user ****************************"+user);
		// 세션에있는 비밀번호
		String sessionPass = user.getMpwd();
		vo.setUserid(user.getUserid()); //vo에 아이디 넣기
		
		// vo로 들어오는 비밀번호
		String voPass = vo.getMpwd();
		
		if(!(sessionPass.equals(voPass))) {
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
	
}

