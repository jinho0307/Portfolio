package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.*;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;
import notice.model.vo.Search;

public class NoticeService {

	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con);

		close(con);
		return list;
	}

	public Notice selectOne(int noticeNo) {
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectOne(con, noticeNo);

		close(con);
		return notice;
	}

	

	public ArrayList<Notice> searchNotice(Search search, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchNotice(con, search, currentPage, limit);

		close(con);
		return list;
	}

	public int updateReadCount(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().updateReadCount(con, noticeNo);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int currentPage = new NoticeDao().getListCount(con);
		
		close(con);
		return currentPage;
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
	
		close(con);
		return list;
	}

	public int insertNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con, notice);
		if(result > 0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<Notice> getMyList(String myId) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().getMyList(con, myId);

		close(con);
		return list;
	}

	public int alterNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().alterNotice(con, notice);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().deleteNotice(con, noticeNo);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int getSearchListCount(Search search) {
		Connection con = getConnection();
		int listCount = new NoticeDao().getSearchListCount(con, search);
		
		close(con);
		return listCount;
	}

	public int myListCount(String myId) {
		Connection con = getConnection();
		int listCount = new NoticeDao().myListCount(con, myId);
		
		close(con);
		return listCount;
	}

	public ArrayList<NoticeComment> commentList(int noticeNo, int limit, int start) {
		Connection con = getConnection();
		ArrayList<NoticeComment> list = new NoticeDao().commentList(con, noticeNo, limit, start);
		
		close(con);
		return list;
	}

	public int insertComment(int noticeNo, String content, String userId) {
		Connection con = getConnection();
		int result = new NoticeDao().insertComment(con, noticeNo, content, userId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int getCommentSize(int noticeNo) {
		Connection con = getConnection();
		int count = new NoticeDao().getCommentSize(con, noticeNo);
		
		close(con);
		return count;
	}
}
