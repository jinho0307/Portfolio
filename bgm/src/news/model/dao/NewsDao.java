package news.model.dao;

import java.sql.*;
import java.util.ArrayList;


import static common.JDBCTemplate.*;
import news.model.vo.NewsCompany;

import news.model.vo.NewsURL;
import news.model.vo.Subscription;

public class NewsDao {

	public NewsDao() {}

	public ArrayList<NewsCompany> getNewsCom(Connection con) {
		ArrayList<NewsCompany> list = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from news_company";

		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			list = new ArrayList<NewsCompany>();
			while (rset.next()) {

				list.add(new NewsCompany(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),rset.getInt(5),rset.getInt(6)));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<NewsURL> getNewsURL(Connection con) {

		ArrayList<NewsURL> ulist = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select * from news_url order by upload_date desc";

		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			ulist = new ArrayList<NewsURL>();
			
			while (rset.next()) {

				ulist.add(new NewsURL(rset.getString(1),rset.getString(2),rset.getString(3),rset.getInt(4),rset.getDate(5),rset.getString(6)));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return ulist;
	}

	public NewsCompany selectCom(Connection con, int newsNo) {
		NewsCompany newsCom=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String query = "select * from news_company where company_no = ?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, newsNo);
			rset=pstmt.executeQuery();
			
			if(rset.next())
				newsCom=new NewsCompany(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getInt(5), rset.getInt(6));
		
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return newsCom;
	}

	public NewsCompany searchCompany(Connection con, String comName) {
		NewsCompany nc=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String query = "select * from news_company where company_name = ?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, comName);
			rset=pstmt.executeQuery();
			
			if(rset.next()){
				nc=new NewsCompany(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),rset.getInt(5),rset.getInt(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return nc;
	}

	public ArrayList<NewsURL> searchURL(Connection con, String comName) {
		
		ArrayList<NewsURL> ulist = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from news_url where company_name = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comName);
			rset = pstmt.executeQuery();
			ulist = new ArrayList<NewsURL>();
			
			while (rset.next()) {

				ulist.add(new NewsURL(rset.getString(1),rset.getString(2),rset.getString(3),rset.getInt(4),rset.getDate(5),rset.getString(6)));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return ulist;
	}

	
	public int increaseCount(Connection con, String url) {
		int result=0;
		PreparedStatement pstmt=null;
		String query="update news_url set count= count+1 where news_url = ?";
		
		
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, url);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
	
		return result;
	}

	public NewsURL[] getHotNews(Connection con) {
		NewsURL[] hotNews=null;
		Statement stmt=null;
		ResultSet rset=null;
		String query = "select company_name, news_url, news_title, count, upload_date, image, rank() over(order by count desc) as rank from news_url";

		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			hotNews=new NewsURL[10];
			int i=0;
			while(rset.next()&&i<10){
				
				hotNews[i] =new NewsURL(rset.getString(1),rset.getString(2),rset.getString(3),rset.getInt(4),rset.getDate(5),rset.getString(6));
				
				i++;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		
		
		return hotNews;
	}

	public NewsURL[] getnewNews(Connection con) {
		NewsURL[] newNews=null;
		Statement stmt=null;
		ResultSet rset=null;
		String query = "select company_name, news_url, news_title, count, upload_date, image, rank() over(order by upload_date desc) as rank from news_url";

		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			newNews=new NewsURL[10];
			int i=0;
			while(rset.next()&&i<10){
				
				newNews[i] =new NewsURL(rset.getString(1),rset.getString(2),rset.getString(3),rset.getInt(4),rset.getDate(5),rset.getString(6));
				
				i++;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		
		
		return newNews;
	}

	public int insertSub(Connection con, int comNo, int price, String id, String endDay) {
		int result=0;
		PreparedStatement pstmt = null;
		String query="insert into subscription values(?, ?, ?, sysdate, to_date(? , 'yyyy/MM/dd'))";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, comNo);
			pstmt.setInt(3, price);
			pstmt.setString(4, endDay);
			
			result=pstmt.executeUpdate();
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			
		}
		
		
		
		return result;
	}

	public ArrayList<NewsCompany> subNewsCom(Connection con, String userId) {
		ArrayList<NewsCompany> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select company_no, company_name, main_url, main_image, price, deposit from subscription join news_company using(company_no) where id = ? and end_date>sysdate";
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset=pstmt.executeQuery();
			
			
			list = new ArrayList<NewsCompany>();
			while(rset.next()){
				NewsCompany nc= new NewsCompany(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getInt(5),rset.getInt(6));
				
				list.add(nc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list;
	}

	public ArrayList<NewsURL> subNewsURL(Connection con, String userId, String comName) {
		ArrayList<NewsURL> ulist = null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String query = "select company_name, news_url, news_title, count, upload_date, image from news_url join news_company using(company_name)join subscription using(company_no)where id = ? and company_name = ? and end_date>sysdate order by 5 desc";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, comName);
			rset=pstmt.executeQuery();
			
			ulist = new ArrayList<NewsURL>();
			
			while(rset.next()){
				ulist.add(new NewsURL(rset.getString(1), rset.getString(2), rset.getString(3), rset.getInt(4), rset.getDate(5), rset.getString(6)));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return ulist;
	}

	

	public Date getEndDate(Connection con, String userId, String comName) {
		Date d=null;
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		String query ="select end_date from subscription join news_company using(company_no) where id = ? and company_name = ?";
		
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, comName);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()){
				d= rset.getDate(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		return d;
	}

	public NewsURL[] getRank(Connection con, String comName) {
		NewsURL[] rank = null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String query = "select * from news_url where company_name = ? order by count desc";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, comName);
			rset=pstmt.executeQuery();
			
			
				rank = new NewsURL[5];
				
				int i=0;
				while(rset.next()&& i<rank.length){
					rank[i] = new NewsURL(rset.getString(1), rset.getString(2), rset.getString(3), rset.getInt(4), rset.getDate(5), rset.getString(6));
					i++;
					
				}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return rank;
	}

	public int insertNews(Connection con, String comName, String url, String title, String date, String image) {
		int result=0;
		PreparedStatement pstmt=null;
		String query = "insert into news_url values(?, ?, ?, default, to_date(?, 'yyyyMMdd'), ?)";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, comName);
			pstmt.setString(2, url);
			pstmt.setString(3, title);
			pstmt.setString(4, date);
			pstmt.setString(5, image);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertCom(Connection con, String comName, String mainURL, String mainImage, int price, int deposit) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = "insert into news_company values(seq_num.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, comName);
			pstmt.setString(2, mainURL);
			pstmt.setString(3, mainImage);
			pstmt.setInt(4, price);
			pstmt.setInt(5, deposit);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
		
		
	}

	public Subscription getUserSub(Connection con, String userId, int comNo) {
		Subscription sub=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String query="select * from subscription where id = ? and company_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, comNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next())
				sub=new Subscription(rset.getString(1),rset.getInt(2),rset.getInt(3),rset.getDate(4),rset.getDate(5));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return sub;
	}

	public ArrayList<Subscription> getSubList(Connection con, String userId) {
		ArrayList<Subscription> sublist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from subscription where id = ?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				sublist= new ArrayList<Subscription>();
				do{
					sublist.add(new Subscription(rset.getString(1), rset.getInt(2), rset.getInt(3), rset.getDate(4), rset.getDate(5)));
					
				}while(rset.next());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return sublist;
	}



	

}
