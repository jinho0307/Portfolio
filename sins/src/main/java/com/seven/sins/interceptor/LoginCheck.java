package com.seven.sins.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
 
public class LoginCheck extends HandlerInterceptorAdapter{
 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session=request.getSession(false);
		if(session!=null && session.getAttribute("loginUser")!=null){
			return true;
		}
		
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return false;
	}

    
  }


