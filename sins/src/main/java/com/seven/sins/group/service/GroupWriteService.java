package com.seven.sins.group.service;

import java.util.*;

import com.seven.sins.group.vo.GroupWriteVO;

public interface GroupWriteService {
	
	public ArrayList<GroupWriteVO> selectGroupWriteList(int groupNo);
	
	public int insertGroupWrite(GroupWriteVO vo);
	
	public int updateGroupWrite(GroupWriteVO vo);
	
	public int deleteGroupWrite(int writeNo);
	
}
