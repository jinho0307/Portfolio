package com.seven.sins.channel.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.channel.service.ChannelService;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.util.FileUtils;

@Controller
public class ChannelController {

	@Autowired
	private ChannelService channelservice;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	//채널 게시물 리스트
	@RequestMapping("selectChannelList.l")
	public ModelAndView selectChannelList(ModelAndView mv) {
		ArrayList<ChannelListVO> channellist = channelservice.selectChannelList();
		mv.addObject("channellist", channellist);
		mv.setViewName("channel/channelList");

		return mv;
	}
	//채널 생성
	@RequestMapping("insertChannel.l")
	public String insertChannel(ChannelListVO c, HttpServletRequest request, HttpSession session, @RequestParam("file") MultipartFile file) throws Exception {
		if(file.isEmpty() == false){
			String user_id = c.getChannel_user_id();
			String channelFilepath = fileUtils.fileInfo(user_id, file);
			c.setChannel_filepath(channelFilepath);
			System.out.println("파일패스: "+c.getChannel_filepath());
					
		}
		c.setChannel_name(request.getParameter("channelName"));
		
		c.setChannel_info(request.getParameter("channelInfo"));
		c.setCategory1(request.getParameter("category1"));
		c.setChannel_keyword(request.getParameter("channelKeyword"));
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		c.setChannel_user_id(m.getUserId());
		
		
		
		int a = channelservice.insertChannel(c);
		System.out.println("인서트 갔다온 후"+c.getChannel_filepath());
		String channelName = request.getParameter("channelName");
		int tmp = channelservice.getChannelNo(channelName);
		System.out.println("실렉트 갔따온 후"+c.getChannel_filepath());

		String result = "";

		if (a > 0)
			result = "forward:/selectChannelPage.l?channel_no="+tmp;
		
		else
			result = "common/error";

		return result;

	}
	
	//채널 디테일 페이지 보기
	@RequestMapping("selectChannelPage.l")	
	public ModelAndView selectChannelPage(ModelAndView mv, ChannelVO vo, ChannelArticleVO articleVo, ChannelListVO listVo, HttpSession session) {
		System.out.println("123");
		ChannelVO channelImageCalled = channelservice.selectchannelImageCalled(vo);
		mv.addObject("channelImageCalled", channelImageCalled);

		ArrayList<ChannelArticleVO> selectArticle = channelservice.selectArticle(articleVo);
		mv.addObject("selectArticle", selectArticle);
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		articleVo.setUser_id(member.getUserId());
		ArrayList<ChannelLikeVO> selectLikeList = channelservice.selectLikeList(articleVo);
		mv.addObject("selectLikeList", selectLikeList);
		if(selectLikeList.size() == 0 || selectLikeList == null){
			ChannelLikeVO temp = new ChannelLikeVO();
			temp.setChan_article_no(0);
			selectLikeList.add(temp);
		}
		//채널 댓글 보기
		ArrayList<ChannelCommentVO> commentList  = new ArrayList<ChannelCommentVO>();
		for(int i=0;i<selectArticle.size();i++){
			ArrayList<ChannelCommentVO> commentTemp = channelservice.selectChannelCommentList(selectArticle.get(i).getChan_article_no());
			for(int j=0; j<commentTemp.size();j++){
				commentList.add(commentTemp.get(j));
			}
		}
		mv.addObject("channelCommentList", commentList);
		
		
		ChannelVO channelPage = channelservice.selectChannelPage(vo);
		mv.addObject("channelPage", channelPage);
		mv.setViewName("channel/channelPage");
		
		// 원석 부분
				String masterId = channelservice.getMasterId(vo);

				FireVO search = new FireVO();
				search.setClassify("CHANNEL_ARTICLE");
				search.setFireById(member.getUserId());
				search.setFireId(masterId);
				
				System.out.println("search : " + search);
				ArrayList<FireVO> fireArticleList = channelservice.getFireArticleList(search);
				if(fireArticleList.size() < 1){
					FireVO fivo = new FireVO("CHANNEL_ARTICLE", 0, "admin", "admin", 0, 0, 0);
					
					fireArticleList.add(fivo);
				}
				
				mv.addObject("fireArticleList", fireArticleList);
				mv.addObject("masterId", masterId);
				
				

				FireVO commentSearch = new FireVO();
				commentSearch.setClassify("CHANNEL_COMMENT");
				commentSearch.setFireById(member.getUserId());
				
				ArrayList<FireVO> fireCommentList = channelservice.getFireCommentList(commentSearch);
				for(int x=0;x<fireCommentList.size();x++){
					System.out.println(fireCommentList.get(x));
				}
				if(fireCommentList.size() < 1){
					FireVO fivo = new FireVO("CHANNEL_ARTICLE", 0, "admin", "admin", 0, 0, 0);
					
					fireCommentList.add(fivo);
				}
				
				mv.addObject("fireCommentList", fireCommentList);
				// 여기까지 원석부분
		
		
		return mv;
		
		
		
	}
	//채널 게시물 생성
	@RequestMapping("insertChannelArticle.l")
	public String insertChannelArticle(ChannelArticleVO vo) {
		channelservice.insertChannelArticle(vo);
		return "forward:/selectChannelPage.l";
	}
	//채널 수정
	@RequestMapping("updateChannel.l")
	public String updateChannel(ChannelListVO vo){
		int channel_no = vo.getChannel_no();
		channelservice.updateChannel(vo);
		return "forward:/selectChannelPage.l?channel_no="+channel_no;
	}
	
