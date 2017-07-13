package com.seven.sins.channel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.channel.dao.ChannelDAO;
import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.channel.vo.ChannelLikeVO;
import com.seven.sins.channel.vo.ChannelListVO;
import com.seven.sins.channel.vo.ChannelVO;
import com.seven.sins.fire.vo.FireVO;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelDAO channelDAO;

	@Override
	public ArrayList<ChannelListVO> selectChannelList() {
		ArrayList<ChannelListVO> list = channelDAO.selectChannelList();
		return list;
	}

	@Override
	public int insertChannel(ChannelListVO c) {
		
		int result = channelDAO.insertChannel(c);
		System.out.println("sevice");
		return result;
	}

	@Override
	public ArrayList<ChannelArticleVO> selectArticle(ChannelArticleVO vo) {
		ArrayList<ChannelArticleVO> selectArticle = channelDAO.selectArticle(vo);
		return selectArticle;
	}

	@Override
	public int insertChannelArticle(ChannelArticleVO vo) {
		System.out.println("2");
		return channelDAO.insertChannelArticle(vo);
	}

	@Override
	public int articleLikeClick(ChannelLikeVO vo) {
		return channelDAO.articleLikeClick(vo);
	}

	@Override
	public int articleUnLikeClick(ChannelLikeVO vo) {
		return channelDAO.articleUnLikeClick(vo);
	}

	@Override
	public ChannelVO selectChannelPage(ChannelVO vo) {
		return channelDAO.selectChannelPage(vo);
	}

	@Override
	public ChannelVO selectchannelImageCalled(ChannelVO vo) {
		return channelDAO.selectchannelImageCalled(vo);
	}

	@Override
	public ArrayList<ChannelLikeVO> selectLikeList(ChannelArticleVO articleVo) {
		return channelDAO.selectLikeList(articleVo);
	}

	@Override
	public int updateChannel(ChannelListVO listVo) {
		return channelDAO.updateChannel(listVo);
	}

	@Override
	public int channelCommentInsert(ChannelCommentVO vo) {
		System.out.println("service");
		return channelDAO.channelCommentInsert(vo);
	}

	@Override
	public ArrayList<ChannelCommentVO> selectChannelCommentList(int chan_article_no) {
		return channelDAO.selectChannelCommentList(chan_article_no);
	}

	// 원석부분
		@Override
		public String getMasterId(ChannelVO vo) {
			return channelDAO.getMasterId(vo);
		}

		@Override
		public ArrayList<FireVO> getFireArticleList(FireVO channelPage) {
			return channelDAO.getFireArticleList(channelPage);
		}
		

		@Override
		public ArrayList<FireVO> getFireCommentList(FireVO commentSearch) {
			return channelDAO.getFireCommentList(commentSearch);
		}
		// 여기까지 원석부분

	@Override
	public int deleteChannelComment(ChannelCommentVO vo) {
		return channelDAO.deleteChannelComment(vo);
	}

	@Override
	public int getChannelNo(String setChannel_name) {
		return channelDAO.getChannelNo(setChannel_name);
	}

	@Override
	public int deleteChannel(ChannelListVO vo) {
		return channelDAO.deleteChannel(vo);
	}

	@Override
	public int deleteArticle(ChannelArticleVO vo) {
		System.out.println("service");
		return channelDAO.deleteArticle(vo);
	}

	@Override
	public int articleUpdate(ChannelArticleVO vo) {
		return channelDAO.articleUpdate(vo);
	}

}
