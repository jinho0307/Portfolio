package news.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;


import news.model.dao.NewsDao;
import news.model.vo.NewsCompany;
import news.model.vo.NewsURL;
import news.model.vo.Subscription;

public class NewsService {

	public NewsService(){}
	
	public ArrayList<NewsCompany> getNewsCom(){
		ArrayList<NewsCompany> list=null;
		Connection con = getConnection();
		list=new NewsDao().getNewsCom(con);
		close(con);
		return list;
	}
	
	public ArrayList<NewsURL> getNewsURL(){
		ArrayList<NewsURL> ulist=null;
		Connection con = getConnection();
		ulist = new NewsDao().getNewsURL(con);
		close(con);
		return ulist;
	}
	
	
	public NewsCompany selectNews(int newsNo){
		NewsCompany newsCom= null;
		Connection con = getConnection();
		
		newsCom = new NewsDao().selectCom(con, newsNo);
		
		close(con);
		return newsCom;
		
	}

	public NewsCompany searchCompany(String comName) {
		NewsCompany nc=null;
		Connection con = getConnection();
		nc=new NewsDao().searchCompany(con, comName);
		
		close(con);
		

		return nc;
	}

	public ArrayList<NewsURL> searchURL(String comName) {
		ArrayList<NewsURL> ulist = null;
		Connection con = getConnection();
		ulist=new NewsDao().searchURL(con, comName);
			
		close(con);
		
		return ulist;
	}
	
	
	public void increaseCount(String url){
		int result=0;
		Connection con=getConnection();
		result = new NewsDao().increaseCount(con, url);
		
		
		if(result>0)
			commit(con);
		else
			rollback(con);
			
			
		close(con);
	}

	public NewsURL[] getHotNews() {
		NewsURL[] hotNews=null;
		Connection con=getConnection();
		
		hotNews=new NewsDao().getHotNews(con);
		
		close(con);
		return hotNews;
	}

	
	
	public NewsURL[] getnewNews() {
		NewsURL[] newNews=null;
		Connection con=getConnection();
		
		newNews=new NewsDao().getnewNews(con);
		
		close(con);
		return newNews;
	}

	public int insertSub(int comNo, int price, String id, String endDay) {
		int result=0;
		Connection con=getConnection();
		result=new NewsDao().insertSub(con, comNo, price, id, endDay);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		
		
		return result;
		
		
	}

	public ArrayList<NewsCompany> subNewsCom(String userId) {
		ArrayList<NewsCompany> list= null;
		Connection con = getConnection();
		
		list = new NewsDao().subNewsCom(con, userId);
		
		close(con);
		
		
		
		
		
		
		
		return list;
	}

	public ArrayList<NewsURL> subNewsURL(String userId, String comName) {
		ArrayList<NewsURL> ulist=null;
		Connection con = getConnection();
		ulist= new NewsDao().subNewsURL(con, userId, comName);
		
		close(con);
		
		return ulist;
	}

	

	public Date getEndDate(String userId, String comName) {
		Date d = null;
		Connection con = getConnection();
		
		d= new NewsDao().getEndDate(con, userId, comName);
		
		close(con);
		return d;
	}

	public NewsURL[] getRank(String comName) {
		NewsURL[] rank=null;
		Connection con = getConnection();
		rank= new NewsDao().getRank(con, comName);
		
		
		close(con);
		
		return rank;
	}

	public int insertNews(String comName, String url, String title, String date, String image) {
		int result=0;
		Connection con= getConnection();
		result= new NewsDao().insertNews(con, comName, url, title, date, image);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		
		
		close(con);
		return result;
	}

	public int insertCom(String comName, String mainURL, String mainImage, int price, int deposit) {
		Connection con = getConnection();
		int result =0;
		result = new NewsDao().insertCom(con, comName, mainURL, mainImage, price, deposit);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}

	public Subscription getUserSub(String userId, int comNo) {
		Connection con = getConnection();
		Subscription sub= null;
		
		sub= new NewsDao().getUserSub(con, userId, comNo);
		
		close(con);
		return sub;
	}

	public ArrayList<Subscription> getSubList(String userId) {
		ArrayList<Subscription> sublist=null;
		Connection con =getConnection();
		
		sublist= new NewsDao().getSubList(con, userId);
		
		close(con);
		
		return sublist;
	}


	

	
	
	

	
}
