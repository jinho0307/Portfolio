package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupCommentVO;

@Repository("groupCommentDAO")
public class GroupCommentDAO {
	
	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;

	@SuppressWarnings("unchecked")
	public ArrayList<GroupCommentVO> selectGroupCommentList(int writeNo) {
		return (ArrayList<GroupCommentVO>)sqlSession.selectList(NAMESPACE + "selectGroupCommentList", writeNo);
	}

	public int insertGroupComment(GroupCommentVO vo) {
		return sqlSession.insert(NAMESPACE + "insertGroupComment", vo);
	}

	public int updateGroupComment(GroupCommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteGroupComment(GroupCommentVO vo) {
		return sqlSession.update(NAMESPACE + "deleteGroupComment", vo);
	}

	public int countGroupComment(int writeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupCommentVO> selectGroupCommentList2(GroupCommentVO vo) {
		return (ArrayList<GroupCommentVO>)sqlSession.selectList(NAMESPACE + "selectGroupCommentList2", vo);
	}
	
	public int insertGroupComment2(GroupCommentVO vo) {
		return sqlSession.update(NAMESPACE + "insertGroupComment2", vo);
	}

	

}
