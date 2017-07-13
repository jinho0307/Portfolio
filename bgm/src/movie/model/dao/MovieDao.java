package movie.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import member.model.vo.Member;
import movie.controller.MovieAllServlet;
import movie.model.vo.*;

public class MovieDao {

	public MovieDao(){}
	
	public Movie selectMovie(Connection con, String movieId){
		Movie movie= null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		
		String query = "select * from movie where movie_id = ?";
		String query2 = "select MOVIE_RESERVE from movie";
		 
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, movieId);
			rset = pstmt.executeQuery();
			int all=0;
			if (rset.next()) {
				movie = new Movie();
				
				movie.setmId(movieId);
				movie.setmName(rset.getString("MOVIE_NAME"));
				movie.setmDate(rset.getDate("MOVIE_DATE"));
				movie.setmDirector(rset.getString("MOVIE_DIRECTOR"));
				movie.setmCast(rset.getString("MOVIE_CAST"));
				movie.setmGenre(rset.getString("MOVIE_GENRE"));
				movie.setmAge(rset.getString("MOVIE_AGE"));
				movie.setmSite(rset.getString("MOVIE_SITE"));
				movie.setmPlot(rset.getString("MOVIE_PLOT"));
				movie.setmYN(rset.getInt("MOVIE_YN"));
				movie.setMovieReserve(rset.getInt("MOVIE_RESERVE"));
				movie.setmPay(rset.getInt("MOVIE_PAY"));
				pstmt2 = con.prepareStatement(query2);
				rset2 = pstmt2.executeQuery();
				while(rset2.next()){
					all+=rset2.getInt("MOVIE_RESERVE");
				}
				movie.setAll(all);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(rset2);
			close(pstmt);
			close(pstmt2);
		}
		
