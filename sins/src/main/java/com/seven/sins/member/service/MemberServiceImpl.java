package com.seven.sins.member.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.member.dao.MemberDAO;
import com.seven.sins.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO loginCheck(MemberVO m) {
		return memberDAO.loginCheck(m);
	}

	@Override
	public int findPw(MemberVO m) {
		return memberDAO.findPw(m);
	}

	@Override
	public int idCheck(MemberVO m) {
		return memberDAO.idCheck(m);
	}

	@Override
	public int enrollMember(MemberVO member) {
		return memberDAO.enrollMember(member);
	}

	@Override
	public int phoneCheck(String phone) {
		return memberDAO.phoneCheck(phone);
	}

	@Override
	public MemberVO findId(MemberVO m) {
		return memberDAO.findId(m);
	}

	@Override
	public List<String> allMemberId() {
		return memberDAO.allMemberId();
	}

	@Override
	public int changePwd(MemberVO m) {
		return memberDAO.changePwd(m);
	}

	@Override
	public int changeBirth(MemberVO m) {
		return memberDAO.changeBirth(m);
	}

	@Override
	public int phoneChange(MemberVO m) {
		return memberDAO.phoneChange(m);
	}

	@Override
	public int deleteMember(MemberVO m) {
		return memberDAO.deleteMember(m);
	}

	@Override
	public ArrayList<String> getCity() {
		return memberDAO.getCity();
	}

	@Override
	public ArrayList<String> getPartition(String city) {
		return memberDAO.getPartition(city);
	}

	@Override
	public int changeAddress(MemberVO m) {
		return memberDAO.changeAddress(m);
	}

	@Override
	public int setLoginFailCheck(MemberVO m) {
		return memberDAO.setLoginFailCheck(m);
	}
	
	@Override
	public int getLoginFailCheck(MemberVO m) {
		return memberDAO.getLoginFailCheck(m);
	}

	@Override
	public int setBanTime(MemberVO m) {
		return memberDAO.setBanTime(m);
	}

	@Override
	public int loginFailCheckZero(MemberVO loginUser) {
		return memberDAO.loginFailCheckZero(loginUser);
	}

	@Override
	public int addressDelete(MemberVO m) {
		return memberDAO.addressDelete(m);
	}

	
	@Override
	public int birthDelete(MemberVO m) {
		return memberDAO.birthDelete(m);
	}

	@Override
	public int userCheck(MemberVO m) {
		return memberDAO.userCheck(m);
	}

	@Override
	public ArrayList<MemberVO> getAllMember() {
		return memberDAO.getAllMember();
	}

	@Override
	public int banTimePlus(MemberVO vo) {
		return memberDAO.banTimePlus(vo);
	}

	@Override
	public int banTimeMinus(MemberVO vo) {
		return memberDAO.banTimeMinus(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return memberDAO.memberDelete(vo);
	}

	@Override
	public int profileChange(MemberVO loginUser) {
		return memberDAO.profileChange(loginUser);
	}
}
