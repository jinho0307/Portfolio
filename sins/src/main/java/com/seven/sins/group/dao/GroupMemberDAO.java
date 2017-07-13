package com.seven.sins.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.group.vo.GroupMemberVO;

@Repository("groupMemberDAO")
public class GroupMemberDAO {

	private static final String NAMESPACE = "group.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 그룹 멤버 정보 가져옴.
	@SuppressWarnings("unchecked")
	public ArrayList<GroupMemberVO> selectGroupMemberList(int groupNo) {
		return (ArrayList<GroupMemberVO>)sqlSession.selectList(NAMESPACE + "selectGroupMemberList", groupNo);
	}

	// 가입 요청.
	public int requestGroupMember(GroupMemberVO vo) {
		return sqlSession.insert(NAMESPACE + "requestGroupMember", vo);
	}

	// 가입 승인.
	public int agreeGroupMember(GroupMemberVO vo) {
		return sqlSession.update(NAMESPACE + "agreeGroupMember", vo);
	}

	// 멤버 grade 변경.-----------------------------------
	public int updateGroupMember(GroupMemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 가입 거절(운영진) or 그룹 탈퇴(멤버 본인) or 회원 탈퇴(운영진)
	public int deleteGroupMember(GroupMemberVO vo) {
		return sqlSession.delete(NAMESPACE + "deleteGroupMember", vo);
	}

	// 그룹 회원 수/ 필요한지 보류. -----------------------------------------
	public int countGroupMember(int groupNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
