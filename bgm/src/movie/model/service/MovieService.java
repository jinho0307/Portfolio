package movie.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import movie.model.dao.MovieDao;
import movie.model.vo.*;

public class MovieService {


	public Movie selectMovie(String movieId) {
		Connection con = getConnection();
		Movie movie = new MovieDao().selectMovie(con, movieId);
		close(con);
		return movie;
	}
	public MovieFileLink selectMovieFileLink(String movieId) {
		Connection con = getConnection();
		MovieFileLink movie = new MovieDao().selectMovieFileLink(con, movieId);
		close(con);
		return movie;
	}
	public ArrayList<MovieFileLink> selectMoviePosterAll() {
		Connection con = getConnection();
		ArrayList<MovieFileLink> resultMap = new MovieDao().selectMoviePosterAll(con);
		close(con);
		return resultMap;
	}
	public ArrayList<MovieFileLink> selectMoviePosterExpect() {
		Connection con = getConnection();
		ArrayList<MovieFileLink> resultMap = new MovieDao().selectMoviePosterExpect(con);
		close(con);
		return resultMap;
	}
	public ArrayList<Movie> selectMovieAllList() {
		Connection con = getConnection();
		ArrayList<Movie> resultMap = new MovieDao().selectMovieAllList(con);
		close(con);
		return resultMap;
	}
	public int insertMovie(Movie movie,MovieFileLink movieLink) {
		Connection con = getConnection();
		
		int result = new MovieDao().insertMovie(con, movie, movieLink);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}
	public Map<String, MovieFileLink> selectMovieDetail() {
		// TODO Auto-generated method stub
		return null;
	}
	public int updateMovie(Movie movie, MovieFileLink movieLink) {
Connection con = getConnection();
		
		int result = new MovieDao().updateMovie(con, movie, movieLink);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}
	public int deleteMovie(String mId) {
		Connection con = getConnection();
		int result = new MovieDao().deleteMovie(con,mId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}
	public ArrayList<MovieFileLink> searchMovie(String mId, String select) {
		Connection con = getConnection();
		ArrayList<MovieFileLink> resultMap = new MovieDao().searchMovie(con, mId, select);
		close(con);
		return resultMap;
	}
	public ArrayList<Movie> searchMovie2(String mId, String select) {
		Connection con = getConnection();
		ArrayList<Movie> resultMap = new MovieDao().searchMovie2(con, mId, select);
		close(con);
		return resultMap;
	}
	
	public int movieComment(MovieComment mcomment) {
            Connection con = getConnection();
		
		int result = new MovieDao().movieComment(con, mcomment);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}
	public ArrayList<MovieComment> selectMovieComment(String movieId) {
		Connection con = getConnection();
		ArrayList<MovieComment> resultMap = new MovieDao().selectMovieComment(con, movieId);
		close(con);
		return resultMap;
	}
	
	public Movie searchMovieId(String movie) {
	      Connection con = getConnection();
	      
	      Movie m = new MovieDao().searchMovieId(con, movie);
	      close(con);
	      
	      return m;
	   }
	public MovieComment mCommentDelet(String userid) {
		Connection con = getConnection();
	      
		MovieComment m = new MovieDao().mCommentDelet(con, userid);
	      close(con);
	      
	      return m;
	}
	

	
}
