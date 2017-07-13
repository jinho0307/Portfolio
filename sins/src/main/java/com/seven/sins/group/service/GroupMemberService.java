package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.*;

public interface GroupMemberService {
	
	public ArrayList<GroupMemberVO> selectGroupMemberList(int groupNo);
	
	// 그룹가입 요청 - int groupNo, String userId
	public int requestGroupMember(GroupMemberVO vo);
	
	// 그룹가입 승인 - int groupNo, String userId, char groupAccept
	public int agreeGroupMember(GroupMemberVO vo);
	
	// 그룹회원 수정 - int groupNo, String userId, int grade
	public int updateGroupMember(GroupMemberVO vo);
	
	// 그룹회원 삭제, 탈퇴 - int groupNo, String userId
	public int deleteGroupMember(GroupMemberVO vo);
	
	// 그룹별 회원 수 조회
	public int countGroupMember(int groupNo);
}
