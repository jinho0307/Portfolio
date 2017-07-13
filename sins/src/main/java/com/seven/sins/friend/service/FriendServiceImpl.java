package com.seven.sins.friend.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.friend.dao.FriendDAO;
import com.seven.sins.friend.vo.FriendVO;
import com.seven.sins.member.vo.MemberVO;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDAO friendDao;
	
	@Override
	public ArrayList<FriendVO> selectFriend(String userId) {

		
		return friendDao.selectFriend(userId);
	}

	@Override
	public ArrayList<FriendVO> getResponse(String userId) {
		return friendDao.getResponse(userId);
	}

	@Override
	public int getResCount(String userId) {
		return friendDao.getResCount(userId);
	}


	@Override
	public ArrayList<FriendVO> getRequest(String userId) {
		return friendDao.getRequest(userId);
	}

	@Override
	public void acceptFriend(String userId, String reqId) {
		
		friendDao.acceptFriend(userId, reqId);
	}

	@Override
	public void rejectFriend(String userId, String reqId) {

		friendDao.rejectFriend(userId, reqId);
	}

	@Override
	public ArrayList<MemberVO> friendFind(Map<String, String> query, int page, int count) {
		return friendDao.friendFind(query, page, count);
	}

	@Override
	public ArrayList<FriendVO> getRecommend(String userId) {
		return friendDao.getRecommend(userId);
	}

	@Override
	public void addFriend(String userId, String resId) {
		friendDao.addFriend(userId, resId);
	}



}
