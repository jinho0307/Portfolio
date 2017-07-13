package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupLikeVO;

@Repository("groupLikeDAO")
public class GroupLikeDAO {

	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unchecked")
	public ArrayList<GroupLikeVO> groupLikeList(GroupLikeVO vo) {
		return (ArrayList<GroupLikeVO>)sqlSession.selectList(NAMESPACE + "groupLikeList", vo);
	}
	
	public int groupLike(GroupLikeVO vo) {
		return sqlSession.insert(NAMESPACE + "groupLike", vo);
	}

	public int groupUnlike(GroupLikeVO vo) {
		return sqlSession.delete(NAMESPACE + "groupUnlike", vo);
	}

	public int countGroup(GroupLikeVO vo) {
		return 0;
	}
}
