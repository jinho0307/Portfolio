package com.seven.sins.newsfeed.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.newsfeed.dao.NewsfeedDAO;
import com.seven.sins.newsfeed.vo.NewsfeedVO;
@Service("newsfeedService")
public class NewsfeedServiceImpl implements NewsfeedService{

	
	@Autowired
	private NewsfeedDAO newsfeedDAO;
	
	@Override
	public ArrayList<NewsfeedVO> selectNewsfeed(String userId) {
		return newsfeedDAO.selectNewsfeed(userId);
	}

}
