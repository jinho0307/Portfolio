package member.model.service;

import java.sql.*;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member checkLogin(String id, String password) {
		Member member = null;
		Connection conn = getConnection();
		member = new MemberDao().checkLogin(conn,id,password);
		if(member !=null){
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return member;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn,member);
		close(conn);
		if(result>0){
			commit(conn);
		}else{
			rollback(conn);
		}
		return result;
		
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn,member);
		close(conn);
		if(result>0){
			commit(conn);
		}else{
			rollback(conn);
		}
		return result;
	}

	public int owerId(String id) {
		Connection conn = getConnection();
		int result = new MemberDao().owerId(conn,id);
		close(conn);
		if(result>0){
			commit(conn);
		}else{
			rollback(conn);
		}
		return result;
	}

	public Member selectOne(String id) {
		Connection conn = getConnection();
		Member member = new MemberDao().selectOne(conn,id);
		close(conn);
		if(member != null){
			commit(conn);
		}else{
			rollback(conn);
		}
		return member;
	}

	public ArrayList<Member> selectAll() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectAll(conn);
		close(conn);
		if(list.size() > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		return list;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn,currentPage,limit);
		close(conn);
		return list;
	}


	public int getListCount() {
		Connection conn = getConnection(); 
		int result = new MemberDao().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Member> selecList(int currentPage, int limit, String keyword, int seachgroup) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn,keyword, currentPage,limit,seachgroup);
		close(conn);
		return list;
	}

	public int getListCount(String keyword, int seachgroup) {
		Connection conn = getConnection(); 
		int result = new MemberDao().getListCount(conn, keyword,seachgroup);
		close(conn);
		return result;
	}

	public Member findId(String name, String phone) {
		Connection conn = getConnection();
		Member user = new MemberDao().findId(conn,name,phone);
		close(conn);
		return user;
	}

	public Member findPwd(String id, String name, String phone) {
		Connection conn = getConnection();
		Member member = new MemberDao().findPwd(conn,id, name,phone);
		if(member != null){
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return member;
	}
	//결제시 재로그인 정보
	public Member checkLogin(String userid) {
		Member member = null;
		Connection conn = getConnection();
		member = new MemberDao().checkLogin(conn,userid);
		if(member !=null){
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return member;
	}

	public int delMember(String userid) {
		Connection conn = getConnection();
		int result = new MemberDao().delMember(conn,userid);
		if(result > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

}