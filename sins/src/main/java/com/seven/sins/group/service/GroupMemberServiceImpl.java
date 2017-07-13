package com.seven.sins.group.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.group.dao.GroupMemberDAO;
import com.seven.sins.group.vo.GroupMemberVO;

@Service
public class GroupMemberServiceImpl implements GroupMemberService {

	@Autowired
	private GroupMemberDAO groupMemberDAO;

	@Override
	public ArrayList<GroupMemberVO> selectGroupMemberList(int groupNo) {
		ArrayList<GroupMemberVO> list = groupMemberDAO.selectGroupMemberList(groupNo);
		return list;
	}

	@Override
	public int requestGroupMember(GroupMemberVO vo) {
		int result = groupMemberDAO.requestGroupMember(vo);
		return result;
	}

	@Override
	public int agreeGroupMember(GroupMemberVO vo) {
		int result = groupMemberDAO.agreeGroupMember(vo);
		return result;
	}

	@Override
	public int updateGroupMember(GroupMemberVO vo) {
		int result = groupMemberDAO.updateGroupMember(vo);
		return result;
	}

	@Override
	public int deleteGroupMember(GroupMemberVO vo) {
		int result = groupMemberDAO.deleteGroupMember(vo);
		return result;
	}

	@Override
	public int countGroupMember(int groupNo) {
		int result = groupMemberDAO.countGroupMember(groupNo);
		return 0;
	}
}
