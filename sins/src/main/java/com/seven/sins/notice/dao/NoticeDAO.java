package com.seven.sins.notice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.notice.vo.NoticeVO;
import com.seven.sins.qna.vo.QnaContent;

@Repository("noticeDAO")
public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "Notice.";

	public int getListCount() {
		return (int)sqlSession.selectOne(NAMESPACE + "getListCount");
	}

	@SuppressWarnings("unchecked")
	public List<NoticeVO> selectNotice(int currentPage, int listLimit) {
		int startRow = (currentPage - 1) * listLimit;
	    RowBounds rowbounds = new RowBounds(startRow, listLimit);

		return (List<NoticeVO>) sqlSession.selectList(NAMESPACE + "selectList", null, rowbounds);

	}

	public void increaseCount(int nNo) {
		sqlSession.update(NAMESPACE+"addReadCount", nNo);
	}

	public NoticeVO getNotice(int nNo) {
		return (NoticeVO) sqlSession.selectOne(NAMESPACE+"noticeDetail", nNo);
	}

	public void noticeDelete(int no) {

		sqlSession.delete(NAMESPACE+"noticeDelete", no);
	}

	public void noticeUpdate(NoticeVO notice) {
		sqlSession.update(NAMESPACE+"noticeUpdate", notice);
	}

	public void noticeWrite(NoticeVO notice) {
		sqlSession.insert(NAMESPACE+"noticeWrite", notice);
	}


	
}
