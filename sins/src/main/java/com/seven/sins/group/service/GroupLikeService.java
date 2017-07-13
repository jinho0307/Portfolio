package com.seven.sins.group.service;

import java.util.*;
import com.seven.sins.group.vo.GroupLikeVO;

public interface GroupLikeService {
	// 좋아요 리스트.
	public ArrayList<GroupLikeVO> groupLikeList(GroupLikeVO vo);
	
	// 좋아요.
	public int groupLike(GroupLikeVO vo);
	
	// 좋아요 취소.
	public int groupUnlike(GroupLikeVO vo);
	
	// 좋아요 갯수.
	public int countGroup(GroupLikeVO vo);
}
