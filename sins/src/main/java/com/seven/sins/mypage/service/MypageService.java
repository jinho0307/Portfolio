package com.seven.sins.mypage.service;

import java.util.ArrayList;

import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageLikeVO;
import com.seven.sins.mypage.vo.MypageVO;

public interface MypageService {

	//public ArrayList<MypageVO> selectMypage();

	public ArrayList<MypageVO> selectMypage(String string);

	//public ArrayList<MypageCommentVO> selectMypageComment();

	public ArrayList<MypageCommentVO> selectMypageComment(String string);

	public MemberVO memberCheck(MemberVO m);

	public int mypageSend(MypageVO mypage);

	public int mypageComment(MypageCommentVO mypageComment);

	public int mypageUpdate(MypageVO mypageComment);

	public int mypageCommentUpdate(MypageCommentVO mypageComment);

	public int mypageDelete(MypageVO mypageComment);

	public int mypageCommentDelete(MypageCommentVO mypageComment);

	public int getMypageCount();

	public int getKeywordCount(String option, String keyword);

	public int MypageLike(MypageLikeVO vo);

	public int MypageUnLike(MypageLikeVO vo);

	public ArrayList<MypageLikeVO> mypageLikeList(MypageLikeVO mylike);

	public int mypageLikeUpdate(MypageVO myvo);

	public MypageVO MypageSelectLike(MypageVO myvo);

	public MypageVO contentsMain(MypageVO my);

	public ArrayList<MypageCommentVO> contentsMainComment(int writeno);

	public ArrayList<MypageCommentVO> selectMypageCommentList(int writeno);

	public int insertMypageComment(MypageCommentVO vo);

	public ArrayList<FireVO> getFireList(FireVO search);

	public ArrayList<FireVO> fireCommentList(FireVO searchComment);

	public ArrayList<MypageCommentVO> getComment(MypageCommentVO vo);

	public ArrayList<GroupCommentVO> selectGroupCommentList(int writeNo);

	public ArrayList<ChannelCommentVO> selectChannelCommentList(ChannelCommentVO c);

	public int mypagePotoUpdate(MemberVO mvo);

}
