package reserve.model.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import movie.model.vo.Movie;
import reserve.model.vo.*;
import reserve.model.vo.Time;
import static common.JDBCTemplate.*;

public class ReserveDao {

	public ReserveDao() {}

	public ArrayList<Time> reserveDate(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Time> list = new ArrayList<Time>();
		
		String query = "select distinct TIME_INDEX, SHOW_TIME from time where show_time - sysdate < 30";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs != null){
				while(rs.next()){
					Time t = new Time();
					
					t.setTimeIndex(rs.getInt("TIME_INDEX"));
					t.setShowTime(rs.getString("SHOW_TIME"));
					
					list.add(t);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList<Movie> MovieList(Connection conn) {
		ArrayList<Movie> list = new ArrayList<Movie>();
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select * from movie";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				Movie m = new Movie();
				m.setmId(rs.getString("MOVIE_ID"));
				m.setmName(rs.getString("MOVIE_NAME"));
				m.setmDate(rs.getDate("MOVIE_DATE"));
				m.setmDirector(rs.getString("MOVIE_DIRECTOR"));
				m.setmCast(rs.getString("MOVIE_CAST"));
				m.setmGenre(rs.getString("MOVIE_GENRE"));
				m.setmAge(rs.getString("MOVIE_AGE"));
				m.setmSite(rs.getString("MOVIE_SITE"));
				m.setmPlot(rs.getString("MOVIE_PLOT"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Cinema> cinemaList(Connection conn) {
		ArrayList<Cinema> list = new ArrayList<Cinema>();
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select * from cinema";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				Cinema c = new Cinema();
				c.setCinemaId(rs.getString("CINEMA_ID"));
				c.setCinemaName(rs.getString("CINEMA_NAME"));
				c.setCinemaGps(rs.getString("CINEMA_GPS"));

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Cinema> getCinemaList(Connection conn, String str) {
		ArrayList<Cinema> list = new ArrayList<Cinema>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from cinema where cinema_id in "
						+ "(select cinema_id from relation where movie_id = "
						+ "(select movie_id from movie where movie_name = ? ))";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Cinema c = new Cinema();
				c.setCinemaId(rs.getString("CINEMA_ID"));
				c.setCinemaName(rs.getString("CINEMA_NAME"));
				c.setCinemaGps(rs.getString("CINEMA_GPS"));

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Time> getTimeList(Connection conn, String mname, String cname) {
		ArrayList<Time> list = new ArrayList<Time>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select time_index, SHOW_TIME from time "
				 + "where time_index in (SELECT TIME_INDEX FROM relation "
                + "WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ? )) "
				 + "AND TIME_INDEX IN (SELECT TIME_INDEX FROM relation "
                + "WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ? )) order by show_time asc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mname);
			pstmt.setString(2, cname);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				Time t = new Time();
				t.setTimeIndex(rs.getInt("time_index"));
				t.setShowTime(rs.getString(2));
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Temp> getTempList(Connection conn, String mname, String cname, String dname) {
		ArrayList<Temp> list = new ArrayList<Temp>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT SCREEN_ROOM_NAME, TO_CHAR(SHOW_TIME, 'HH24:MI') " 
					 + "FROM relation " 
					 + "JOIN TIME USING (TIME_INDEX) "
					 + "JOIN SCREEN USING (SCREEN_ROOM_ID, CINEMA_ID) "
					 + "WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ? ) "
					 + "AND MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ? ) "
					 + "AND TIME_INDEX IN ( SELECT TIME_INDEX FROM relation WHERE MOVIE_ID =  ( SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ? )) "
					 + "AND TO_CHAR(SHOW_TIME, 'YYYY-MM-DD') = ? " 
					 + "ORDER BY 1 asc, 2 ASC ";
					
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cname);
			pstmt.setString(2, mname);
			pstmt.setString(3, mname);
			pstmt.setString(4, dname);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				Temp t = new Temp();
				
				t.setScreenRoomName(rs.getString(1));
				t.setTime(rs.getString(2));
				
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public int getCnt(Connection conn, String screenRoomName, String time, String mname, String cname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = "SELECT COUNT(SEAT) "
					 + "FROM RESERVE "
					 + "WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ? ) "
					 + "AND SCREEN_ROOM_ID = (SELECT SCREEN_ROOM_ID FROM SCREEN WHERE SCREEN_ROOM_NAME = ? ) "
					 + "AND MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ? ) "
					 + "AND TIME_INDEX = (SELECT TIME_INDEX FROM TIME WHERE TO_CHAR(SHOW_TIME, 'YYYY-MM-DD HH24:MI') = ?) ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cname);
			pstmt.setString(2, screenRoomName);
			pstmt.setString(3, mname);
			pstmt.setString(4, time);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public String getScreenRoom(Connection conn, String movie, String cname, String date) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sname = null;
		String query = "SELECT SCREEN_ROOM_NAME FROM SCREEN WHERE SCREEN_ROOM_ID IN (SELECT SCREEN_ROOM_ID FROM RELATION "
					 + "WHERE MOVIE_ID IN (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ?) "
					 + "AND CINEMA_ID IN (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ?) "
					 + "AND TIME_INDEX IN (SELECT TIME_INDEX FROM TIME WHERE  TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') = ?))";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie);
			pstmt.setString(2, cname);
			pstmt.setString(3, date);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sname = rs.getString("SCREEN_ROOM_NAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return sname;
	}

	public String getMoviePoster(Connection conn, String movie) {
		String mpname = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MOVIE_POSTER FROM MOVIE_FILELINK WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ?)";
                              
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mpname = rs.getString("MOVIE_POSTER");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return mpname;
	}

	public String[] getSeat(Connection conn, String movie, String cname, String date,  String screen) {
		int index = new ReserveDao().getReserveSeatCount(movie, cname, date);
		String[] ssar = new String[index];
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT SEAT FROM RESERVE WHERE MOVIE_ID = (SELECT MOVIE_ID "
				     + "FROM MOVIE WHERE MOVIE_NAME = ? ) " 
					 + "AND CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ? ) " 
					 + "AND TIME_INDEX IN (SELECT TIME_INDEX FROM TIME "
				     + "WHERE TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') = ? ) "
					 + "AND SCREEN_ROOM_ID = (SELECT SCREEN_ROOM_ID FROM SCREEN WHERE SCREEN_ROOM_NAME = ? ) "; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie);
			pstmt.setString(2, cname);
			pstmt.setString(3, date);
			pstmt.setString(4, screen);
			
			rs = pstmt.executeQuery();
			
			int x=0;
			
			while(rs.next()){
				ssar[x] = rs.getString(1);
				x++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ssar;
	}

	private int getReserveSeatCount(String movie, String cname, String date) {
		Connection conn = getConnection();
		int index = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM RESERVE WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE "
				 + "WHERE MOVIE_NAME = ? ) AND CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA "
				 + "WHERE CINEMA_NAME = ?) AND TIME_INDEX IN (SELECT TIME_INDEX FROM TIME "
				 + "WHERE TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') = ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie);
			pstmt.setString(2, cname);
			pstmt.setString(3, date);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				index = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return index;
	}

	public String getMovieAge(Connection conn, String movie) {
		String mage = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MOVIE_AGE FROM MOVIE WHERE MOVIE_NAME = ? ";
                              
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movie);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mage = rs.getString("MOVIE_AGE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return mage;
	}

	public int setSeat(Connection conn, Reserve res) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query= "INSERT INTO RESERVE VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, res.getUserId());
			pstmt.setString(2, res.getCinemaId());
			pstmt.setInt(3, res.getTimeIndex());
			pstmt.setString(4, res.getScreenRoomId());
			pstmt.setString(5, res.getSeat());
			pstmt.setString(6, res.getMovieId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String getCinemaId(Connection conn, String cinemaName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String cinemaId = "";
		String query = "SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cinemaName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cinemaId = rs.getString("CINEMA_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return cinemaId;
	}

	public int getTimeIndex(Connection conn, String show_Time) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int timeIndex = 0;
		String query = "SELECT TIME_INDEX FROM TIME WHERE TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') = ?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, show_Time);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				timeIndex = rs.getInt("TIME_INDEX");
			}
			
			if(timeIndex == 0){
				timeIndex = new ReserveDao().insertTime(conn, show_Time);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return timeIndex;
	}

	private int insertTime(Connection conn, String show_Time) {
		PreparedStatement pstmt = null;
		int result = 0;
		String tmp[] = show_Time.split(" ");
		int year = Integer.parseInt(tmp[0].split("/")[0]);
		int month = Integer.parseInt(tmp[0].split("/")[1]) - 1;
		int day = Integer.parseInt(tmp[0].split("/")[2]);
		int hour = Integer.parseInt(tmp[1].split(":")[0]);
		int minute = Integer.parseInt(tmp[1].split(":")[1]);
		GregorianCalendar gcld = new GregorianCalendar(year, month, day, hour, minute);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd kk:mm");
		String strDate = sdf.format(gcld.getTime());
		
		
		String query = "INSERT INTO TIME VALUES (SEQ_TIME.NEXTVAL, TO_DATE( ? , 'YYYY/MM/DD HH24:MI'))";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, strDate);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String getMovieId(Connection conn, String movieName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String movieId = "";
		String query = "SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, movieName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				movieId = rs.getString("MOVIE_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return movieId;
	}

	public String getScreenRoomId(Connection conn, String cinemaName, String screenRoomName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String screenRoomId = "";
		String query = "SELECT SCREEN_ROOM_ID " 
					 + "FROM SCREEN " 
					 + "WHERE SCREEN_ROOM_NAME = ?  "
					 + "AND CINEMA_ID = ( SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ? )";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, screenRoomName);
			pstmt.setString(2, cinemaName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				screenRoomId = rs.getString("SCREEN_ROOM_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return screenRoomId;
	}

	public ArrayList<Reserve> getReserve(Connection conn, String loginUser) {
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM RESERVE WHERE USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUser);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reserve r = new Reserve();
				
				r.setUserId(rs.getString("USER_ID"));
				r.setCinemaId(rs.getString("CINEMA_ID"));
				r.setTimeIndex(rs.getInt("TIME_INDEX"));
				r.setScreenRoomId(rs.getString("SCREEN_ROOM_ID"));
				r.setSeat(rs.getString("SEAT"));
				r.setMovieId(rs.getString("MOVIE_ID"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ReserveName ReserveName(Connection conn, Reserve r){
		ReserveName rn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT ID, CINEMA_NAME, SCREEN_ROOM_NAME, MOVIE_NAME, SEAT, TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') "
					 + "FROM RESERVE "
				     + "JOIN BGM_USER ON (USER_ID = ID) "
				     + "JOIN MOVIE USING (MOVIE_ID) "
				     + "JOIN CINEMA USING (CINEMA_ID) "
				     + "JOIN SCREEN USING (SCREEN_ROOM_ID, CINEMA_ID) "
				     + "JOIN TIME USING (TIME_INDEX) "
				     + "WHERE ID = ? "
				     + "AND CINEMA_NAME = ( SELECT CINEMA_NAME FROM CINEMA WHERE CINEMA_ID = ? ) "
				     + "AND SCREEN_ROOM_NAME = (SELECT SCREEN_ROOM_NAME FROM SCREEN WHERE SCREEN_ROOM_ID = ? ) "
				     + "AND MOVIE_NAME = (SELECT MOVIE_NAME FROM MOVIE WHERE MOVIE_ID = ? ) "
				     + "AND SEAT = ? "
				     + "AND TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI') = (SELECT TO_CHAR(SHOW_TIME, 'YYYY/MM/DD HH24:MI' ) "
				     + "FROM TIME  WHERE TIME_INDEX = ? ) ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getCinemaId());
			pstmt.setString(3, r.getScreenRoomId());
			pstmt.setString(4, r.getMovieId());
			pstmt.setString(5, r.getSeat());
			pstmt.setInt(6, r.getTimeIndex());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				rn = new ReserveName();
		
				rn.setUserId(rs.getString(1));
				rn.setCinemaName(rs.getString(2));
				rn.setScreenRoomName(rs.getString(3));
				rn.setMovieName(rs.getString(4));
				rn.setSeat(rs.getString(5));
				rn.setShowTime(rs.getString(6));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return rn;
	}

	public int deleteReserve(Connection conn, Reserve r, String age) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM RESERVE WHERE USER_ID = ? AND CINEMA_ID = ? AND TIME_INDEX = ? AND SCREEN_ROOM_ID = ? AND SEAT = ? AND MOVIE_ID = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getCinemaId());
			pstmt.setInt(3, r.getTimeIndex());
			pstmt.setString(4, r.getScreenRoomId());
			pstmt.setString(5, r.getSeat()+"_"+age);
			pstmt.setString(6, r.getMovieId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int minusCash(Connection conn, String loginUser, reserveInfo ri, int price) {
		PreparedStatement pstmt = null;
		int result = 0;
		String movieId = new ReserveDao().getMovieId(conn, ri.getMovieName());
		String query = "INSERT INTO PAY VALUES (?, NULL, ?, ?, default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUser);
			pstmt.setString(2, movieId);
			pstmt.setInt(3, price);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int setMovieReserve(Connection conn, String a3, int seat) {
		PreparedStatement pstmt = null;
		int result = 0;
		String movieId = new ReserveDao().getMovieId(conn, a3);
		String query = "UPDATE MOVIE SET MOVIE_RESERVE = MOVIE_RESERVE + ? WHERE MOVIE_ID = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, seat);
			pstmt.setString(2, movieId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reserve> getReserveList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		String query = "SELECT USER_ID, CINEMA_ID, TIME_INDEX, SCREEN_ROOM_ID, SEAT, MOVIE_ID "
					 + "FROM RESERVE";
				
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				Reserve r = new Reserve();
				
				r.setUserId(rs.getString("USER_ID"));
				r.setCinemaId(rs.getString("CINEMA_ID"));
				r.setTimeIndex(rs.getInt("TIME_INDEX"));
				r.setScreenRoomId(rs.getString("SCREEN_ROOM_ID"));
				r.setSeat(rs.getString("SEAT"));
				r.setMovieId(rs.getString("MOVIE_ID"));
				
				list.add(r);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		
		return list;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM RESERVE";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = "";
		
		if(search.getSearchCategory().equals("1")){
			query = "SELECT COUNT(*) "
				  + "FROM RESERVE "
				  + "WHERE USER_ID LIKE ? ";
		}
		else if(search.getSearchCategory().equals("2")){
			query = "SELECT COUNT(*) "
			      + "FROM RESERVE "
				  + "WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME LIKE ?) ";
		}
		else if(search.getSearchCategory().equals("전체")){
			query = "SELECT COUNT(*) "
			      + "FROM RESERVE "
				  + "WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME LIKE ?) "
			      + "OR USER_ID LIKE ? OR CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME LIKE ?) ";
		}
		else {
			query = "SELECT COUNT(*) "
				  + "FROM RESERVE "
				  + "WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME LIKE ?) ";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			if(search.getSearchCategory().equals("전체")){
				pstmt.setString(1, "%" + search.getSearchText() + "%");
				pstmt.setString(2, "%" + search.getSearchText() + "%");
				pstmt.setString(3, "%" + search.getSearchText() + "%");
			}
			else{
				pstmt.setString(1, "%" + search.getSearchText() + "%");
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}

	public String[] getScreenRoom(Connection conn, String cname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] screen = new String[3];
		int x = 0;
		String query = "SELECT SCREEN_ROOM_NAME "
					 + "FROM SCREEN "
					 + "WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME = ?) ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cname);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				screen[x] = rs.getString(1);
				x++;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return screen;
	}

	public String getScreenRoomId(Connection conn, String screen) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String screenid = "";
		String query = "SELECT SCREEN_ROOM_ID FROM SCREEN WHERE SCREEN_ROOM_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, screen);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				screenid = rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return screenid;
	}

	public int serRelation(Connection conn, Relation r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO RELATION VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getScreenRoomId());
			pstmt.setInt(2, r.getTimeIndex());
			pstmt.setString(3, r.getMovieId());
			pstmt.setString(4, r.getCinemaId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Relation> getRelation(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Relation> list = new ArrayList<Relation>();
		String query = "SELECT * FROM RELATION";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				Relation r = new Relation();
				
				r.setCinemaId(rs.getString("CINEMA_ID"));
				r.setScreenRoomId(rs.getString("SCREEN_ROOM_ID"));
				r.setTimeIndex(rs.getInt("TIME_INDEX"));
				r.setMovieId(rs.getString("MOVIE_ID"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<RelationName> getRelationName(Connection conn, String cname, String mname, String date) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RelationName> rnlist = new ArrayList<RelationName>();
		String query = "SELECT CINEMA_NAME, SCREEN_ROOM_NAME, MOVIE_NAME, TO_CHAR(SHOW_TIME, 'YY/MM/DD HH24:MI') "
					 + "FROM RELATION "
					 + "NATURAL JOIN SCREEN "
					 + "NATURAL JOIN CINEMA "
					 + "NATURAL JOIN MOVIE "
					 + "NATURAL JOIN TIME " 
					 + "WHERE CINEMA_NAME = ? "
					 + "AND TO_CHAR(SHOW_TIME, 'YY/MM/DD HH24:MI') LIKE ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cname);
			pstmt.setString(2, "%"+date+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				RelationName rn = new RelationName();
				rn.setCinemaName(rs.getString(1));
				rn.setMovieName(rs.getString(3));
				rn.setScreenRoomName(rs.getString(2));
				rn.setShowTime(rs.getString(4));
				
				rnlist.add(rn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return rnlist;
	}

	public ArrayList<Reserve> getReserveList(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		String query = "";
		
		if(search.getSearchCategory().equals("전체")){
			query = "SELECT USER_ID, CINEMA_ID, TIME_INDEX, SCREEN_ROOM_ID, SEAT, "
				  + "MOVIE_ID FROM RESERVE WHERE USER_ID LIKE ? OR MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME LIKE ? ) "
				  + "OR CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME LIKE ? ) ";
		}
		else if(search.getSearchCategory().equals("1")){
			query = "SELECT USER_ID, CINEMA_ID, TIME_INDEX, SCREEN_ROOM_ID, SEAT, "
					 + "MOVIE_ID FROM RESERVE WHERE USER_ID LIKE ? ";
		}
		else if(search.getSearchCategory().equals("2")){
			query = "SELECT ROWNUM RNUM, USER_ID, CINEMA_ID, TIME_INDEX, SCREEN_ROOM_ID, SEAT, "
				  + "MOVIE_ID FROM RESERVE WHERE MOVIE_ID = (SELECT MOVIE_ID FROM MOVIE WHERE MOVIE_NAME LIKE ? ) ";
		}
		else {
			query = "SELECT USER_ID, CINEMA_ID, TIME_INDEX, SCREEN_ROOM_ID, SEAT, "
				  + "MOVIE_ID FROM RESERVE WHERE CINEMA_ID = (SELECT CINEMA_ID FROM CINEMA WHERE CINEMA_NAME LIKE ? ) ";
		}
		
		try {
			if(!(search.getSearchCategory().equals("전체"))){
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + search.getSearchText() + "%");
			}
			else {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + search.getSearchText() + "%");
				pstmt.setString(2, "%" + search.getSearchText() + "%");
				pstmt.setString(3, "%" + search.getSearchText() + "%");
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reserve r = new Reserve();
				
				r.setUserId(rs.getString("USER_ID"));
				r.setCinemaId(rs.getString("CINEMA_ID"));
				r.setTimeIndex(rs.getInt("TIME_INDEX"));
				r.setScreenRoomId(rs.getString("SCREEN_ROOM_ID"));
				r.setSeat(rs.getString("SEAT"));
				r.setMovieId(rs.getString("MOVIE_ID"));
				
				list.add(r);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
}
