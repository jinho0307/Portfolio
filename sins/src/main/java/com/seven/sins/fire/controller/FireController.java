package com.seven.sins.fire.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.service.FireService;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

@Controller
public class FireController {
	
	@Autowired
	private FireService fireService;
	
	@RequestMapping("fireContent.k")
	@ResponseBody
	public String fireChannelContent(FireVO fire, HttpSession session){
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		fire.setFireById(loginUser.getUserId());

		String result = "";
		int doFire = fireService.doChannelContentFire(fire);
		
		result = String.valueOf(doFire);

		return result;
	}
	
	
	@RequestMapping("cancelFireContent.k")
	@ResponseBody
	public String CancelChannelContent(FireVO fire, HttpSession session){
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		fire.setFireById(loginUser.getUserId());

		String result = "";
		
		int doFire = fireService.cancelChannelContentFire(fire);
		
		result = String.valueOf(doFire);

		return result;
	}
	
	@RequestMapping("fireComment.k")
	@ResponseBody
	public String fireComment(FireVO vo, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		vo.setFireById(member.getUserId());
		String result = String.valueOf(fireService.fireComment(vo));
		
		return result;
	}
	
	@RequestMapping("fireCommentCancel.k")
	@ResponseBody
	public String fireCommentCancel(FireVO vo, HttpSession session){
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		vo.setFireById(member.getUserId());
		String result = String.valueOf(fireService.fireCommentCancel(vo));
		
		return result;
	}
	
	@RequestMapping("fireList.k")
	public ModelAndView fireList(ModelAndView mv){
		ArrayList<FireVO> fireContentList = fireService.getFireContentList();
		
		ArrayList<ChannelArticleVO> channelArticle = new ArrayList<ChannelArticleVO>();
		ArrayList<MypageVO> myPage = new ArrayList<MypageVO>();
		ArrayList<GroupWriteVO> groupWrite = new ArrayList<GroupWriteVO>();
		ArrayList<MemberVO> profile = new ArrayList<MemberVO>();
		for(int x=0;x<fireContentList.size();x++){
			if(fireContentList.get(x).getClassify().equals("CHANNEL_ARTICLE")){
				channelArticle.add(fireService.getChannelArticle(fireContentList.get(x)));
			}
			else if(fireContentList.get(x).getClassify().equals("GROUP_MAIN")){
				groupWrite.add(fireService.groupWrite(fireContentList.get(x)));
			}
			else {
				myPage.add(fireService.getMyPage(fireContentList.get(x)));
				
			}
		}
		for(ChannelArticleVO cav : channelArticle){
			profile.add(fireService.getUserProfileC(cav));
		}
		for(GroupWriteVO cav : groupWrite){
			profile.add(fireService.getUserProfileG(cav));
		}
		for(MypageVO cav : myPage){
			profile.add(fireService.getUserProfileM(cav));
		}
		
		mv.addObject("group", groupWrite);
		mv.addObject("channel", channelArticle);
		mv.addObject("mypage", myPage);
		mv.addObject("member", profile);
		mv.setViewName("admin/fireContentList");
		
		return mv;
	}
	
	
	@RequestMapping("fireCommentList.k")
	public ModelAndView fireCommentList(ModelAndView mv){
		ArrayList<FireVO> fireCommentList = fireService.getFireCommentList();
		
		
		ArrayList<ChannelCommentVO> channelArticle = new ArrayList<ChannelCommentVO>();
		ArrayList<MypageCommentVO> myPage = new ArrayList<MypageCommentVO>();
		ArrayList<GroupCommentVO> groupWrite = new ArrayList<GroupCommentVO>();
		ArrayList<MemberVO> profile = new ArrayList<MemberVO>();
		for(int x=0;x<fireCommentList.size();x++){
			if(fireCommentList.get(x).getClassify().equals("CHANNEL_COMMENT")){
				channelArticle.add(fireService.getChannelComment(fireCommentList.get(x)));
			}
			else if(fireCommentList.get(x).getClassify().equals("GROUP_COMMENT")){
				groupWrite.add(fireService.groupComment(fireCommentList.get(x)));
			}
			else {
				myPage.add(fireService.getMyPageComment(fireCommentList.get(x)));
				
			}
		}
		for(ChannelCommentVO cav : channelArticle){
			profile.add(fireService.getUserProfileCC(cav));
		}
		for(GroupCommentVO cav : groupWrite){
			profile.add(fireService.getUserProfileGC(cav));
		}
		for(MypageCommentVO cav : myPage){
			profile.add(fireService.getUserProfileMC(cav));
		}
		
		mv.addObject("group", groupWrite);
		mv.addObject("channel", channelArticle);
		mv.addObject("mypage", myPage);
		mv.addObject("member", profile);
		mv.setViewName("admin/fireCommentList");
		
		return mv;
	}
	
	@RequestMapping("contentDelete.k")
	@ResponseBody
	public String contentDelete(@RequestParam(value="classify") String classify, @RequestParam(value="no") int no){
		int res = 0;
		
		FireVO vv = new FireVO();
		vv.setFireNo(no);
		vv.setClassify(classify);
		
		fireService.fireDelete(vv);
		
		if(classify.equals("CHANNEL_ARTICLE")){
			ChannelArticleVO vo = new ChannelArticleVO();
			vo.setChan_article_no(no);
			vo.setClassify(classify);
			fireService.likeDeleteC(vo);
			res = fireService.contentDeleteC(vo);
			
		}
		else if(classify.equals("GROUP_MAIN")){
			GroupWriteVO vo = new GroupWriteVO();
			vo.setClassify(classify);
			vo.setWriteNo(no);
			fireService.likeDeleteG(vo);
			res = fireService.contentDeleteG(vo);
			
		}
		else {
			MypageVO vo = new MypageVO();
			vo.setClassify(classify);
			vo.setWriteno(no);
			fireService.likeDeleteM(vo);
			res = fireService.contentDeleteM(vo);
			
		}
		
		String result = String.valueOf(res);
		
		
		return result;
	}
	
	@RequestMapping("commentDelete.k")
	@ResponseBody
	public String commentDelete(@RequestParam(value="classify") String classify, @RequestParam(value="writeNo") int writeNo, @RequestParam(value="commentNo") int commentNo){
		int res = 0;
		
		FireVO vv = new FireVO();
		vv.setFireNo(writeNo);
		vv.setClassify(classify);
		vv.setCommentNo(commentNo);
		
		fireService.fireCommentDelete(vv);
		
		if(classify.equals("CHANNEL_ARTICLE")){
			ChannelCommentVO vo = new ChannelCommentVO();
			vo.setChan_article_no(writeNo);
			vo.setClassify(classify);
			vo.setComment_no(commentNo);
			res = fireService.commentDeleteC(vo);
			
		}
		else if(classify.equals("GROUP_MAIN")){
			GroupCommentVO vo = new GroupCommentVO();
			vo.setClassify(classify);
			vo.setWriteNo(writeNo);
			vo.setCommentNo(commentNo);
			res = fireService.commentDeleteG(vo);
			
		}
		else {
			MypageCommentVO vo = new MypageCommentVO();
			vo.setClassfy(classify);
			vo.setContentno(writeNo);
			vo.setCommentno(commentNo);
			res = fireService.commentDeleteM(vo);
			
		}
		
		String result = String.valueOf(res);
		
		
		return result;
	}
}
