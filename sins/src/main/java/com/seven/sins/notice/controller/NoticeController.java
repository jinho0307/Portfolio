package com.seven.sins.notice.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.notice.service.NoticeService;
import com.seven.sins.notice.vo.NoticeVO;


@Controller
public class NoticeController {
	
	@Value("#{dir['dir.url']}")
	private String dir;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("selectNotice.k")
	public ModelAndView selectNotice(ModelAndView mv, String page){
		int currentPage = 1;
		int listLimit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = noticeService.getListCount();
		
		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);

		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		
		List<NoticeVO> list = noticeService.selectNotice(currentPage, listLimit);
		
		mv.addObject("list", list);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.setViewName("notice/NoticeMain");
		
		return mv;
	}
	

	@RequestMapping("noticeDetail.k")
	public ModelAndView noticeDetail(ModelAndView mv, @RequestParam("noticeNo") String no) {

	
			int nNo = Integer.parseInt(no);

			noticeService.increaseCount(nNo);
			NoticeVO notice = noticeService.getNotice(nNo);

			mv.addObject("notice", notice);

			mv.setViewName("notice/NoticeDetail");

		

		return mv;
	}
	
	
	@RequestMapping("noticeDelete.k")
	public ModelAndView noticeDelete(ModelAndView mv, @RequestParam("noticeNo") int no){
		
		noticeService.noticeDelete(no);
		
		
		mv.setViewName("forward:selectNotice.k");
		
		
		return mv;
	}
	
	
	@RequestMapping("noticeModify.k")
	public ModelAndView noticeModify(ModelAndView mv, @RequestParam("noticeNo") int no){
		
		
		
		
		NoticeVO notice = noticeService.getNotice(no);

		mv.addObject("notice", notice);

		mv.setViewName("notice/NoticeModify");
		
		return mv;
	}
	
	@RequestMapping("noticeUpdate.k")
	public ModelAndView noticeUpdate(ModelAndView mv, NoticeVO notice, @RequestParam("noticeNo") int no,
			@RequestParam("title") String title, @RequestParam("content") String content){
		
		
		notice.setNoticeNo(no);
		notice.setTitle(title);
		notice.setContent(content);
		
		
		
		noticeService.noticeUpdate(notice);

		

		mv.setViewName("forward:selectNotice.k");
		
		return mv;
	}
	
	@RequestMapping("noticeWrite.k")
	public ModelAndView noticeWrite(ModelAndView mv, NoticeVO notice, @RequestParam("title") String title, 
			@RequestParam("content") String content){
		
		notice.setTitle(title);
		notice.setContent(content);
		
		noticeService.noticeWrite(notice);
		
		mv.setViewName("forward:selectNotice.k");
		return mv;
	}
	
}