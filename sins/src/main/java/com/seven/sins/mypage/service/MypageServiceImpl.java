package com.seven.sins.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.dao.MypageDAO;
import com.seven.sins.mypage.service.MypageService;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageLikeVO;
import com.seven.sins.mypage.vo.MypageVO;
@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	
	@Override
	public ArrayList<MypageVO> selectMypage(String userid) {
		ArrayList<MypageVO> list = mypageDAO.selectMypageList(userid);
		return list;
	}

	@Override
	public ArrayList<MypageCommentVO> selectMypageComment(String userid) {
		ArrayList<MypageCommentVO> list = mypageDAO.selectMypageCommentList(userid);
		return list;
	}

	@Override
	public MemberVO memberCheck(MemberVO m) {
		return mypageDAO.memberCheck(m);
	}

	@Override
	public int mypageSend(MypageVO mypage) {
		return mypageDAO.mypageSend(mypage);
	}

	@Override
	public int mypageComment(MypageCommentVO mypageComment) {
		return mypageDAO.mypageComment(mypageComment);
	}

	@Override
	public int mypageUpdate(MypageVO mypageComment) {
		return mypageDAO.mypageUpdate(mypageComment);
	}

	@Override
	public int mypageCommentUpdate(MypageCommentVO mypageComment) {
		return mypageDAO.mypageCommentUpdate(mypageComment);
	}

	@Override
	public int mypageDelete(MypageVO mypageComment) {
		System.out.println("서비스");
		return mypageDAO.mypageDelete(mypageComment);
	}

	@Override
	public int mypageCommentDelete(MypageCommentVO mypageComment) {
		return mypageDAO.mypageCommentDelete(mypageComment);
	}

	@Override
	public int getMypageCount() {
		// TODO Auto-generated method stub
		return mypageDAO.getMypageCount();
	}

	@Override
	public int getKeywordCount(String option, String keyword) {
		return mypageDAO.getKeywordCount(option, keyword);
	}

	@Override
	public int MypageLike(MypageLikeVO vo) {
		// TODO Auto-generated method stub
		return mypageDAO.MypageLike(vo);
	}

	@Override
	public int MypageUnLike(MypageLikeVO vo) {
		// TODO Auto-generated method stub
		return mypageDAO.MypageUnLike(vo);
	}

	@Override
	public ArrayList<MypageLikeVO> mypageLikeList(MypageLikeVO mylike) {
		// TODO Auto-generated method stub
		return mypageDAO.mypageLikeList(mylike);
	}

	@Override
	public int mypageLikeUpdate(MypageVO myvo) {
		// TODO Auto-generated method stub
		return mypageDAO.mypageLikeUpdate(myvo);
	}

	@Override
	public MypageVO MypageSelectLike(MypageVO myvo) {
		// TODO Auto-generated method stub
		return mypageDAO.MypageSelectLike(myvo);
	}

	@Override
	public MypageVO contentsMain(MypageVO my) {
		// TODO Auto-generated method stub
		return mypageDAO.contentsMain(my);
	}

	@Override
	public ArrayList<MypageCommentVO> contentsMainComment(int writeno) {
		// TODO Auto-generated method stub
		return mypageDAO.contentsMainComment(writeno);
	}

	@Override
	public ArrayList<MypageCommentVO> selectMypageCommentList(int writeno) {
		ArrayList<MypageCommentVO> list = mypageDAO.selectMypageCommentList(writeno);
		return list;
	}

	@Override
	public int insertMypageComment(MypageCommentVO vo) {
		int result = mypageDAO.insertMypageComment(vo);
		return result;
		
	}

	@Override
	public ArrayList<FireVO> getFireList(FireVO search) {
		return mypageDAO.getFireList(search);
	}

	@Override
	public ArrayList<FireVO> fireCommentList(FireVO searchComment) {
		return mypageDAO.fireCommentList(searchComment);
	}

	@Override
	public ArrayList<MypageCommentVO> getComment(MypageCommentVO vo) {
		return mypageDAO.getComment(vo);
	}

	@Override
	public ArrayList<GroupCommentVO> selectGroupCommentList(int writeNo) {
		ArrayList<GroupCommentVO> list = mypageDAO.selectGroupCommentList(writeNo);
		return list;
	}


	@Override
	public ArrayList<ChannelCommentVO> selectChannelCommentList(ChannelCommentVO c) {
		ArrayList<ChannelCommentVO> list = mypageDAO.selectChannelCommentList(c);
		return list;
	}

	@Override
	public int mypagePotoUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mypageDAO.mypagePotoUpdate(mvo);
	}
	
	

}
