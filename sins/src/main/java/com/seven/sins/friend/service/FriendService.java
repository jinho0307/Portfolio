package com.seven.sins.friend.service;

import java.util.ArrayList;
import java.util.Map;

import com.seven.sins.friend.vo.FriendVO;
import com.seven.sins.member.vo.MemberVO;

public interface FriendService {

	ArrayList<FriendVO> selectFriend(String userId);

	ArrayList<FriendVO> getResponse(String userId);

	int getResCount(String userId);


	ArrayList<FriendVO> getRequest(String userId);

	void acceptFriend(String userId, String reqId);

	void rejectFriend(String userId, String reqId);

	ArrayList<MemberVO> friendFind(Map<String, String> query, int page, int count);

	ArrayList<FriendVO> getRecommend(String userId);

	void addFriend(String userId, String resId);


}
