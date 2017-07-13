package com.seven.sins.member.service;

import java.util.*;

import com.seven.sins.member.vo.MemberVO;

public interface MemberService {

	MemberVO loginCheck(MemberVO m);
	int findPw(MemberVO m);
	int idCheck(MemberVO m);
	int enrollMember(MemberVO member);
	int phoneCheck(String phone);
	MemberVO findId(MemberVO m);
	List<String> allMemberId();
	int changePwd(MemberVO m);
	int changeBirth(MemberVO m);
	int phoneChange(MemberVO m);
	int deleteMember(MemberVO m);
	ArrayList<String> getCity();
	ArrayList<String> getPartition(String city);
	int changeAddress(MemberVO m);
	int setLoginFailCheck(MemberVO m);
	int getLoginFailCheck(MemberVO m);
	int setBanTime(MemberVO m);
	int loginFailCheckZero(MemberVO loginUser);
	int addressDelete(MemberVO m);
	int birthDelete(MemberVO m);
	int userCheck(MemberVO m);
	ArrayList<MemberVO> getAllMember();
	int banTimePlus(MemberVO vo);
	int banTimeMinus(MemberVO vo);
	int memberDelete(MemberVO vo);
	int profileChange(MemberVO loginUser);
	
}
