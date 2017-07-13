package pay.model.service;

import java.sql.*;
import java.util.ArrayList;

import member.model.vo.Member;
import oracle.net.aso.p;
import pay.model.dao.PayDao;
import pay.model.vo.Cash;

import static common.JDBCTemplate.*;

public class PayService {

	public PayService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int cargeCash(String userid, int amount) {
		Connection conn = getConnection();
		int result = new PayDao().chargeCash(conn, userid, amount);
		if(result > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Cash> selectOne(String userid) {
		Connection conn = getConnection();
		ArrayList<Cash> list= new PayDao().selectOne(conn,userid);
		close(conn);
		return list;
	}

	public int getlistCountOne(String userid) {
		Connection conn = getConnection();
		int result = new PayDao().getlistCountOne(conn,userid);
		close(conn);
		return result;
	}

	public ArrayList<Cash> selectOne(String userid, int currentPage, int limit, String selectitem) {
		Connection conn = getConnection();
		ArrayList<Cash> list= new PayDao().selectOne(conn,userid, currentPage, limit, selectitem);
		close(conn);
		return list;
	}

	public int getlistCountOne(String userid, String selectitem) {
		Connection conn = getConnection();
		int result = new PayDao().getlistCountOne(conn,userid,selectitem);
		close(conn);
		return result;
	}

	public int getMovieMoney() {
		Connection conn = getConnection();
		int result = new PayDao().getMoveiMoney(conn);
		close(conn);
		return result;
	}

	public ArrayList<Cash> selectOne(int currentPage, int limit, String selectitem) {
		Connection conn = getConnection();
		ArrayList<Cash> list= new PayDao().selectOne(conn,currentPage, limit, selectitem);
		close(conn);
		return list;
	}

	public int getNewsMoney() {
		Connection conn = getConnection();
		int result = new PayDao().getNewsMoney(conn);
		close(conn);
		return result;
	}

	public int getTotalMoney() {
		Connection conn = getConnection();
		int result = new PayDao().getTotalMoney(conn);
		close(conn);
		return result;
	}

	public ArrayList<Cash> selectAll(int currentPage, int limit, String selectitem) {
		Connection conn = getConnection();
		ArrayList<Cash> list= new PayDao().selectAll(conn,currentPage, limit, selectitem);
		close(conn);
		return list;
	}

	public int getlistCountAll(String selectitem) {
		Connection conn = getConnection();
		int result = new PayDao().getlistCountAll(conn,selectitem);
		close(conn);
		return result;
	}

	public int getNetrofit() {
		Connection conn = getConnection();
		int result = new PayDao().getNetrofitMoney(conn);
		close(conn);
		return result;
	}

	
	public int cargeCash(String userid, String movieid, int price) {
	      Connection conn = getConnection();
	      
	      int result = new PayDao().chargeCash(conn, userid, movieid, price);
	      
	      if(result > 0){
	         commit(conn);
	      }else{
	         rollback(conn);
	      }
	      close(conn);
	      return result;
	   }
	
	public int cargeCash(String userid, int comid, int price) {
	      Connection conn = getConnection();
	      
	      int result = new PayDao().chargeCash(conn, userid, comid, price);
	      
	      if(result > 0){
	         commit(conn);
	      }else{
	         rollback(conn);
	      }
	      close(conn);
	      return result;
	   }
}
