package com.seven.sins.member.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {

	private static final String NAMESPACE = "Member.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO loginCheck(MemberVO m) {
		return (MemberVO)sqlSession.selectOne(NAMESPACE+"loginCheck", m);
	}

	public int findPw(MemberVO m) {
		return sqlSession.update(NAMESPACE+"findPw", m);
	}

	public int idCheck(MemberVO m) {
		return (int)sqlSession.selectOne(NAMESPACE+"idCheck", m);
	}
	

	public int enrollMember(MemberVO member) {
		return sqlSession.insert(NAMESPACE+"enrollMember", member);
	}

	public int phoneCheck(String phone) {
		return (int)sqlSession.selectOne(NAMESPACE+"phoneCheck", phone);
	}

	public MemberVO findId(MemberVO m) {
		return (MemberVO) sqlSession.selectOne(NAMESPACE+"findId", m);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> allMemberId() {
		return (List<String>)sqlSession.selectList(NAMESPACE + "allmemberid");
	}

	public int changePwd(MemberVO m) {
		return sqlSession.update(NAMESPACE+"changePwd", m);
	}

	public int changeBirth(MemberVO m) {
		return sqlSession.update(NAMESPACE+"changeBirth", m);
	}

	public int phoneChange(MemberVO m) {
		return sqlSession.update(NAMESPACE+"phoneChange", m);
	}

	public int deleteMember(MemberVO m) {
		return sqlSession.delete(NAMESPACE+"deleteMember", m);
	}

	public ArrayList<String> getCity() {
		return (ArrayList<String>) sqlSession.selectList(NAMESPACE+"getCity");
	}

	public ArrayList<String> getPartition(String city) {
		return (ArrayList<String>) sqlSession.selectList(NAMESPACE+"getPartition", city);
	}

	public int changeAddress(MemberVO m) {
		return sqlSession.update(NAMESPACE+"changeAddress", m);
	}

	public int setLoginFailCheck(MemberVO m) {
		return sqlSession.update(NAMESPACE+"setLoginFailCheck", m);
	}
	
	public int getLoginFailCheck(MemberVO m) {
		return (int)sqlSession.selectOne(NAMESPACE+"getLoginFailCheck", m);
	}

	public int setBanTime(MemberVO m) {
		return sqlSession.update(NAMESPACE+"setBanTime", m);
	}

	public int loginFailCheckZero(MemberVO loginUser) {
		return sqlSession.update(NAMESPACE+"loginFailCheckZero", loginUser);
	}

	public int addressDelete(MemberVO m) {
		return sqlSession.update(NAMESPACE+"addressDelete", m);
	}

	public int birthDelete(MemberVO m) {
		return sqlSession.update(NAMESPACE+"birthDelete", m);
	}

	public int userCheck(MemberVO m) {
		return (int)sqlSession.selectOne(NAMESPACE+"userCheck", m);
	}

	public ArrayList<MemberVO> getAllMember() {
		return (ArrayList<MemberVO>)sqlSession.selectList(NAMESPACE+"getAllMember");
	}

	public int banTimePlus(MemberVO vo) {
		return sqlSession.update(NAMESPACE+"banTimePlus", vo);
	}

	public int banTimeMinus(MemberVO vo) {
		return sqlSession.update(NAMESPACE+"banTimeMinus", vo);
	}

	public int memberDelete(MemberVO vo) {
		return sqlSession.delete(NAMESPACE+"memberDelete", vo);
	}

	public int profileChange(MemberVO loginUser) {
		return sqlSession.delete(NAMESPACE +"propathchange", loginUser);
	}
}
