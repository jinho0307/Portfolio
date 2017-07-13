package QnA.model.dao;

import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import QnA.model.vo.Q;
import QnA.model.vo.QSearch;

public class QDao {

	public ArrayList<Q> selectList(Connection con) {
		ArrayList<Q> list = new ArrayList<Q>();

		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from qna order by q_no desc";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				Q q = new Q();
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setCinemaId(rset.getString("cinema_id"));
				q.setqReadCount(rset.getInt("read_count"));
				q.setqCategory(rset.getString("category"));
				q.setUserId(rset.getString("user_id"));
				q.setqDate(rset.getDate("q_date"));
				q.setAnswer(rset.getString("q_answer"));

				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Q selectOne(Connection con, int qNo) {
		Q q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from qna where q_no = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q = new Q();

				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setCinemaId(rset.getString("cinema_id"));
				q.setqReadCount(rset.getInt("read_count"));
				q.setqCategory(rset.getString("category"));
				q.setUserId(rset.getString("user_id"));
				q.setqDate(rset.getDate("q_date"));
				q.setAnswer(rset.getString("q_answer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public int updateReadCount(Connection con, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update qna set read_count = " + "(select read_count + 1 from qna where q_no = ?) "
				+ "where q_no = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qNo);
			pstmt.setInt(2, qNo);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from qna";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Q> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Q> list = new ArrayList<Q>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 최신글 맨 위에 오게하고, 해당 페이지에 보여질 목록 10개를 조회.
		String query = "select * from (select rownum rnum, q_no, "
				+ "q_title, user_id, q_content, q_date, "
				+ "read_count, cinema_id, category, q_answer from (select * from qna "
				+ "order by q_no desc)) where rnum >= ? and rnum <= ? ";

		// 읽기 시작할 행 번호
		int startRow = (currentPage - 1) * limit + 1;
		// 읽을 마지막 행 번호
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Q q = new Q();
				
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setCinemaId(rset.getString("cinema_id"));
				q.setqReadCount(rset.getInt("read_count"));
				q.setqCategory(rset.getString("category"));
				q.setUserId(rset.getString("user_id"));
				q.setqDate(rset.getDate("q_date"));
				q.setAnswer(rset.getString("q_answer"));
				
				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertQ(Connection con, Q q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into qna values "
				+ "(seq_q.nextval, ?, ?, ?, default, ?, ?, sysdate, default)";
	
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getCinemaId());
			pstmt.setString(4, q.getqCategory());
			pstmt.setString(5, q.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


	public int getSearchListCount(Connection con, QSearch search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "";
		
		String sCinema = search.getSearchCinema();
		String sCategory = search.getSearchCategory();
		
		if(sCinema.equals("전체"))
			sCinema = "";
		if(sCategory.equals("전체"))
			sCategory = "";
		
		if (search.getSearchType().equals("title"))
			query = "select count( * ) from qna where category like ? and "
					+ "cinema_id like ? and q_title like ? order by q_no desc";
		else if (search.getSearchType().equals("content"))
			query = "select count( * ) from qna where category like ? and "
					+ "cinema_id like ? and q_content like ? order by q_no desc";
		else
			query = "select count( * ) from qna where category like ? and "
					+ "cinema_id like ? and ( q_title like ? or q_content like ? ) "
					+ "order by q_no desc";

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + sCategory + "%");
			pstmt.setString(2,  "%" + sCinema + "%");
						
			// 제목 검색
			if (search.getSearchType().equals("title")) {
				pstmt.setString(3, "%" + search.getSearchText() + "%");
			
			// 내용 검색
			} else if (search.getSearchType().equals("content")) {
				pstmt.setString(3, "%" + search.getSearchText() + "%");
			
			// 제목 + 내용 검색
			} else {
				pstmt.setString(3, "%" + search.getSearchText() + "%");
				pstmt.setString(4, "%" + search.getSearchText() + "%");
			}
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Q> searchQ(Connection con, QSearch search, int currentPage, int limit) {
		ArrayList<Q> list = new ArrayList<Q>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 읽기 시작할 행 번호
		int startRow = (currentPage - 1) * limit + 1;
		// 읽을 마지막 행 번호
		int endRow = startRow + limit - 1;			
				
		String query = "";
				
		String sText = search.getSearchText();
		String sType = search.getSearchType();
		String sCinema = search.getSearchCinema();
		String sCategory = search.getSearchCategory();

		if(sCinema.equals("전체"))
			sCinema = "";
		if(sCategory.equals("전체"))
			sCategory = "";

		if(sType.equals("title")){ //제목 검색
			query = "select * from (select rownum rnum, qt.* "
					+ "from (select * from qna where category "
					+ "like ? and cinema_id like ? and q_title "
					+ "like ? order by q_no desc) qt ) "
					+ "where rnum >= ? and rnum <= ? ";
		
		} else if(sType.equals("content")) { // 내용 검색
			query = "select * from (select rownum rnum, qt.* "
					+ "from (select * from qna where category "
					+ "like ? and cinema_id like ? and q_content "
					+ "like ? order by q_no desc) qt ) "
					+ "where rnum >= ? and rnum <= ? ";
	
		} else {	// 제목 + 내용 검색
			query = "select * from (select rownum rnum, qt.* "
					+ "from (select * from qna where category "
					+ "like ? and cinema_id like ? and (q_title "
					+ "like ? or q_content like ? ) order by q_no desc) qt ) "
					+ "where rnum >= ? and rnum <= ? ";
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			// 공통 (category, cinemaId)
			pstmt.setString(1, "%" + sCategory + "%");
			pstmt.setString(2,  "%" + sCinema + "%");
			
			if(sType.equals("title")){	//제목 검색
				pstmt.setString(3, "%" + sText + "%");
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			
			} else if(sType.equals("content")){	//내용 검색
				pstmt.setString(3, "%" + sText + "%");
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
		
			} else {	// 제목 + 내용 검색
				pstmt.setString(3, "%" + sText + "%");
				pstmt.setString(4, "%" + sText + "%");
				pstmt.setInt(5, startRow);
				pstmt.setInt(6, endRow);
			}

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Q q = new Q();
				q.setqNo(rset.getInt("q_no"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setCinemaId(rset.getString("cinema_id"));
				q.setqReadCount(rset.getInt("read_count"));
				q.setqCategory(rset.getString("category"));
				q.setUserId(rset.getString("user_id"));
				q.setqDate(rset.getDate("q_date"));

				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertAnswer(Connection con, String answer, int qNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qna set q_answer = ? where q_no = ? ";
	
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, answer);
			pstmt.setInt(2, qNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int alterQ(Connection con, Q q) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update qna set q_title = ?, q_content = ?, category = ?, cinema_id = ? "
				+ "where q_no = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getqCategory());
			pstmt.setString(4, q.getCinemaId());
			pstmt.setInt(5, q.getqNo());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
