package com.seven.sins.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commoncontroller {

	private static Logger logger = LoggerFactory.getLogger("sinsLog");
	
	//단순 a링크
	@RequestMapping("alink.do")
	public String alink(String path){
		return path;
	}
}
