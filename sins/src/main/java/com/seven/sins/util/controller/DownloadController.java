package com.seven.sins.util.controller;

import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
;
	@Value("#{dir['dir.url']}")
	private String dir;
	
	@RequestMapping("download.p")
	public ModelAndView download(@RequestParam("userId")String userId, 
                                  @RequestParam("fileName")String fileName, ModelAndView mv){
		
		String fullPath = dir + userId + "/" + fileName;
		
		String[] a = fileName.split("=");
		String realName = a[1];
		
		mv.addObject("file", new File(fullPath));
		mv.addObject("realName", realName);
		mv.setViewName("downloadView");
		
		return mv;
	}
	
}
