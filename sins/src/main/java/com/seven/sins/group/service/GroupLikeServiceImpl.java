package com.seven.sins.group.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.group.dao.GroupLikeDAO;
import com.seven.sins.group.vo.GroupLikeVO;

@Service
public class GroupLikeServiceImpl implements GroupLikeService {

	@Autowired
	private GroupLikeDAO groupLikeDAO;

	@Override
	public ArrayList<GroupLikeVO> groupLikeList(GroupLikeVO vo) {
		ArrayList<GroupLikeVO> list = groupLikeDAO.groupLikeList(vo);
		return list;
	}
	
	@Override
	public int groupLike(GroupLikeVO vo) {
		int result = groupLikeDAO.groupLike(vo);
		return result;
	}

	@Override
	public int groupUnlike(GroupLikeVO vo) {
		int result = groupLikeDAO.groupUnlike(vo);
		return result;
	}

	@Override
	public int countGroup(GroupLikeVO vo) {
		int result = groupLikeDAO.countGroup(vo);
		return result;
	}

}
