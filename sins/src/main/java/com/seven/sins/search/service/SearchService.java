package com.seven.sins.search.service;

import java.util.ArrayList;

import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchGroupVO;
import com.seven.sins.search.vo.SearchMemberVO;

public interface SearchService {

	ArrayList<SearchMemberVO> getMember(String userId, String word, int page, int count);

	ArrayList<SearchChannelVO> getChannel(String userId, String word, int page, int count);

	ArrayList<SearchGroupVO> getGroup(String userId, String word, int page, int count);


}
