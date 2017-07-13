package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupWriteVO;

@Repository("groupWriteDAO")
public class GroupWriteDAO {

	private static final String NAMESPACE = "group.";

	@Autowired
	private SqlSession sqlSession;

	// 게시글 목록 정보.
	@SuppressWarnings("unchecked")
	public ArrayList<GroupWriteVO> selectGroupWriteList(int groupNo) {
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return (ArrayList<GroupWriteVO>)sqlSession.selectList(NAMESPACE + "selectGroupWriteList", groupNo, rowBounds);
	}

	// 게시글 쓰기.
	public int insertGroupWrite(GroupWriteVO vo) {
		return sqlSession.insert(NAMESPACE + "insertGroupWrite", vo);
	}

	// 게시글 수정. 미완성 ------------------------------
	public int updateGroupWrite(GroupWriteVO vo) {
		return sqlSession.update(NAMESPACE + "updateGroupWrite", vo);
	}

	// 게시글 삭제.
	public int deleteGroupWrite(int writeNo) {
		return sqlSession.update(NAMESPACE + "deleteGroupWrite", writeNo);
	}

}
