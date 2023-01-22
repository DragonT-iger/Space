package com.project.space.user.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project.space.domain.Mem_InfoVO;

import lombok.extern.log4j.Log4j;

/* Interceptor
 *  - 컨트롤러가 실행되기 전에 사전 처리할 일이 있으면 
 *    스프링에서는 인터셉터에서 구현한다.
 *  - 구현 방법
 *  1. 인터셉터 구현
 *     [1] HandlerInterceptor인터페이스를 상속받는 방법
 *     [2] HandlerInterceptorAdapter 추상클래스를 상속받는 방법
 *      
 *  2. 인터셉터 등록 => servlet-context.xml에서 등록하고 매핑 정보를 설정
 *  <!-- Interceptor설정 =========================================================== -->
   <interceptors>
         <interceptor>
            <mapping path="/user/**"/>
            <mapping path="/admin/**"/>
            <beans:bean class="com.common.interceptor.LoginCheckInterceptor"/>
         </interceptor>
   </interceptors>
 * */

@Log4j
public class LoginCheckInterceptor implements HandlerInterceptor{
	
	//[1] Controller를 실행하기 전에 호출되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest req,HttpServletResponse res,Object handler) throws Exception{
		log.info("preHandle()");
		
		String header=req.getHeader("Ajax");
		
		String mode=req.getParameter("mode");
		log.info("mode========="+mode);
		
		HttpSession ses=req.getSession();
		Mem_InfoVO user=(Mem_InfoVO)ses.getAttribute("loginUser");
		if(user==null) {
			
			if("true".equals(header)) {
				res.sendError(400);
			}else {
			
			String view="/WEB-INF/views/msg.jsp";
			
			req.setAttribute("message", "로그인해야 이용 가능합니다.");
			req.setAttribute("loc", req.getContextPath()+"/index");
			
			RequestDispatcher disp=req.getRequestDispatcher(view);
			disp.forward(req, res);
			}
			return false;
		}
		
		return true;
	}
	
	//[2] Controller를 실행한 후, 아직 뷰를 실행하기 전에 호출되는 메서드(파라미터 4개)
	@Override
	public void postHandle(HttpServletRequest req,HttpServletResponse res,Object handler,ModelAndView mv) throws Exception{
		log.info("postHandle()");
		HandlerInterceptor.super.postHandle(req,res,handler,mv);
	}
	
	//[3] Controller를 실행하고 뷰를 실행후에 호출되는 메서드
	@Override
	public void afterCompletion(HttpServletRequest req,HttpServletResponse res,Object handler,Exception ex) throws Exception{
		log.info("afterCompletion()");
		HandlerInterceptor.super.afterCompletion(req,res,handler,ex);
	}
	
}
