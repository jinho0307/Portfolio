package com.seven.sins.fire.service;

import java.util.ArrayList;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

public interface FireService {

	int doChannelContentFire(FireVO fire);

	int cancelChannelContentFire(FireVO fire);

	ArrayList<FireVO> getFireList(FireVO search);

	int fireComment(FireVO vo);

	int fireCommentCancel(FireVO vo);

	ArrayList<FireVO> getFireContentList();

	ChannelArticleVO getChannelArticle(FireVO fireVO);

	GroupWriteVO groupWrite(FireVO fireVO);

	MypageVO getMyPage(FireVO fireVO);

	MemberVO getUserProfileC(ChannelArticleVO cav);

	MemberVO getUserProfileG(GroupWriteVO cav);

	MemberVO getUserProfileM(MypageVO cav);

	ArrayList<FireVO> getFireCommentList();

	ChannelCommentVO getChannelComment(FireVO fireVO);

	GroupCommentVO groupComment(FireVO fireVO);

	MypageCommentVO getMyPageComment(FireVO fireVO);

	MemberVO getUserProfileCC(ChannelCommentVO cav);

	MemberVO getUserProfileGC(GroupCommentVO cav);

	MemberVO getUserProfileMC(MypageCommentVO cav);

	int contentDeleteC(ChannelArticleVO vo);

	int contentDeleteG(GroupWriteVO vo);

	int contentDeleteM(MypageVO vo);

	void likeDeleteC(ChannelArticleVO vo);

	void likeDeleteG(GroupWriteVO vo);

	void likeDeleteM(MypageVO vo);

	void fireDelete(FireVO vv);

	void fireCommentDelete(FireVO vv);

	int commentDeleteC(ChannelCommentVO vo);

	int commentDeleteG(GroupCommentVO vo);

	int commentDeleteM(MypageCommentVO vo);

	/*String getUserId(FireVO fire);*/


}
