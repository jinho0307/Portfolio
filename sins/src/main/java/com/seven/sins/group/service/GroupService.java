package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.vo.*;

public interface GroupService {

	// 그룹 리스트 보여주기.
	public ArrayList<GroupVO> selectGroupList();
	
	// 하나의 그룹 선택.
	public GroupVO selectGroup(int groupNo);
	
	// 그룹 생성.
	public int insertGroup(GroupVO vo);
	
	// 그룹 수정.
	public int updateGroup(GroupVO vo);
	
	// 그룹 삭제.
	public int deleteGroup(int groupNo);
	
	// 신고.
	public ArrayList<FireVO> getfireList(FireVO search);
	
	
	
	
}
