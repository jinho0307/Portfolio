package notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;
import notice.model.vo.Search;

public class NoticeDao {
	public NoticeDao() {}

	// 헤더 메뉴에서 공지사항 클릭하면 리스트 보여주기 처리
	public ArrayList<Notice> selectList(Connection con) {
		ArrayList<Notice> list = new ArrayList<Notice>();

		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from notice order by notice_no desc";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				Notice notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setCinemaId(rset.getString("cinema_id"));
				notice.setReadCount(rset.getInt("read_count"));
				notice.setCategory(rset.getString("category"));
				notice.setUserId(rset.getString("user_id"));
				notice.setNoticeDate(rset.getDate("notice_date"));

				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	// 공지사항 선택시 하나의 글 자세히보기
	public Notice selectOne(Connection con, int noticeNo) {
		Notice notice = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;

		String query = "select * from notice where notice_no = ?";

		try {
			stmt = con.prepareStatement(query);
			stmt.setInt(1, noticeNo);

			rset = stmt.executeQuery();

			if (rset.next()) {
				notice = new Notice();

				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setCinemaId(rset.getString("cinema_id"));
				notice.setReadCount(rset.getInt("read_count"));
				notice.setCategory(rset.getString("category"));
				notice.setUserId(rset.getString("user_id"));
				notice.setNoticeDate(rset.getDate("notice_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return notice;
	}

	// 공지사항 조회수 증가 처리
	public int updateReadCount(Connection con, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update notice set read_count = "
				+ "(select read_count + 1 from notice where notice_no = ?) " + "where notice_no = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.setInt(2, noticeNo);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> searchNotice(Connection con, Search search, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<Notice>();

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
			query = "select * from (select rownum rnum, nt.* from "
					+ "( select * from notice where category like ? "
					+ "and cinema_id like ? and notice_title like ? "
					+ "order by notice_no desc) nt) where rnum >= ? and rnum <= ?";
		
		} else if(sType.equals("content")) { // 내용 검색
			query = "select * from (select rownum rnum, nt.* from "
					+ "( select * from notice where category like ? "
					+ "and cinema_id like ? and notice_content like ? "
					+ "order by notice_no desc) nt) where rnum >= ? and rnum <= ?";
	
		} else {	// 제목 + 내용 검색
			query = "select * from (select rownum rnum, nt.* from "
					+ "( select * from notice where category like ? "
					+ "and cinema_id like ? and (notice_title like ? "
					+ "or notice_content like ? ) order by notice_no desc) nt) "
					+ "where rnum >= ? and rnum <= ?";
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
				Notice notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setCinemaId(rset.getString("cinema_id"));
				notice.setReadCount(rset.getInt("read_count"));
				notice.setCategory(rset.getString("category"));
				notice.setUserId(rset.getString("user_id"));
				notice.setNoticeDate(rset.getDate("notice_date"));

				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from notice";

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

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 최신글 맨 위에 오게하고, 해당 페이지에 보여질 목록 10개를 조회.
		String query = "select * from (select rownum rnum, notice_no, "
				+ "notice_title, user_id, notice_content, notice_date, "
				+ "read_count, cinema_id, category from (select * from notice "
				+ "order by notice_no desc)) where rnum >= ? and rnum <= ? ";

		// 읽기 시작할 행 번호
		int startRow = (currentPage - 1) * limit + 1;
		// 읽을 마지막 행 번호
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {//TODO
				Notice notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setCinemaId(rset.getString("cinema_id"));
				notice.setReadCount(rset.getInt("read_count"));
				notice.setCategory(rset.getString("category"));
				notice.setUserId(rset.getString("user_id"));
				notice.setNoticeDate(rset.getDate("notice_date"));

				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into notice values "
				+ "(seq_notice.nextval, ?, ?, ?, default, ?, ?, sysdate, ?, ?)";
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getCinemaId());
			pstmt.setString(4, notice.getCategory());
			pstmt.setString(5, notice.getUserId());
			pstmt.setString(6, notice.getOriginalFilepath());
			pstmt.setString(7, notice.getRenameFilepath());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> getMyList(Connection con, String myId) {
		ArrayList<Notice> list = new ArrayList<Notice>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from notice where user_id = ? ";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, myId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setCinemaId(rset.getString("cinema_id"));
				notice.setReadCount(rset.getInt("read_count"));
				notice.setCategory(rset.getString("category"));
				notice.setUserId(rset.getString("user_id"));
				notice.setNoticeDate(rset.getDate("notice_date"));

				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int alterNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update notice set notice_title = ?, notice_content = ?, cinema_id = ?, "
				+ "category = ?, originalfilepath = ?, renamefilepath = ? where notice_no = ? ";
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getCinemaId());
			pstmt.setString(4, notice.getCategory());
			pstmt.setString(5, notice.getOriginalFilepath());
			pstmt.setString(6, notice.getRenameFilepath());
			pstmt.setInt(7, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection con, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete notice where notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getSearchListCount(Connection con, Search search) {
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
			query = "select count( * ) from notice where category like ? and "
					+ "cinema_id like ? and notice_title like ? order by notice_no desc";
		
		else if (search.getSearchType().equals("content"))
			query = "select count( * ) from notice where category like ? and "
					+ "cinema_id like ? and notice_content like ? order by notice_no desc";
		
		else
			query = "select count( * ) from notice where category like ? and "
					+ "cinema_id like ? and ( notice_title like ? or notice_content like ? ) "
					+ "order by notice_no desc";
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

	public int myListCount(Connection con, String myId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select count(*) from notice where user_id = ? ";

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, myId);
			
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

	public ArrayList<NoticeComment> commentList(Connection con, int noticeNo, int limit, int start) {
		ArrayList<NoticeComment> list = new ArrayList<NoticeComment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, ct.* "
				+ " from (select * from notice_comment "
				+ "where notice_no = ? order by comment_no desc) ct) "
				+ "where rnum >= ? and rnum <= ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, start + limit - 1);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				NoticeComment comment = new NoticeComment();
				comment.setCommentNo(rset.getInt("comment_no"));
				comment.setCommentContent(rset.getString("comment_content"));
				comment.setUserId(rset.getString("user_id"));
				comment.setCommentDate(rset.getDate("comment_date"));
				comment.setNoticeNo(rset.getInt("notice_no"));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertComment(Connection con, int noticeNo, String content, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into notice_comment values(seq_ncomment.nextval, "
				+ " ?, ?, ?, sysdate ) ";
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, userId);
			pstmt.setInt(2, noticeNo);
			pstmt.setString(3, content);
		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getCommentSize(Connection con, int noticeNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select count(*) from notice_comment where notice_no = ? ";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
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
}
