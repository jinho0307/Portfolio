package com.seven.sins.fire.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.dao.FireDAO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

@Service("fireService")
public class FireServiceImpl implements FireService{
	@Autowired
	private FireDAO fireDAO;

	@Override
	public int doChannelContentFire(FireVO fire) {
		return fireDAO.doChannelContentFire(fire);
	}

	@Override
	public int cancelChannelContentFire(FireVO fire) {
		return fireDAO.cancelChannelContentFire(fire);
	}

	@Override
	public ArrayList<FireVO> getFireList(FireVO search) {
		return fireDAO.getFireList(search);
	}

	@Override
	public int fireComment(FireVO vo) {
		return fireDAO.fireComment(vo);
	}

	

	@Override
	public int fireCommentCancel(FireVO vo) {
		return fireDAO.fireCommentCancel(vo);
	}

	@Override
	public ArrayList<FireVO> getFireContentList() {
		return fireDAO.getFireContentList();
	}

	@Override
	public ChannelArticleVO getChannelArticle(FireVO fireVO) {
		return fireDAO.getChannelArticle(fireVO);
	}

	@Override
	public GroupWriteVO groupWrite(FireVO fireVO) {
		return fireDAO.groupWrite(fireVO);
	}

	@Override
	public MypageVO getMyPage(FireVO fireVO) {
		return fireDAO.getMyPage(fireVO);
	}

	@Override
	public MemberVO getUserProfileC(ChannelArticleVO cav) {
		return fireDAO.getUserProfileC(cav);
	}

	@Override
	public MemberVO getUserProfileG(GroupWriteVO cav) {
		return fireDAO.getUserProfileG(cav);
	}

	@Override
	public MemberVO getUserProfileM(MypageVO cav) {
		return fireDAO.getUserProfileM(cav);
	}

	@Override
	public ArrayList<FireVO> getFireCommentList() {
		return fireDAO.getFireCommentList();
	}

	@Override
	public ChannelCommentVO getChannelComment(FireVO fireVO) {
		return fireDAO.getChannelComment(fireVO);
	}

	@Override
	public GroupCommentVO groupComment(FireVO fireVO) {
		return fireDAO.groupComment(fireVO);
	}

	@Override
	public MypageCommentVO getMyPageComment(FireVO fireVO) {
		return fireDAO.getMyPageComment(fireVO);
	}

	@Override
	public MemberVO getUserProfileCC(ChannelCommentVO cav) {
		return fireDAO.getUserProfileCC(cav);
	}

	@Override
	public MemberVO getUserProfileGC(GroupCommentVO cav) {
		return fireDAO.getUserProfileGC(cav);
	}

	@Override
	public MemberVO getUserProfileMC(MypageCommentVO cav) {
		return fireDAO.getUserProfileMC(cav);
	}

	@Override
	public int contentDeleteC(ChannelArticleVO vo) {
		return fireDAO.contentDeleteC(vo);
	}

	@Override
	public int contentDeleteG(GroupWriteVO vo) {
		return fireDAO.contentDeleteG(vo);
	}

	@Override
	public int contentDeleteM(MypageVO vo) {
		return fireDAO.contentDeleteM(vo);
	}

	@Override
	public void likeDeleteC(ChannelArticleVO vo) {
		fireDAO.likeDeleteC(vo);
	}

	@Override
	public void likeDeleteG(GroupWriteVO vo) {
		fireDAO.likeDeleteG(vo);
	}

	@Override
	public void likeDeleteM(MypageVO vo) {
		fireDAO.likeDeleteM(vo);
	}

	@Override
	public void fireDelete(FireVO vv) {
		fireDAO.fireDelete(vv);
	}

	@Override
	public void fireCommentDelete(FireVO vv) {
		fireDAO.fireCommentDelete(vv);
	}

	@Override
	public int commentDeleteC(ChannelCommentVO vo) {
		return fireDAO.commentDeleteC(vo);
	}

	@Override
	public int commentDeleteG(GroupCommentVO vo) {
		return fireDAO.commentDeleteG(vo);
	}

	@Override
	public int commentDeleteM(MypageCommentVO vo) {
		return fireDAO.commentDeleteM(vo);
	}

	/*@Override
	public String getUserId(FireVO fire) {
		return fireDAO.getUserId(fire);
	}*/

}