	//채널 삭제
	@RequestMapping("deleteChannel.l")
	public String deleteChannel(ChannelListVO vo){
		channelservice.deleteChannel(vo);
		return "forward:/selectChannelList.l";
	}
	//채널 게시물 삭제
	@RequestMapping("deleteArticle.l")
	public String deleteArticle(ChannelArticleVO vo){
		channelservice.deleteArticle(vo);
		return "forward:/selectChannelPage.l?channel_no="+vo.getChannel_no();
	}
	//채널 게시물 수정
	@RequestMapping("articleUpdate.l")
	public String articleUpdate(ChannelArticleVO vo){
		channelservice.articleUpdate(vo);
		return "forward:/selectChannelPage.l?channel_no="+vo.getChannel_no();
	}

	//댓글 등록
	@RequestMapping("ajax.l")
	public @ResponseBody String commentInsert(ChannelCommentVO vo,@RequestParam("user_id") String user_id, @RequestParam("chan_article_no") int chan_article_no, @RequestParam("content") String content){
		vo.setUser_id(user_id);
		vo.setContent(content);
		vo.setChan_article_no(chan_article_no);
		System.out.println("댓글 등록 컨틀롤러1");
		int result = channelservice.channelCommentInsert(vo);
		System.out.println("댓글 등록 컨틀롤러");
		return String.valueOf(result);
	}
	@RequestMapping("deleteChannelComment.l")
	public @ResponseBody String deleteChannelComment(ChannelCommentVO vo){
		String result = String.valueOf(channelservice.deleteChannelComment(vo));
		return result;
	}
	
	
	//채널 게시물 좋아요
	@RequestMapping("articleLikeClick.l")
	@ResponseBody
	public String articleLikeClick(ChannelLikeVO vo, HttpSession sessionId) {
		
		MemberVO loginUser = (MemberVO) sessionId.getAttribute("loginUser");
		vo.setUser_id(loginUser.getUserId());
		int res = channelservice.articleLikeClick(vo);
		String result = String.valueOf(res);
		return result;
	}
	//채널 게시물 좋아요 해제
	@RequestMapping("articleUnLikeClick.l")
	public String articleUnLikeClick(ChannelLikeVO vo, HttpSession sessionId) {
		MemberVO loginUser = (MemberVO)sessionId.getAttribute("loginUser");
		vo.setUser_id(loginUser.getUserId());
		channelservice.articleUnLikeClick(vo);
		return "forward:/selectChannelPage.l";
	}
	

	
}
