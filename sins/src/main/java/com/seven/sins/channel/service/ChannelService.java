package com.seven.sins.channel.service;

import java.util.ArrayList;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
import com.seven.sins.fire.vo.FireVO;

public interface ChannelService {
	public ArrayList<ChannelListVO> selectChannelList();

	public ChannelVO selectChannelPage(ChannelVO vo);

	int insertChannel(ChannelListVO c);

	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo);

	public ChannelVO selectchannelImageCalled(ChannelVO vo);

	public int insertChannelArticle(ChannelArticleVO vo);

	public int articleLikeClick(ChannelLikeVO vo);

	public int articleUnLikeClick(ChannelLikeVO vo);

	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo);

	public int updateChannel(ChannelListVO listVo);
	
	public int deleteChannel(ChannelListVO vo);

	public int channelCommentInsert(ChannelCommentVO vo);

	public ArrayList<ChannelCommentVO> selectChannelCommentList(int chan_article_no);

	// 원석부분
	public String getMasterId(ChannelVO vo);
	public ArrayList<FireVO> getFireArticleList(FireVO channelPage);
	public ArrayList<FireVO> getFireCommentList(FireVO commentSearch);
	// 여기까지 원석부분

	public int deleteChannelComment(ChannelCommentVO vo);

	public int getChannelNo(String setChannel_name);

	public int deleteArticle(ChannelArticleVO vo);

	public int articleUpdate(ChannelArticleVO vo);



}
