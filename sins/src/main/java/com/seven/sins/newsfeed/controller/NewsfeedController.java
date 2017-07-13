package com.seven.sins.newsfeed.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.service.ChannelService;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.group.service.GroupCommentService;
import com.seven.sins.group.service.GroupLikeService;
import com.seven.sins.group.service.GroupMemberService;
import com.seven.sins.group.service.GroupService;
import com.seven.sins.group.service.GroupWriteService;
import com.seven.sins.group.vo.GroupLikeVO;
import com.seven.sins.group.vo.GroupMemberVO;
import com.seven.sins.group.vo.GroupVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageLikeVO;
import com.seven.sins.mypage.vo.MypageVO;
import com.seven.sins.newsfeed.service.NewsfeedService;
import com.seven.sins.newsfeed.vo.NewsfeedVO;
import com.seven.sins.util.FileUtils;

@Controller("NewsfeedController.b")
public class NewsfeedController {
	
	private int groupNo;

	/*@Autowired
	private NewsfeedService newsfeedService;*/
	@Autowired
	private MypageService mypageService;
	@Autowired
	private NewsfeedService newsfeedService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupCommentService groupCommentService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChannelService channelservice;
	@Autowired private GroupLikeService groupLikeService;
	@Autowired private GroupWriteService groupWriteService;
	@Autowired private GroupMemberService groupMemberService;
	
	
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	
	@RequestMapping("newsfeed.b")
	public ModelAndView Newsfeed(@SessionAttribute MemberVO loginUser, ModelAndView mv,
			 MypageVO myvo, GroupWriteVO gv, ChannelArticleVO cv, MemberVO m){
		//마이페이지 부분
		MypageLikeVO mylike = new MypageLikeVO();
		mylike.setUserid(loginUser.getUserId());
		ArrayList<MypageLikeVO> likeList = mypageService.mypageLikeList(mylike);
		
		 ArrayList<MypageCommentVO> mycolist = null;
		 mycolist = mypageService.selectMypageComment(loginUser.getUserId());
		 MemberVO memberUser = loginUser;
		 
		
		mv.addObject("mycolist" , mycolist);
		mv.addObject("memberUser" , memberUser);
		mv.addObject("loginUser" , loginUser);
		mv.addObject("likeList" , likeList);
		
		
		
		ArrayList<NewsfeedVO> news = newsfeedService.selectNewsfeed(loginUser.getUserId());
		
		GroupLikeVO likevo = new GroupLikeVO();
		
		
		likevo.setUserId(loginUser.getUserId());

		//ArrayList<GroupLikeVO> likeList2 = groupLikeService.groupLikeListNewsFeed(likevo);
		
		

		/*if(likeList2 == null) { 
			GroupLikeVO dummylike = new GroupLikeVO();
			dummylike.setWriteNo(0);
			likeList2.add(dummylike);
		}
		
		mv.addObject("likeList", likeList2);*/
		
		mv.addObject("news", news);
		
		

	
		
		//채널부분
		
		
		
		mv.setViewName("common/newsfeed");
		
				return mv;
		
	}
	
	
}
