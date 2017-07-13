package com.seven.sins.search.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.search.dao.SearchDAO;
import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchGroupVO;
import com.seven.sins.search.vo.SearchMemberVO;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SearchDAO searchDao;
	
	@Override
	public ArrayList<SearchMemberVO> getMember(String userId, String word, int page, int count) {
		return searchDao.getMember(userId, word, page, count);
	}

	@Override
	public ArrayList<SearchChannelVO> getChannel(String userId, String word, int page, int count) {
		return searchDao.getChannel(userId, word, page, count);
	}

	@Override
	public ArrayList<SearchGroupVO> getGroup(String userId, String word, int page, int count) {
		return searchDao.getGroup(userId, word, page, count);
	}

	

	
}
