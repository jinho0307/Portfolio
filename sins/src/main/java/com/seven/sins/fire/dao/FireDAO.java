package com.seven.sins.fire.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.channel.vo.ChannelArticleVO;
import com.seven.sins.channel.vo.ChannelCommentVO;
import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.mypage.vo.MypageCommentVO;
import com.seven.sins.mypage.vo.MypageVO;

@Repository("fireDAO")
public class FireDAO {
	
	private static final String NAMESPACE = "Fire.";
	@Autowired
	private SqlSession sqlSession;
	
	/*public String getUserId(FireVO fire) {
		return (String)sqlSession.selectOne(NAMESPACE+"getUserId", fire);
	}*/

	public int doChannelContentFire(FireVO fire) {
		return (int)sqlSession.insert(NAMESPACE+"doChannelContentFire", fire);
	}

	public int cancelChannelContentFire(FireVO fire) {
		return (int)sqlSession.delete(NAMESPACE+"cancelChannelContentFire", fire);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<FireVO> getFireList(FireVO search) {
		return (ArrayList<FireVO>)sqlSession.selectList(NAMESPACE+"getFireList", search);
	}

	public int fireComment(FireVO vo) {
		return (int)sqlSession.insert(NAMESPACE+"fireComment", vo);
	}

	public int fireCommentCancel(FireVO vo) {
		return (int)sqlSession.insert(NAMESPACE+"fireCommentCancel", vo);
	}

	public ArrayList<FireVO> getFireContentList() {
		return (ArrayList<FireVO>) sqlSession.selectList(NAMESPACE+"getFireContentList");
	}

	public ChannelArticleVO getChannelArticle(FireVO fireVO) {
		return (ChannelArticleVO) sqlSession.selectOne("Channel.getChannelArticle", fireVO);
	}

	public GroupWriteVO groupWrite(FireVO fireVO) {
		return (GroupWriteVO) sqlSession.selectOne("group.groupWrite", fireVO);
	}

	public MypageVO getMyPage(FireVO fireVO) {
		return (MypageVO) sqlSession.selectOne("mypage.getMyPage", fireVO);
	}

	public MemberVO getUserProfileC(ChannelArticleVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileC", cav);
	}

	public MemberVO getUserProfileG(GroupWriteVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileG", cav);
	}

	public MemberVO getUserProfileM(MypageVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileM", cav);
	}

	public ArrayList<FireVO> getFireCommentList() {
		return (ArrayList<FireVO>) sqlSession.selectList(NAMESPACE+"getFireCommentList2");
	}

	public ChannelCommentVO getChannelComment(FireVO fireVO) {
		return (ChannelCommentVO) sqlSession.selectOne("Channel.getChannelComment", fireVO);
	}

	public GroupCommentVO groupComment(FireVO fireVO) {
		return (GroupCommentVO) sqlSession.selectOne("group.groupComment", fireVO);
	}

	public MypageCommentVO getMyPageComment(FireVO fireVO) {
		return (MypageCommentVO) sqlSession.selectOne("mypage.getMyPageComment", fireVO);
	}

	public MemberVO getUserProfileCC(ChannelCommentVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileCC", cav);
	}

	public MemberVO getUserProfileGC(GroupCommentVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileGC", cav);
	}

	public MemberVO getUserProfileMC(MypageCommentVO cav) {
		return (MemberVO) sqlSession.selectOne("Member.getUserProfileMC", cav);
	}

	public int contentDeleteC(ChannelArticleVO vo) {
		return sqlSession.delete(NAMESPACE+"contentDeleteC", vo);
	}

	public int contentDeleteG(GroupWriteVO vo) {
		return sqlSession.delete(NAMESPACE+"contentDeleteG", vo);
	}

	public int contentDeleteM(MypageVO vo) {
		return sqlSession.delete(NAMESPACE+"contentDeleteM", vo);
	}

	public void likeDeleteC(ChannelArticleVO vo) {
		sqlSession.delete(NAMESPACE+"likeDeleteC", vo);
	}

	public void likeDeleteG(GroupWriteVO vo) {
		sqlSession.delete(NAMESPACE+"likeDeleteG", vo);
	}

	public void likeDeleteM(MypageVO vo) {
		sqlSession.delete(NAMESPACE+"likeDeleteM", vo);
	}

	public void fireDelete(FireVO vv) {
		sqlSession.delete(NAMESPACE+"fireDelete", vv);
		
	}

	public void fireCommentDelete(FireVO vv) {
		sqlSession.delete(NAMESPACE+"fireCommentDelete", vv);
	}

	public int commentDeleteC(ChannelCommentVO vo) {
		return sqlSession.delete(NAMESPACE+"commentDeleteC", vo);
	}

	public int commentDeleteG(GroupCommentVO vo) {
		return sqlSession.delete(NAMESPACE+"commentDeleteG", vo);
	}

	public int commentDeleteM(MypageCommentVO vo) {
		return sqlSession.delete(NAMESPACE+"commentDeleteM", vo);
	}
	
	
}
