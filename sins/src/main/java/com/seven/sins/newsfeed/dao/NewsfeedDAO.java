package com.seven.sins.newsfeed.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.mypage.vo.MypageVO;
import com.seven.sins.newsfeed.vo.NewsfeedVO;

@Repository("NewsfeedDAO")
public class NewsfeedDAO {
	
	
	
private static final String NAMESPACE = "newsfeed.";

	
	@Autowired
	private SqlSession sqlSession;
	

	public ArrayList<NewsfeedVO> selectNewsfeed(String userId) {
		// TODO Auto-generated method stub
		return (ArrayList<NewsfeedVO>)sqlSession.selectList("newsfeed.selectNewsfeed", userId);
	}

}
