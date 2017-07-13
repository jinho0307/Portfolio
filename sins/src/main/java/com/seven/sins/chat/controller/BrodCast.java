package com.seven.sins.chat.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.sins.chat.handler.ChatHandler;

@Controller
public class BrodCast {
	//private static Map<Integer, ChatHandler> grouproom = new HashMap<Integer, ChatHandler>();
	
	private static Logger logger = LoggerFactory.getLogger("sinsLog");
	
	@RequestMapping("brodcasting.j")
	public String viewChatingPage(){
		logger.info("채팅 컨트롤러 접속완료");
		return "chat/chat";

	}
}