package com.seven.sins.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.seven.sins.member.vo.MemberVO;


 
 
public class LogInterceptor extends HandlerInterceptorAdapter{
 
 
	public static Logger logger = LoggerFactory.getLogger("sinsLog"); 

    
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(false);
		
		MemberVO member=(MemberVO) session.getAttribute("loginUser");
		String userId=member.getUserId();
		
		
		
		String uri=request.getRequestURI();
		uri=uri.substring(6);
		
		logger.info(userId+"님이 "+uri+" 요청");
		
		
		return true;
	}
	
    
	
	

 }


