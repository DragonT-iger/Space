package com.project.interceptor;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.space.domain.Mem_InfoVO;

import lombok.extern.log4j.Log4j;
@Log4j
public class OwnerCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req,HttpServletResponse res,Object handler) throws Exception{
		log.info("OwnerCheck preHandle()");
		
		HttpSession ses=req.getSession();
		Mem_InfoVO user=(Mem_InfoVO)ses.getAttribute("loginUser");
		if(user!=null) {
			if(user.getStatus()!=1) {
			
				req.setAttribute("message", "등록유저만 이용 가능합니다");
				req.setAttribute("loc", req.getContextPath()+"/");
				
				RequestDispatcher disp=req.getRequestDispatcher("/WEB-INF/views/msg.jsp");
				disp.forward(req, res);
				
				return false;
			}else {
				return true;
				
			}
		}		
		return false; //로그인하지 않은 경우
	}
}
