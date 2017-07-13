package com.seven.sins.friend.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.friend.vo.FriendVO;
import com.seven.sins.member.vo.MemberVO;

@Repository
public class FriendDAO {

	private static final String NAMESPACE = "Friend.";
	@Autowired
	private SqlSession sqlSession;
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> selectFriend(String userId) {

		return (ArrayList<FriendVO>) sqlSession.selectList(NAMESPACE+"selectFriend", userId);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> getResponse(String userId) {
		return (ArrayList<FriendVO>) sqlSession.selectList(NAMESPACE+"getResponse", userId);
	}


	public int getResCount(String userId) {
		
		return (int) sqlSession.selectOne(NAMESPACE+"getResCount", userId);
	}





	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> getRequest(String userId) {
		return (ArrayList<FriendVO>) sqlSession.selectList(NAMESPACE+"getRequest", userId);
	}


	public void acceptFriend(String userId, String reqId) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("requestId", reqId);
		map.put("responseId", userId);
		
		sqlSession.update(NAMESPACE+"acceptFriend", map);
	
		
		
	}


	public void rejectFriend(String userId, String reqId) {

		Map<String, String> map = new HashMap<String, String>();
		
		map.put("requestId", reqId);
		map.put("responseId", userId);
		
		sqlSession.delete(NAMESPACE+"rejectFriend", map);
		
	}


	@SuppressWarnings("unchecked")
	public ArrayList<MemberVO> friendFind(Map<String, String> query, int page, int count) {
		
		RowBounds rowBounds= new RowBounds(page*5, count);
		
		return (ArrayList<MemberVO>) sqlSession.selectList(NAMESPACE+"friendFind", query, rowBounds);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<FriendVO> getRecommend(String userId) {

		return (ArrayList<FriendVO>) sqlSession.selectList(NAMESPACE+"recommendFriend", userId);
	}


	public void addFriend(String userId, String resId) {
		Map<String, String> map= new HashMap<String, String>();
		map.put("requestId", userId);
		map.put("responseId", resId);
		sqlSession.insert("addFriend", map);
		
	}




	

	
}
