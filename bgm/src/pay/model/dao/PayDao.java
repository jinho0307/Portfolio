package pay.model.dao;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;
import pay.model.vo.Cash;

public class PayDao {

	public PayDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int chargeCash(Connection conn, String userid, int amount) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into pay values(?, null, null, ?, to_date(sysdate, 'yyyy/MM/dd'))";
		
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, amount);
			
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Cash> selectOne(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cash> list = new ArrayList<Cash>();
		String query = "select * from pay where user_id = ? order by use_date desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Cash cash = new Cash();
				cash.setUserId(rset.getString("USER_ID"));
				cash.setCompany_no(rset.getInt("NEWPAPER_NO"));
				cash.setMovieId(rset.getString("MOVIE_ID"));
				cash.setCash(rset.getInt("CASH"));
				cash.setUser_date(rset.getDate("USE_DATE"));
							
				list.add(cash);
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getlistCountOne(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "select count(*) from pay where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Cash> selectOne(Connection conn, String userid, int currentPage, int limit, String selectitem) {
		ArrayList<Cash> list = new ArrayList<Cash>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		if(selectitem == null){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("charge")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and cash > 0 order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("use")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and cash < 0 order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("mov")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and MOVIE_ID is not null order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("news")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and NEWPAPER_NO is not null order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("1month")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and use_date > add_months(sysdate,-1) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("6month")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and use_date > add_months(sysdate,-6) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else{
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where user_id = ? and use_date > add_months(sysdate,-12) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}
			
		
		
		int startRow = (currentPage -1) * limit +1;
		
		int endRow = startRow + limit -1;

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			

			
			while(rset.next()){
				Cash cash = new Cash();
				cash.setUserId(rset.getString("USER_ID"));
				cash.setCompany_no(rset.getInt("NEWPAPER_NO"));
				cash.setMovieId(rset.getString("MOVIE_ID"));
				cash.setCash(rset.getInt("CASH"));
				cash.setUser_date(rset.getDate("USE_DATE"));
							
				list.add(cash);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getlistCountOne(Connection conn, String userid, String selectitem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		ResultSet rset = null;
		if(selectitem == null){
			query = "select count(*) from pay where user_id = ?";	
		}else if(selectitem.equals("charge")){
			query = "select count(*) from pay where user_id = ? and cash > 0";
		}else if(selectitem.equals("use")){
			query ="select count(*) from pay where user_id = ? and cash < 0";
		}else if(selectitem.equals("mov")){
			query ="select count(*) from pay where user_id = ? and MOVIE_ID not null";
		}else if(selectitem.equals("news")){
			query ="select count(*) from pay where user_id = ? and NEWPAPER_NO not null";
		}else if(selectitem.equals("1month")){
			query ="select count(*) from pay where user_id = ? and use_date > add_months(sysdate,-1)";
		}else if(selectitem.equals("6month")){
			query ="select count(*) from pay where user_id = ? and use_date > add_months(sysdate,-6)";
		}else{
			query ="select count(*) from pay where user_id = ? and use_date > add_months(sysdate,-12)";			
		}

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);

		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Cash> selectOne(Connection conn, int currentPage, int limit, String selectitem) {
		ArrayList<Cash> list = new ArrayList<Cash>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		
		int startRow = (currentPage -1) * limit +1;
		
		int endRow = startRow + limit -1;

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			

			
			while(rset.next()){
				Cash cash = new Cash();
				cash.setUserId(rset.getString("USER_ID"));
				cash.setCompany_no(rset.getInt("NEWPAPER_NO"));
				cash.setMovieId(rset.getString("MOVIE_ID"));
				cash.setCash(rset.getInt("CASH"));
				cash.setUser_date(rset.getDate("USE_DATE"));
							
				list.add(cash);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getMoveiMoney(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select sum(cash) from pay where movie_id is not null";
		
		try {
			stmt = conn.createStatement();
					
			rset = stmt.executeQuery(query);
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(stmt);
		}
		
		return result;
	}
	
	public int getNewsMoney(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select sum(cash) from pay where NEWPAPER_NO is not null";
		
		try {
			stmt = conn.createStatement();
					
			rset = stmt.executeQuery(query);
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(stmt);
		}
		
		return result;
	}

	public int getTotalMoney(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select sum(cash) from pay where cash > 0";
		
		try {
			stmt = conn.createStatement();
					
			rset = stmt.executeQuery(query);
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<Cash> selectAll(Connection conn, int currentPage, int limit, String selectitem) {
		ArrayList<Cash> list = new ArrayList<Cash>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		if(selectitem == null){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("charge")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where cash > 0 order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("use")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where and cash < 0 order by use_date desc)) where RNUM >=? AND RNUM <= ?";
		}else if(selectitem.equals("mov")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where MOVIE_ID is not null order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("news")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where NEWPAPER_NO is not null order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("1month")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where use_date > add_months(sysdate,-1) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else if(selectitem.equals("6month")){
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where use_date > add_months(sysdate,-6) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}else{
			query = "select * from (select ROWNUM rnum,USER_ID,NEWPAPER_NO, MOVIE_ID, CASH, USE_DATE  from (select * from pay where use_date > add_months(sysdate,-12) order by use_date desc)) where RNUM >=? AND RNUM <= ? ";
		}
			
		
		
		int startRow = (currentPage -1) * limit +1;
		
		int endRow = startRow + limit -1;

		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			

			
			while(rset.next()){
				Cash cash = new Cash();
				cash.setUserId(rset.getString("USER_ID"));
				cash.setCompany_no(rset.getInt("NEWPAPER_NO"));
				cash.setMovieId(rset.getString("MOVIE_ID"));
				cash.setCash(rset.getInt("CASH"));
				cash.setUser_date(rset.getDate("USE_DATE"));
							
				list.add(cash);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getlistCountAll(Connection conn, String selectitem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		ResultSet rset = null;
		System.out.println(selectitem);
		if(selectitem == null){
			query = "select count(*) from pay";	
		}else if(selectitem.equals("charge")){
			query = "select count(*) from pay where cash > 0";
		}else if(selectitem.equals("use")){
			query ="select count(*) from pay where cash < 0";
		}else if(selectitem.equals("mov")){
			query ="select count(*) from pay where MOVIE_ID not null";
		}else if(selectitem.equals("news")){
			query ="select count(*) from pay where NEWPAPER_NO not null";
		}else if(selectitem.equals("1month")){
			query ="select count(*) from pay where use_date > add_months(sysdate,-1)";
		}else if(selectitem.equals("6month")){
			query ="select count(*) from pay where use_date > add_months(sysdate,-6)";
		}else{
			query ="select count(*) from pay where use_date > add_months(sysdate,-12)";			
		}

		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);

		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int getNetrofitMoney(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select sum(cash) from pay where cash < 0";
		
		try {
			stmt = conn.createStatement();
					
			rset = stmt.executeQuery(query);
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(stmt);
		}
		
		return result;
	}

	public int chargeCash(Connection conn, String userid, String movieid, int price) {
		  int result = 0;
	      PreparedStatement pstmt = null;
	      String query = "insert into pay values(?, null, ?, ?, to_date(sysdate, 'yyyy/MM/dd'))";
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, userid);
	         pstmt.setString(2, movieid);
	         pstmt.setInt(3, price);
	         
	         result = pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         close(pstmt);
	      }
	      
	      return result;
	}

	
	public int chargeCash(Connection conn, String userid, int comid, int price) {
		  int result = 0;
	      PreparedStatement pstmt = null;
	      String query = "insert into pay values(?, ?, null, ?, to_date(sysdate, 'yyyy/MM/dd'))";
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, userid);
	         pstmt.setInt(2, comid);
	         pstmt.setInt(3, price);
	         
	         result = pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         close(pstmt);
	      }
	      
	      return result;
	}
}
