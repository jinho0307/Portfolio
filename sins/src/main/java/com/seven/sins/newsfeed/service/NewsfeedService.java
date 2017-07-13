package com.seven.sins.newsfeed.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.seven.sins.newsfeed.vo.NewsfeedVO;

public interface NewsfeedService {

	ArrayList<NewsfeedVO> selectNewsfeed(String userId);

}
