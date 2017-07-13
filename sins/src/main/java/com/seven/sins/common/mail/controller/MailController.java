package com.seven.sins.common.mail.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.sins.common.mail.Email;
import com.seven.sins.common.mail.EmailSender;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;

@Controller
public class MailController {
	
		@Autowired
		private EmailSender emailSender;
		@Autowired
		private Email email;
		@Autowired
		private MemberService memberService;
		
		
		public String RandomNum(){
    		StringBuffer sb = new StringBuffer();
    		for(int i = 0; i < 7; i++){
    			int n = (int)(Math.random() * 10);
    			sb.append(n);
    		}
    		return sb.toString();
    	}
		
	    @RequestMapping("findPwd.m")
	    public String sendEmailAction (String userid, MemberVO m, Model mo ) throws Exception{
	    	
	    	String rePwd = RandomNum();
	    	
	    	m.setUserId(userid);
	    	m.setUserPwd(rePwd);
	    	
	    	int a = memberService.findPw(m);
	
			String result ="";
			
	        if(a > 0) {
	            email.setContent("비밀번호는 "+rePwd+" 입니다.");
	            email.setReceiver(userid);
	            email.setSubject(userid+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            
	            mo.addAttribute(email);	          
	          
	            result="email/emailSend";
	        } else {
	        	result="email/emailFail";
	        }
			return result;
	    }
	    /*@Resource MappingJacksonJsonView ajaxMainView;*/
	    @RequestMapping("idCheck.m")
	    @ResponseBody
	    public String idCheck(MemberVO vo) throws Exception{
	    	
	    	int idCheck = memberService.idCheck(vo);
	    	
	    	String idc = String.valueOf(idCheck);
	    	
	    	if(idc.equals("0")){
	    		idc = RandomNum();
	    		email.setContent("인증번호는 "+idc+" 입니다.");
	            email.setReceiver(vo.getUserId());
	            email.setSubject(vo.getUserId()+"님 인증번호 확인 메일입니다.");
	            emailSender.SendEmail(email);
	    	}
	    		    	
	    	return idc;
	    }
	
}