		return movie;
	}

	public MovieFileLink selectMovieFileLink(Connection con, String movieId) {
		MovieFileLink movieLink= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from MOVIE_FILELINK where movie_id = ?";
		
		
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, movieId);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				movieLink = new MovieFileLink();
				
				movieLink.setMovieId(movieId);
                movieLink.setMoviePoster(rset.getString("MOVIE_POSTER"));
                movieLink.setMovieImg1(rset.getString("MOVIE_IMG_1"));
                movieLink.setMovieImg2(rset.getString("MOVIE_IMG_2"));
                movieLink.setMovieImg3(rset.getString("MOVIE_IMG_3"));
                movieLink.setMovieImg4(rset.getString("MOVIE_IMG_4"));
                movieLink.setMovieImg5(rset.getString("MOVIE_IMG_5"));
                movieLink.setMovieImg6(rset.getString("MOVIE_IMG_6"));
                movieLink.setMovieImg7(rset.getString("MOVIE_IMG_7"));
                movieLink.setMovieImg8(rset.getString("MOVIE_IMG_8"));
				movieLink.setMovieMp4(rset.getString("MOVIE_MP4"));
                
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return movieLink;
	}

	public ArrayList<MovieFileLink> selectMoviePosterAll(Connection con) {
		ArrayList<MovieFileLink> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4, MOVIE_RESERVE from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where MOVIE_DATE <= sysdate AND MOVIE_YN = 1 order by cast( MOVIE_RESERVE as decimal ) desc";
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<MovieFileLink>();
				
				
				while(rset.next()){
					MovieFileLink movieLink = new MovieFileLink();
					
					movieLink.setMovieId(rset.getString("MOVIE_ID"));
	                movieLink.setMoviePoster(rset.getString("MOVIE_POSTER"));
	                movieLink.setMovieName(rset.getString("MOVIE_Name"));
					movieLink.setMovieMp4(rset.getString("MOVIE_MP4"));
				    movieLink.setMovieDate(rset.getDate("MOVIE_DATE"));
					movieLink.setMovieReserve(rset.getInt("MOVIE_RESERVE"));
			
				    resultMap.add(movieLink);
				   			}
				
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}

	public ArrayList<MovieFileLink> selectMoviePosterExpect(Connection con) {
		ArrayList<MovieFileLink> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4 from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where MOVIE_DATE > sysdate AND MOVIE_YN = 1 order by MOVIE_DATE";		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<MovieFileLink>();
				
				while(rset.next()){
					MovieFileLink movieLink = new MovieFileLink();
					
					movieLink.setMovieId(rset.getString("MOVIE_ID"));
	                movieLink.setMoviePoster(rset.getString("MOVIE_POSTER"));
	                movieLink.setMovieName(rset.getString("MOVIE_Name"));
					movieLink.setMovieMp4(rset.getString("MOVIE_MP4"));
				    movieLink.setMovieDate(rset.getDate("MOVIE_DATE"));
					
				    resultMap.add(movieLink);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}

	public ArrayList<Movie> selectMovieAllList(Connection con) {
		ArrayList<Movie> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from movie";
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<Movie>();
				
				while(rset.next()){
					Movie movie = new Movie();
					
					movie.setmId(rset.getString("MOVIE_ID"));
					movie.setmName(rset.getString("MOVIE_NAME"));
					movie.setmDate(rset.getDate("MOVIE_DATE"));
					movie.setmDirector(rset.getString("MOVIE_DIRECTOR"));
					movie.setmCast(rset.getString("MOVIE_CAST"));
					movie.setmGenre(rset.getString("MOVIE_GENRE"));
					movie.setmAge(rset.getString("MOVIE_AGE"));
					movie.setmSite(rset.getString("MOVIE_SITE"));
					movie.setmPlot(rset.getString("MOVIE_PLOT"));
					movie.setmYN(rset.getInt("MOVIE_YN"));
					movie.setmPay(rset.getInt("MOVIE_PAY"));
				
					resultMap.add(movie);
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}

	public int insertMovie(Connection con, Movie movie, MovieFileLink movieLink) {
		int result = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Statement stmt = null;
		ResultSet rset = null;
		String select= " select MOVIE_ID from MOVIE where MOVIE_ID =(select max(MOVIE_ID) from MOVIE)";
		String query = "insert into movie values (?, ?, ?, ?, ?, ?, ?, ?, ?, 1,0,?)";
		String query2 = "insert into MOVIE_FILELINK (MOVIE_POSTER, MOVIE_IMG_1, MOVIE_IMG_2, MOVIE_IMG_3, MOVIE_IMG_4, MOVIE_IMG_5, MOVIE_IMG_6, MOVIE_IMG_7, MOVIE_IMG_8, MOVIE_ID, MOVIE_MP4)values (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
            stmt = con.createStatement();
			rset = stmt.executeQuery(select);
			
			if(rset.next()){
			int mid = Integer.parseInt(rset.getString("MOVIE_ID"));
			
			String mid2 ="";
			if(mid<9){
			mid2+="00"+Integer.toString(mid+1);
			}else if(mid<99){
				mid2+="0"+Integer.toString(mid+1);
			}else{
				mid2+=Integer.toString(mid+1);
			}
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,mid2 );
			pstmt.setString(2, movie.getmName());
			pstmt.setDate(3, movie.getmDate());
			pstmt.setString(4, movie.getmDirector());
			pstmt.setString(5, movie.getmCast());
			pstmt.setString(6, movie.getmGenre());
			pstmt.setString(7, movie.getmAge());
			pstmt.setString(8, movie.getmSite());
			pstmt.setString(9, movie.getmPlot());
			pstmt.setInt(10, movie.getmPay());
			
			
		
			pstmt2 = con.prepareStatement(query2);
			pstmt2.setString(1, movieLink.getMoviePoster());
			pstmt2.setString(2, movieLink.getMovieImg1());
			pstmt2.setString(3, movieLink.getMovieImg2());
			pstmt2.setString(4, movieLink.getMovieImg3());
			pstmt2.setString(5, movieLink.getMovieImg4());
			pstmt2.setString(6, movieLink.getMovieImg5());
			pstmt2.setString(7, movieLink.getMovieImg6());
			pstmt2.setString(8, movieLink.getMovieImg7());
			pstmt2.setString(9, movieLink.getMovieImg8());
			pstmt2.setString(10, mid2);
			pstmt2.setString(11, movieLink.getMovieMp4());
			
			result = pstmt.executeUpdate();
			result = pstmt2.executeUpdate();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(pstmt2);
			close(rset);
			close(stmt);
		}	
		
		return result;
	}

	public int updateMovie(Connection con, Movie movie, MovieFileLink movieLink) {
		int result = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		String query = "UPDATE MOVIE SET MOVIE_ID=?, MOVIE_NAME=?, MOVIE_DATE=?, MOVIE_DIRECTOR=?, MOVIE_CAST=?, MOVIE_GENRE=?, MOVIE_AGE=?, MOVIE_SITE=?, MOVIE_PLOT=?, MOVIE_YN=?,MOVIE_PAY=?  where movie_id = ?";
		String query2 = "UPDATE MOVIE_FILELINK SET MOVIE_POSTER=?, MOVIE_IMG_1=?, MOVIE_IMG_2=?, MOVIE_IMG_3=?, MOVIE_IMG_4=?, MOVIE_IMG_5=?, MOVIE_IMG_6=?, MOVIE_IMG_7=?, MOVIE_IMG_8=?, MOVIE_MP4=? WHERE movie_id = ?";
		try {
			
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,movie.getmId());
			pstmt.setString(2, movie.getmName());
			pstmt.setDate(3, movie.getmDate());
			pstmt.setString(4, movie.getmDirector());
			pstmt.setString(5, movie.getmCast());
			pstmt.setString(6, movie.getmGenre());
			pstmt.setString(7, movie.getmAge());
			pstmt.setString(8, movie.getmSite());
			pstmt.setString(9, movie.getmPlot());
			pstmt.setInt(10, movie.getmYN());
			pstmt.setInt(11, movie.getmPay());
			pstmt.setString(12, movie.getmId());
			
			
		System.out.println(movieLink.getMoviePoster());
			pstmt2 = con.prepareStatement(query2);
			pstmt2.setString(1, movieLink.getMoviePoster());
			pstmt2.setString(2, movieLink.getMovieImg1());
			pstmt2.setString(3, movieLink.getMovieImg2());
			pstmt2.setString(4, movieLink.getMovieImg3());
			pstmt2.setString(5, movieLink.getMovieImg4());
			pstmt2.setString(6, movieLink.getMovieImg5());
			pstmt2.setString(7, movieLink.getMovieImg6());
			pstmt2.setString(8, movieLink.getMovieImg7());
			pstmt2.setString(9, movieLink.getMovieImg8());
			pstmt2.setString(10, movieLink.getMovieMp4());
			pstmt2.setString(11, movie.getmId());
			
			result = pstmt.executeUpdate();
			result = pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(pstmt2);
		}	
		
		return result;
	}

	public int deleteMovie(Connection con,String mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String query = "delete from Movie where Movie_id = ?";
		String query2 = "delete from Movie_FileLink where Movie_id = ?";
		try {
			pstmt2 = con.prepareStatement(query2);
			pstmt2.setString(1,mId);
			result = pstmt2.executeUpdate();
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,mId);
			result = pstmt.executeUpdate();
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(pstmt2);
		}
		
		return result;
	}

	public ArrayList<MovieFileLink> searchMovie(Connection con, String mId, String select) {
		ArrayList<MovieFileLink> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String search = "('%"+mId+"%')";
		String query ="";
		if(select.equals("1")){
			query += "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4, MOVIE_RESERVE, MOVIE_GENRE, MOVIE_DIRECTOR, MOVIE_CAST, MOVIE_AGE from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where Movie_name like "+search+" or MOVIE_DIRECTOR like"+search+" or MOVIE_GENRE like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else if(select.equals("2")){
			query += "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4, MOVIE_RESERVE, MOVIE_GENRE, MOVIE_DIRECTOR, MOVIE_CAST, MOVIE_AGE from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where Movie_name like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else if(select.equals("3")){
			query += "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4, MOVIE_RESERVE, MOVIE_GENRE, MOVIE_DIRECTOR, MOVIE_CAST, MOVIE_AGE from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where MOVIE_DIRECTOR like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else{
			query += "select MOVIE_POSTER, MOVIE_DATE, Movie_Name, MOVIE_ID , MOVIE_MP4, MOVIE_RESERVE, MOVIE_GENRE, MOVIE_DIRECTOR, MOVIE_CAST, MOVIE_AGE from MOVIE join MOVIE_FILELINK using(MOVIE_ID) where MOVIE_GENRE like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<MovieFileLink>();
				
				while(rset.next()){
					
					MovieFileLink movieLink = new MovieFileLink();
					
					movieLink.setMovieId(rset.getString("MOVIE_ID"));
	                movieLink.setMoviePoster(rset.getString("MOVIE_POSTER"));
	                movieLink.setMovieName(rset.getString("MOVIE_Name"));
					movieLink.setMovieMp4(rset.getString("MOVIE_MP4"));
				    movieLink.setMovieDate(rset.getDate("MOVIE_DATE"));
					movieLink.setMovieReserve(rset.getInt("MOVIE_RESERVE"));
				    movieLink.setmDirector(rset.getString("MOVIE_DIRECTOR"));
				    movieLink.setmGenre(rset.getString("MOVIE_GENRE"));
				    movieLink.setmCast(rset.getString("MOVIE_CAST"));
				    movieLink.setmAge(rset.getString("MOVIE_AGE"));
					
				    resultMap.add(movieLink);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}

	public ArrayList<Movie> searchMovie2(Connection con, String mId, String select) {
		ArrayList<Movie> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String search = "('%"+mId+"%')";
		String query ="";
		if(select.equals("1")){
			query += "select * from MOVIE where Movie_name like "+search+" or MOVIE_DIRECTOR like"+search+" or MOVIE_GENRE like "+search+"or MOVIE_id like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else if(select.equals("2")){
			query += "select * from MOVIE where Movie_name like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else if(select.equals("3")){
			query += "select * from MOVIE where MOVIE_DIRECTOR like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}else{
			query += "select * from MOVIE where MOVIE_GENRE like "+search+"order by cast( MOVIE_RESERVE as decimal ) desc";
		}
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<Movie>();
				
				while(rset.next()){
					
					Movie movie = new Movie();
					
					movie.setmId(rset.getString("MOVIE_ID"));
					movie.setmName(rset.getString("MOVIE_NAME"));
					movie.setmDate(rset.getDate("MOVIE_DATE"));
					movie.setmDirector(rset.getString("MOVIE_DIRECTOR"));
					movie.setmCast(rset.getString("MOVIE_CAST"));
					movie.setmGenre(rset.getString("MOVIE_GENRE"));
					movie.setmAge(rset.getString("MOVIE_AGE"));
					movie.setmSite(rset.getString("MOVIE_SITE"));
					movie.setmPlot(rset.getString("MOVIE_PLOT"));
					movie.setmYN(rset.getInt("MOVIE_YN"));
					movie.setmPay(rset.getInt("MOVIE_PAY"));
					
				    resultMap.add(movie);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}


	public int movieComment(Connection con, MovieComment mcomment) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		String select= " select C_NUMBER from MOVIE_COMMENT where C_NUMBER =(select max(C_NUMBER) from MOVIE_COMMENT)";
		String query = "insert into MOVIE_COMMENT values (?, ?, ?, ?, sysdate)";
		try {
            stmt = con.createStatement();
			rset = stmt.executeQuery(select);
			
			if(rset.next()){
				
			int cNumber = rset.getInt("C_NUMBER");
			
			int cNb=cNumber+1;
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,cNb );
			pstmt.setString(2, mcomment.getUserId());
			pstmt.setString(3, mcomment.getmId());
			pstmt.setString(4, mcomment.getmComment());
			
		
			
			result = pstmt.executeUpdate();
			
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
			close(stmt);
		}	
		
		return result;
	}

	public ArrayList<MovieComment> selectMovieComment(Connection con, String movieId) {
		ArrayList<MovieComment> resultMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from MOVIE_COMMENT where MOVIE_ID ="+movieId+" order by C_DATE desc";
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				resultMap = new ArrayList<MovieComment>();
				
				
				while(rset.next()){
					MovieComment mComment = new MovieComment();
					
					
					
					mComment.setcNumber(rset.getInt("C_NUMBER"));
					mComment.setUserId(rset.getString("USER_ID"));
					mComment.setmId(rset.getString("MOVIE_ID"));
					mComment.setmComment(rset.getString("VALUE"));
					mComment.setcDate(rset.getDate("C_DATE"));
					
			
				    resultMap.add(mComment);
				   			}
				
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return resultMap;
	}

	public Movie searchMovieId(Connection con, String movie) {
		 Movie m = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String query = "select * from movie where movie_name = ?";
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, movie);
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
	            m = new Movie();
	            
	            m.setmId(rset.getString("MOVIE_ID"));
	            m.setmName(rset.getString("MOVIE_NAME"));
	            m.setmDate(rset.getDate("MOVIE_DATE"));
	            m.setmDirector(rset.getString("MOVIE_DIRECTOR"));
	            m.setmCast(rset.getString("MOVIE_CAST"));
	            m.setmGenre(rset.getString("MOVIE_GENRE"));
	            m.setmAge(rset.getString("MOVIE_AGE"));
	            m.setmSite(rset.getString("MOVIE_SITE"));
	            m.setmPlot(rset.getString("MOVIE_PLOT"));
	            m.setmYN(rset.getInt("MOVIE_YN"));
	            m.setMovieReserve(rset.getInt("MOVIE_RESERVE"));
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return m;
		
	}

	public MovieComment mCommentDelet(Connection con, String userid) {
		MovieComment m = null;
		int result=0;
		PreparedStatement pstmt = null;
		String query = "delete from Movie_comment where C_NUMBER = ?";
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(userid));
			result = pstmt.executeUpdate();
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return m;
	}
}
