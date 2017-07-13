package com.seven.sins.group.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.group.dao.GroupWriteDAO;
import com.seven.sins.group.vo.GroupWriteVO;

@Service
public class GroupWriteServiceImpl implements GroupWriteService {

	@Autowired
	private GroupWriteDAO groupWriteDAO;
	
	@Override
	public ArrayList<GroupWriteVO> selectGroupWriteList(int groupNo) {
		ArrayList<GroupWriteVO> list = groupWriteDAO.selectGroupWriteList(groupNo);
		return list;
	}

	@Override
	public int insertGroupWrite(GroupWriteVO vo) {
		int result = groupWriteDAO.insertGroupWrite(vo);
		return result;
	}

	@Override
	public int updateGroupWrite(GroupWriteVO vo) {
		int result = groupWriteDAO.updateGroupWrite(vo);
		return result;
	}

	@Override
	public int deleteGroupWrite(int writeNo) {
		int result = groupWriteDAO.deleteGroupWrite(writeNo);
		return result;
	}
}
