package com.seven.sins.search.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchGroupVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Repository
public class SearchDAO {

	private static final String NAMESPACE="Search.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<SearchMemberVO> getMember(String userId, String word, int page, int count) {
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("word", "%"+word+"%");
		
		int startRow=page*5;
		
		RowBounds rowBounds = new RowBounds(startRow, count);
		return (ArrayList<SearchMemberVO>) sqlSession.selectList(NAMESPACE+"searchMember", map, rowBounds);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<SearchChannelVO> getChannel(String userId, String word, int page, int count) {

		Map<String, String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("word", "%"+word+"%");
		
		int startRow=page*5;
		
		RowBounds rowBounds = new RowBounds(startRow, count);
		
		
		return (ArrayList<SearchChannelVO>) sqlSession.selectList(NAMESPACE+"searchChannel", map, rowBounds);
	}


	@SuppressWarnings("unchecked")
	public ArrayList<SearchGroupVO> getGroup(String userId, String word, int page, int count) {

		Map<String, String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("word", "%"+word+"%");
		
		int startRow=page*5;
		
		RowBounds rowBounds = new RowBounds(startRow, count);
		
		return (ArrayList<SearchGroupVO>) sqlSession.selectList(NAMESPACE+"searchGroup", map, rowBounds);
	}




}
