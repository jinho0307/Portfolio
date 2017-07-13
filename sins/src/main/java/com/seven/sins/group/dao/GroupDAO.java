package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.GroupVO;

@Repository("groupDAO")
public class GroupDAO {
	
	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 그룹 리스트 보여줌.
	@SuppressWarnings("unchecked")
	public ArrayList<GroupVO> selectGroupList() {
		return (ArrayList<GroupVO>)sqlSession.selectList(NAMESPACE + "selectGroupList");
	}

	// 그룹 하나 선택 시, 상세페이지로 전달할 정보.
	public GroupVO selectGroup(int groupNo) {
		return (GroupVO)sqlSession.selectOne(NAMESPACE + "selectGroup", groupNo);
	}

	// 그룹 생성.
	public int insertGroup(GroupVO vo) {
		int groupResult = sqlSession.insert(NAMESPACE + "insertGroup", vo);

		// 그룹 생성 성공 시, 생성자를 멤버 테이블에 운영자로 추가.
		if(groupResult > 0) 
			sqlSession.insert(NAMESPACE + "insertGroupAdmin", vo);
		
		return groupResult;
	}

	// 그룹 수정 (그룹 이름, 그룹 정보, 대표 사진)
	public int updateGroup(GroupVO vo) {
		return sqlSession.update("updateGroup", vo);
	}

	// 그룹 삭제 (실제로 삭제되지 않고, deleteYN 을 'Y' 값으로 변경)
	public int deleteGroup(int groupNo) {
		return sqlSession.update("deleteGroup", groupNo);
	}

	// 원석부분
	@SuppressWarnings("unchecked")
	public ArrayList<FireVO> getfireList(FireVO search) {
		return (ArrayList<FireVO>)sqlSession.selectList("Fire.getfireList", search);
	}

}
