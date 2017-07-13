package member.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

import static common.JDBCTemplate.*;

import member.model.vo.Member;
import notice.model.vo.Notice;

public class MemberDao {

	public MemberDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member checkLogin(Connection conn, String id, String password) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from bgm_user where id = ? and password = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setManager(rset.getInt("MANAGER"));
				member.setTotalCash(rset.getInt("TOTALCASH"));
/*				member.setBirth(rset.getDate("BIRTH"));
				member.setEnroll_date(rset.getDate("ENROLL_DATE"));
				member.setGender(rset.getString("GENDER").charAt(0));
				member.setPassword(rset.getString("PHONE"));
				member.setAddress1(rset.getString("ADDRESS1"));
				member.setAddress2(rset.getString("ADDRESS2"));
				member.setEmail(rset.getString("EMAIL"));
				member.setManager(rset.getInt("MANAGER"));
				*/
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into BGM_USER values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, default, ?, ?, ?, default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getUserName());
			pstmt.setDate(4, member.getBirth());
			pstmt.setString(5, String.valueOf(member.getGender()));
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress1());
			pstmt.setString(8, member.getAddress2());
			pstmt.setString(9, member.getEmail());
			pstmt.setString(10, member.getReception());
			pstmt.setString(11, member.getZipcode1());
			pstmt.setString(12, member.getZipcode2());

				
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		return result;
	}
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update bgm_user set password = ?, phone = ?, zipcode1 =?, zipcode2 =?, address1 =?, address2 =?, email = ?, reception= ?, MANAGER = ? where id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getZipcode1());
			pstmt.setString(4, member.getZipcode2());
			pstmt.setString(5, member.getAddress1());
			pstmt.setString(6, member.getAddress2());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getReception());
			pstmt.setInt(9, member.getManager());
			pstmt.setString(10, member.getUserId());
			result = pstmt.executeUpdate();
			System.out.println("가나다");
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int owerId(Connection conn, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "select id from bgm_user where id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
				
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		return result;
	}

	public Member selectOne(Connection conn, String id) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from bgm_user where id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setBirth(rset.getDate("BIRTH"));
				member.setGender(rset.getString("GENDER").charAt(0));
				member.setPhone(rset.getString("PHONE"));
				member.setAddress1(rset.getString("ADDRESS1"));
				member.setAddress2(rset.getString("ADDRESS2"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEnroll_date(rset.getDate("ENROLLDATE"));
				member.setManager(rset.getInt("MANAGER"));
				member.setReception(rset.getString("RECEPTION"));
				member.setZipcode1(rset.getString("ZIPCODE1"));
				member.setZipcode2(rset.getString("ZIPCODE2"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public ArrayList<Member> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		String query = "select * from bgm_user order by manager";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Member member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setBirth(rset.getDate("BIRTH"));
				member.setGender(rset.getString("GENDER").charAt(0));
				member.setPhone(rset.getString("PHONE"));
				member.setAddress1(rset.getString("ADDRESS1"));
				member.setAddress2(rset.getString("ADDRESS2"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEnroll_date(rset.getDate("ENROLLDATE"));
				member.setManager(rset.getInt("MANAGER"));
				member.setReception(rset.getString("RECEPTION"));
				member.setZipcode1(rset.getString("ZIPCODE1"));
				member.setZipcode2(rset.getString("ZIPCODE2"));
				
				list.add(member);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select Count(*) from bgm_user";

		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	public int getListCount(Connection conn, String keyword, int seachgroup) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		switch (seachgroup) { //이름
		case 2:	query = "select Count(*) from bgm_user where USERNAME like ?";
			break; 
		case 3:	query = "select Count(*) from bgm_user where EMAIL like ?"; //이메일
			break;
		default: query = "select Count(*) from bgm_user where id like ?"; //아이디
			break;
		}

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()){
				listCount = rset.getInt(1);

			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, ID, PASSWORD, USERNAME, BIRTH, GENDER, PHONE, ADDRESS1, ADDRESS2, EMAIL, ENROLLDATE, MANAGER, RECEPTION, ZIPCODE1, ZIPCODE2, TOTALCASH FROM BGM_USER) WHERE RNUM >=? AND RNUM <= ?";
	
		int startRow = (currentPage -1) * limit +1;
		
		int endRow = startRow + limit -1;
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()){
				Member member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setBirth(rset.getDate("BIRTH"));
				member.setGender(rset.getString("GENDER").charAt(0));
				member.setPhone(rset.getString("PHONE"));
				member.setAddress1(rset.getString("ADDRESS1"));
				member.setAddress2(rset.getString("ADDRESS2"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEnroll_date(rset.getDate("ENROLLDATE"));
				member.setManager(rset.getInt("MANAGER"));
				member.setReception(rset.getString("RECEPTION"));
				member.setZipcode1(rset.getString("ZIPCODE1"));
				member.setZipcode2(rset.getString("ZIPCODE2"));
				member.setTotalCash(rset.getInt("TOTALCASH"));
				
				list.add(member);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Member> selectList(Connection conn, String keyword, int currentPage, int limit, int seachgroup) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		switch (seachgroup) { //이름
		case 2:	query = "SELECT * FROM (SELECT ROWNUM RNUM, ID, PASSWORD, USERNAME, BIRTH, GENDER, PHONE, ADDRESS1, ADDRESS2, EMAIL, ENROLLDATE, MANAGER, RECEPTION, ZIPCODE1, ZIPCODE2, TOTALCASH FROM BGM_USER where USERNAME like ? ORDER BY ENROLLDATE DESC)WHERE RNUM >=? AND RNUM <= ?";
			break; 
		case 3:	query = "SELECT * FROM (SELECT ROWNUM RNUM, ID, PASSWORD, USERNAME, BIRTH, GENDER, PHONE, ADDRESS1, ADDRESS2, EMAIL, ENROLLDATE, MANAGER, RECEPTION, ZIPCODE1, ZIPCODE2, TOTALCASH FROM BGM_USER where EMAIL like ? ORDER BY ENROLLDATE DESC)WHERE RNUM >=? AND RNUM <= ?";
			break;
		default: query = "SELECT * FROM (SELECT ROWNUM RNUM, ID, PASSWORD, USERNAME, BIRTH, GENDER, PHONE, ADDRESS1, ADDRESS2, EMAIL, ENROLLDATE, MANAGER, RECEPTION, ZIPCODE1, ZIPCODE2, TOTALCASH FROM BGM_USER where ID like ? ORDER BY ENROLLDATE DESC)WHERE RNUM >=? AND RNUM <= ?";
			break;
		}

		int startRow = (currentPage -1) * limit +1;
		
		int endRow = startRow + limit -1;
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()){
				Member member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setBirth(rset.getDate("BIRTH"));
				member.setGender(rset.getString("GENDER").charAt(0));
				member.setPhone(rset.getString("PHONE"));
				member.setAddress1(rset.getString("ADDRESS1"));
				member.setAddress2(rset.getString("ADDRESS2"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEnroll_date(rset.getDate("ENROLLDATE"));
				member.setManager(rset.getInt("MANAGER"));
				member.setReception(rset.getString("RECEPTION"));
				member.setZipcode1(rset.getString("ZIPCODE1"));
				member.setZipcode2(rset.getString("ZIPCODE2"));
				member.setTotalCash(rset.getInt("TOTALCASH"));
				list.add(member);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Member findId(Connection conn, String name, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select id, username from bgm_user where username =? and phone =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setUserId(rset.getString(1));
				member.setUserName(rset.getString(2));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public Member findPwd(Connection conn, String id, String name, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		Member member = null;
		String temppwd = null;
		
		String query = "select count(*) from bgm_user where id =? and username =? and phone =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			result = pstmt.executeUpdate();
			if(result > 0){
				String str = null;
				StringBuffer sb = new StringBuffer();
				StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");  // 특수문자 모음, {}[] 같은 비호감문자는 뺌

				// 소문자 3개를 임의발생
				for( int i = 0; i<3; i++) {
				    sb.append((char)((Math.random() * 26)+97)); // 아스키번호 97(a) 부터 26글자 중에서 택일
				}  

				// 숫자 2개를 임의 발생
				for( int i = 0; i<2; i++) {
				    sb.append((char)((Math.random() * 10)+48)); //아스키번호 48(1) 부터 10글자 중에서 택일
				}

				// 특수문자를 두개  발생시켜 랜덤하게 중간에 끼워 넣는다 
				sb.setCharAt(((int)(Math.random()*2)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자2개중 하나   
				sb.setCharAt(((int)(Math.random()*2)+2), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자2개중 하나
				str = sb.toString();
				
				String query1 = "update bgm_user set PASSWORD =? where id =?";
				pstmt1 = conn.prepareStatement(query1);
				pstmt1.setString(1, str);
				pstmt1.setString(2, id);
				
				int result1 = pstmt1.executeUpdate();
				
				if(result1 > 0){
					member = new Member();
					member.setUserName(name);
					member.setPassword(str);
					
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt1);
			close(pstmt);
		}
		return member;
	}

	public Member checkLogin(Connection conn, String userid) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from bgm_user where id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setUserId(rset.getString("ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setUserName(rset.getString("USERNAME"));
				member.setManager(rset.getInt("MANAGER"));
				member.setTotalCash(rset.getInt("TOTALCASH"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int delMember(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		String query = "delete bgm_user where id = ?";
		int result = 0;
		
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

}





