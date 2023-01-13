package com.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.space.domain.Mem_InfoVO;

public class HomeDivisionIntercepter extends HandlerInterceptorAdapter{
	@Override
	public void postHandle(HttpServletRequest req,HttpServletResponse res, Object handler, ModelAndView mv) 
			throws Exception
	{
		HttpSession ses=req.getSession();
		if(ses.getAttribute("loginUser")!=null) {
			Mem_InfoVO user=(Mem_InfoVO)ses.getAttribute("loginUser"); //세션키값
			if(user.getStatus()==9) { //어드민으로 로그인했을경우
				req.setAttribute("loc", req.getContextPath()+"/admin/AdminHome");
				mv.setViewName("msg");		
			}
			else if(user.getStatus()==1) {
				req.setAttribute("loc", req.getContextPath()+"/owner/MySpaceList"); // 등록유저 홈페이지로 설정
				mv.setViewName("msg");	
			}
		}
		super.postHandle(req,res,handler,mv);
		
	}
}
