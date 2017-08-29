package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.GroupWriteVO;

public interface GroupWriteService {
	
	// 해당 그룹 글 리스트 보여주기.
	public ArrayList<GroupWriteVO> selectGroupWriteList(int groupNo);
	
	// 그룹에 글쓰기.
	public int insertGroupWrite(GroupWriteVO vo);
	
	// 그룹에 쓴 글 수정.
	public int updateGroupWrite(GroupWriteVO vo);
	
	// 그룹 글 삭제.
	public int deleteGroupWrite(int writeNo);
}
