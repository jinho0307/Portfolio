package QnA.model.service;

import java.util.ArrayList;
import java.sql.*;
import static common.JDBCTemplate.*;

import QnA.model.dao.QDao;
import QnA.model.vo.Q;
import QnA.model.vo.QSearch;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class QService {
	public QService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Q> selectList() {
		Connection con = getConnection();
		ArrayList<Q> list = new QDao().selectList(con);
	
		close(con);
		return list;
	}

	public Q selectOne(int qNo) {
		Connection con = getConnection();
		Q q = new QDao().selectOne(con, qNo);
		
		close(con);
		return q;
	}

	public int alterQ(Q q) {
		Connection con = getConnection();
		int result = new QDao().alterQ(con, q);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	
	
	public int updateReadCount(int qNo) {
		Connection con = getConnection();
		int result = new QDao().updateReadCount(con, qNo);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int currentPage = new QDao().getListCount(con);
		
		close(con);
		return currentPage;
	}

	public ArrayList<Q> selectQList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Q> list = new QDao().selectList(con, currentPage, limit);
	
		close(con);
		return list;
	}

	public int insertQ(Q q) {
		Connection con = getConnection();
		int result = new QDao().insertQ(con, q);
		if(result > 0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	}

	public int getSearchListCount(QSearch search) {
		Connection con = getConnection();
		int result = new QDao().getSearchListCount(con, search);
		
		close(con);
		return result;
	}

	public ArrayList<Q> searchQ(QSearch search, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Q> list = new QDao().searchQ(con, search, currentPage, limit);
		
		close(con);
		return list;
	}

	public int insertAnswer(String answer, int qNo) {
		Connection con = getConnection();
		int result = new QDao().insertAnswer(con, answer, qNo);
		if(result > 0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	
	}
}
