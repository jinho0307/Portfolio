package reserve.model.service;

import reserve.model.dao.ReserveDao;
import reserve.model.vo.*;
import reserve.model.vo.Time;
import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import movie.model.vo.Movie;

public class ReserveService {
	
	public ReserveService() {}

	public ArrayList<Time> reserveDate() {
		Connection conn = getConnection();
		
		ArrayList<Time> list = new ReserveDao().reserveDate(conn);
		
		close(conn);
		
		return list;
	}
	public ArrayList<Movie> movieList(){
		Connection conn = getConnection();
		
		ArrayList<Movie> list = new ReserveDao().MovieList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Cinema> cinemaList() {
		Connection conn = getConnection();
		
		ArrayList<Cinema> list = new ReserveDao().cinemaList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Cinema> getCinemaList(String str) {
		Connection conn = getConnection();
		
		ArrayList<Cinema> list = new ReserveDao().getCinemaList(conn, str);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Time> getTimeList(String mname, String cname) {
		Connection conn = getConnection();
		
		ArrayList<Time> list = new ReserveDao().getTimeList(conn, mname, cname);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Temp> getTempList(String mname, String cname, String dname) {
		Connection conn = getConnection();
		
		ArrayList<Temp> list = new ReserveDao().getTempList(conn, mname, cname, dname);

		close(conn);
		
		return list;
	}
	
	public int getCnt(String screenRoomName, String time, String mname, String cname) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().getCnt(conn, screenRoomName, time, mname, cname);
		
		close(conn);
		
		return result;
	}


	public String getScreenRoom(String movie, String cname, String date) {
		Connection conn = getConnection();
		
		String sname = new ReserveDao().getScreenRoom(conn, movie, cname, date);
		
		close(conn);
		
		return sname;
	}

	public String getMoviePoster(String movie) {
		Connection conn = getConnection();
		
		String mpname = new ReserveDao().getMoviePoster(conn, movie);
		
		close(conn);
		
		return mpname;
	}

	public String[] getSeat(String movie, String cname, String date, String screen) {
		Connection conn = getConnection();
		
		String[] ssar = new ReserveDao().getSeat(conn, movie, cname, date, screen);
		
		close(conn);
		
		return ssar;
	}

	public String getMovieAge(String movie) {
		Connection conn = getConnection();
		
		String mage = new ReserveDao().getMovieAge(conn, movie);
		
		close(conn);
		
		return mage;
	}

	public int setSeat(String seat, reserveInfo ri, String loginUser) {
		Connection conn = getConnection();
		
		String movieId = new ReserveDao().getMovieId(conn, ri.getMovieName());
		
		Reserve res = new Reserve(loginUser, new ReserveDao().getCinemaId(conn, ri.getCinemaName()), new ReserveDao().getTimeIndex(conn, ri.getShow_Time())
								 , new ReserveDao().getScreenRoomId(conn, ri.getCinemaName(), ri.getScreenRoomName()), seat, movieId);
 		
		int result = new ReserveDao().setSeat(conn, res);
		
		if(result > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Reserve> getReserve(String loginUser) {
		Connection conn = getConnection();
		
		ArrayList<Reserve> list = new ReserveDao().getReserve(conn, loginUser);
		
		close(conn);
		
		return list;
	}

	public ReserveName getReserveName(Reserve r) {
		Connection conn = getConnection();
		
		ReserveName rn = new ReserveDao().ReserveName(conn, r);
		
		close(conn);
		
		return rn;
	}

	public Reserve checkTicket(ReserveName rn) {
		Connection conn = getConnection();
		
		ReserveDao rd = new ReserveDao();
		
		Reserve r = new Reserve(rn.getUserId(), rd.getCinemaId(conn, rn.getCinemaName()), rd.getTimeIndex(conn, rn.getShowTime()), 
								rd.getScreenRoomId(conn, rn.getCinemaName(), rn.getScreenRoomName()), rn.getSeat(), rd.getMovieId(conn, rn.getMovieName()));
		
		close(conn);
		
		return r;
	}

	public int deleteReserve(Reserve r, String age) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().deleteReserve(conn, r, age);
		
		if(result > 0){
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int minusCash(String loginUser, reserveInfo ri, int price) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().minusCash(conn, loginUser, ri, price);
		
		if(result > 0){
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;

	}

	public int setMovieReserve(String a3, int seat) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().setMovieReserve(conn, a3, seat);
		
		if(result > 0){
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Reserve> getReserveList() {
		Connection conn = getConnection();
		
		ArrayList<Reserve> list = new ReserveDao().getReserveList(conn);
		
		close(conn);
		
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new ReserveDao().getListCount(conn);
		
		close(conn);
				
		return result;
	}

	public int getListCount(Search search) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().getListCount(conn, search);
		
		close(conn);
		
		return result;
	}

	public String[] getScreenRoom(String cname) {
		Connection conn = getConnection();
		
		String[] screen = new ReserveDao().getScreenRoom(conn, cname);
		
		close(conn);
		
		return screen;
	}

	public String getScreenRoomId(String screen) {
		Connection conn = getConnection();
		
		String screenId = new ReserveDao().getScreenRoomId(conn, screen);
		
		close(conn);
		
		return screenId;
	}

	public String getCinemaId(String cname) {
		Connection conn = getConnection();
		
		String cinemaId = new ReserveDao().getCinemaId(conn, cname);
		
		close(conn);
		
		return cinemaId;
	}

	public int getTimeIndex(String date) {
		Connection conn = getConnection();
		
		int timeIndex = new ReserveDao().getTimeIndex(conn, date);
		
		close(conn);
		
		return timeIndex;
	}

	public int setRelation(Relation r) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().serRelation(conn, r);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Relation> getRelation() {
		Connection conn = getConnection();
		
		ArrayList<Relation> list = new ReserveDao().getRelation(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<RelationName> getRelationName(String cname, String mname, String date) {
		Connection conn = getConnection();
		
		ArrayList<RelationName> rnlist = new ReserveDao().getRelationName(conn, cname, mname, date);
		
		close(conn);
		
		return rnlist;
	}

	public ArrayList<Reserve> getReserveList(Search search) {
		Connection conn = getConnection();
		
		ArrayList<Reserve> list = new ReserveDao().getReserveList(conn, search);
		
		close(conn);
		
		return list;
	}

}
