package com.seven.sins.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.alert.service.AlsertServceinter;
import com.seven.sins.alert.service.AlsertService;
import com.seven.sins.alert.vo.AlertVO;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.service.MypageService;

@Controller
public class AlertController {

	@Autowired
	private AlsertServceinter alertservice;
	
	@Autowired
	private MypageService mypageService;
	
	//기본 리스트 
	@RequestMapping("alertlist.j")
	public ModelAndView alertList(@SessionAttribute MemberVO loginUser,ModelAndView mv){
		int start = 1;
		int limit = 10;
		List<AlertVO> list = alertservice.getAlertList(loginUser.getUserId(), start, limit);
		
		int count = alertservice.getAllcount(loginUser.getUserId());

		mv.setViewName("alert/alertlist");
		mv.addObject("list", list);
		mv.addObject("limit", limit);
		mv.addObject("count",count);
		return mv;
	}
	//리스트 추가 에이작스
	@RequestMapping("alertlistajax.j")
	@ResponseBody
	public List<AlertVO> alertListAjax(@SessionAttribute MemberVO loginUser, @RequestParam int limit){
		int start = limit+1;
		
		System.out.println(start+"," + limit);
		List<AlertVO> list = alertservice.getAlertList(loginUser.getUserId(), start, limit);
		System.out.println(list.size());
		for(int i = 0 ; i<list.size();i++){
			System.out.println(list.get(i).getSend_id());
		}
		return list;
	}
	
	//알람 클릭시 컨트롤러
	@RequestMapping("alertdelet.j")
	public ModelAndView alertDelete(AlertVO alvo,String userid, ModelAndView mv){
		
		int resut = alertservice.alertDelete(alvo);
		mv.setViewName("forward:mypage2.b");
		return mv;
	}
	//알람 탑
	@RequestMapping("alertlistajaxtop.j")
	@ResponseBody
	public List<AlertVO> alertListAjaxTop(@SessionAttribute MemberVO loginUser){
		List<AlertVO> list =alertservice.alertListAjaxTop(loginUser.getUserId());
		return list;
	}
	
}
