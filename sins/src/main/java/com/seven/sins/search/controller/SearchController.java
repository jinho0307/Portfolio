package com.seven.sins.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.search.service.SearchService;
import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchGroupVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("totalSearch.n")
	public @ResponseBody Map<String, ArrayList> totalSearch(@RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser){
		
		
		
		String userId=loginUser.getUserId();
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		
		ArrayList<SearchMemberVO> mlist= searchService.getMember(userId, word, 0, 5);
		
		ArrayList<SearchChannelVO> clist=searchService.getChannel(userId, word, 0, 5); 

		ArrayList<SearchGroupVO> glist=searchService.getGroup(userId, word, 0, 5);
		
		map.put("mlist", mlist);
		map.put("clist", clist);
		map.put("glist", glist);
		
		return map;
		
	}
	
	
	@RequestMapping("searchMember.n")
	public ModelAndView searchMember(ModelAndView mv, @RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser){
		
		String userId=loginUser.getUserId();
		
		ArrayList<SearchMemberVO> mlist= searchService.getMember(userId, word, 0, 10);
		
		mv.addObject("mlist", mlist);
		mv.addObject("word", word);
		mv.setViewName("search/MemberMore");
		
		
		return mv;
		
	}
	
	@RequestMapping("searchChannel.n")
	public ModelAndView searchChannel(ModelAndView mv, @RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser){
		
		String userId=loginUser.getUserId();
		
		ArrayList<SearchChannelVO> clist= searchService.getChannel(userId, word, 0, 10);

		mv.addObject("word", word);
		mv.addObject("clist", clist);
		mv.setViewName("search/ChannelMore");
		
		
		return mv;
		
	}
	
	@RequestMapping("searchGroup.n")
	public ModelAndView searchGroup(ModelAndView mv, @RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser){
		
		String userId=loginUser.getUserId();
		
		
		ArrayList<SearchGroupVO> glist= searchService.getGroup(userId, word, 0, 10);

		mv.addObject("glist", glist);
		mv.addObject("word", word);
		mv.setViewName("search/GroupMore");
		
		
		return mv;
		
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("appendMember.n")
	public @ResponseBody Map<String, ArrayList> appendMember(@RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser,
			@RequestParam("page") int page){
		
		
		
		String userId=loginUser.getUserId();
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		
		ArrayList<SearchMemberVO> mlist= searchService.getMember(userId, word, page, 5);
		
		
		map.put("mlist", mlist);
		
		
		return map;
		
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("appendChannel.n")
	public @ResponseBody Map<String, ArrayList> appendChannel(@RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser,
			@RequestParam("page") int page){
		
		
		
		String userId=loginUser.getUserId();
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		
		ArrayList<SearchChannelVO> clist= searchService.getChannel(userId, word, page, 5);
		
		
		map.put("clist", clist);
		
		
		return map;
		
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("appendGroup.n")
	public @ResponseBody Map<String, ArrayList> appendGroup(@RequestParam("word") String word,
			@SessionAttribute(value="loginUser", required=false) MemberVO loginUser,
			@RequestParam("page") int page){
		
		
		
		String userId=loginUser.getUserId();
		
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		
		ArrayList<SearchGroupVO> glist= searchService.getGroup(userId, word, page, 5);
		
		
		map.put("glist", glist);
		
		
		return map;
		
	}
}
