package com.seven.sins.member.controller;

import java.io.File;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.fire.service.FireService;
import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.util.FileUtils;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FireService fireService;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	 // 로그인용 컨트롤러
	@RequestMapping("loginCheck.k")
	public String loginCheck(HttpSession session, MemberVO m, Model mo){
		String url = "";
		
		int idCheck = memberService.idCheck(m);
		if(idCheck > 0){
			MemberVO loginUser = memberService.loginCheck(m);
			
			if(loginUser != null){
				if(loginUser.getUserId().equals("admin")){
					session.setAttribute("loginUser", loginUser);
					ArrayList<MemberVO> member = memberService.getAllMember();
					for(int x = 0; x<member.size();x++){
						String sar[] = member.get(x).getBanTime().split(" ");
						
						int year = Integer.parseInt(sar[0].split("/")[0]);
						int month = Integer.parseInt(sar[0].split("/")[1]);
						int day = Integer.parseInt(sar[0].split("/")[2]);
						int hour = Integer.parseInt(sar[1].split(":")[0]);
						int minute = Integer.parseInt(sar[1].split(":")[1]);
						int second = Integer.parseInt(sar[1].split(":")[2]);
						
						String banTime = year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
						
						Calendar cld = new GregorianCalendar().getInstance();
						Calendar cld2 = new GregorianCalendar().getInstance();
						Date d = new Date();
						
						SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd kk:mm:ss");
						Date ban;
						long diff;
						try {
							ban = sdf.parse(banTime);
							cld.setTime(ban);
							cld2.setTime(d);
							diff = ((cld2.getTimeInMillis()-cld.getTimeInMillis()) / 1000)/60;
							
							// 밴타임 없고 아이디비번 맞고 어드민아니고
							if(diff >= 0){
								member.get(x).setBanTime("없음");
							}
							// 영구정지일 경우
							else if(Math.abs(diff) > 31){
								member.get(x).setBanTime("영정");
							}
							// 밴타임이 있을경우
							else {
								String banMinute = String.valueOf(Math.abs(diff));
								member.get(x).setBanTime(banMinute+"분");
							}
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					mo.addAttribute("allMember", member);
					url="admin/adminPage";
				}
				else{
					String sar[] = loginUser.getBanTime().split(" ");
					
					int year = Integer.parseInt(sar[0].split("/")[0]);
					int month = Integer.parseInt(sar[0].split("/")[1]);
					int day = Integer.parseInt(sar[0].split("/")[2]);
					int hour = Integer.parseInt(sar[1].split(":")[0]);
					int minute = Integer.parseInt(sar[1].split(":")[1]);
					int second = Integer.parseInt(sar[1].split(":")[2]);
					
					String banTime = year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
					
					Calendar cld = new GregorianCalendar().getInstance();
					Calendar cld2 = new GregorianCalendar().getInstance();
					Date d = new Date();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd kk:mm:ss");
					Date ban;
					long diff;
					try {
						ban = sdf.parse(banTime);
						cld.setTime(ban);
						cld2.setTime(d);
						diff = ((cld2.getTimeInMillis()-cld.getTimeInMillis()) / 1000)/60;
						
						// 밴타임 없고 아이디비번 맞고 어드민아니고
						if(diff >= 0){
							session.setAttribute("loginUser", loginUser);
							int nul = memberService.loginFailCheckZero(loginUser);
							url="alert/alert";
						}
						// 밴타임이 있을경우
						else {
							mo.addAttribute("time", Math.abs(diff));
							url="member/banTime";
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
				}
				
			}
			else {
				int loginFailCheck = memberService.setLoginFailCheck(m);
				int count = memberService.getLoginFailCheck(m);

				if(count > 4 && count < 6){
					int result = memberService.setBanTime(m);
				}
				mo.addAttribute("count", count);
				url="member/pwdCheckFail";
			}
			
		}
		else {
			url = "member/idCheckFail";
		}
		
		
		return url;
	}
	
	// 회원가입용 컨트롤러
	@Value("#{dir['dir.url']}")
	private String dir;
	
	@RequestMapping("enroll.m")
	public String enrollMember(MemberVO member, Model mo){
		
		int result = memberService.enrollMember(member);
		String filePath = dir + member.getUserId();
		
		String url = "";
		if(result > 0){
			
			File file = new File(filePath);
			if(file.exists() == false){
				file.mkdirs();
			};
			
			mo.addAttribute(member);
			url = "member/enrollSuccess";
		}
		else {
			url = "member/enrollFail";
		}
		
		return url;
	}
	
	// 전화번호 중복체크용 컨트롤러
	@RequestMapping("phoneCheck.m")
	@ResponseBody
	public String phoneCheck(HttpServletRequest request){
		String phone = request.getParameter("phone");
		
		int check = memberService.phoneCheck(phone);

		String result = String.valueOf(check);
		
		return result;
	}
	
	// 아이디 찾기용 컨트롤러
	@RequestMapping("findId.m")
	public ModelAndView findId(MemberVO m, ModelAndView mv){
		String url = "";
		
		MemberVO findMember = memberService.findId(m);
		mv.addObject("member", findMember);
		if(findMember != null){
			mv.setViewName("member/findIdSuccess");
		}
		else {
			mv.setViewName("member/findIdFail");
		}
		
		return mv;
	}
	
	// 비밀번호 변경용 컨트롤러
	@RequestMapping("changePwd.k")
	public String changePwd(MemberVO m, HttpSession session, Model mo){
		String url = "";
	
		int result = memberService.changePwd(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setUserPwd(m.getUserPwd());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "비밀번호");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "비밀번호 바꾸기를");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 생일 수정용 컨트롤러
	@RequestMapping("changeBirth.k")
	public String changeBirth(MemberVO m, HttpSession session, Model mo){
		String url = "member/myInfo";
		
		m.setBirth(m.getBirth().substring(2));
		
		int result = memberService.changeBirth(m);
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setBirth(m.getBirth());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "생일");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "생일 정보 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 전화번호 수정용 컨트롤러
	@RequestMapping("phoneChange.k")
	public String phoneChange(MemberVO m, HttpSession session, Model mo){
		String url = "";
		
		int result = memberService.phoneChange(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setPhone(m.getPhone());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "전화번호");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "전화번호 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 회원 탈퇴용 컨트롤러
	@RequestMapping("deleteMember.k")
	public String deleteMember(MemberVO m, HttpSession session, Model mo){
		String url = "";
		
		int result = memberService.deleteMember(m);
		
		if(result > 0){
			session.invalidate();
			url="member/deleteMemberSuccess";
		}
		else {
			mo.addAttribute("message", "회원탈퇴");
			url="member/changeFail";
		}
		
		return url;
	}
	
	// 로그아웃용 컨트롤러
	@RequestMapping("logout.k")
	public ModelAndView logout(HttpSession session, ModelAndView mv){
		MemberVO user = (MemberVO) session.getAttribute("loginUser");
		mv.setViewName("member/logoutSuccess");
		mv.addObject("user",user.getUserId());
		session.invalidate();
		
		return mv;
	}
	
	// 주소 수정중 도 정보 가져오기
	@RequestMapping("getCity.k")
	@ResponseBody
	public List<String> getCity(ArrayList<String> list){
		String result = "";
		list = memberService.getCity();
		
		
		return list;
	}
	
	// 도 선택시 시 정보 가져가기
	@RequestMapping("getPartition.k")
	@ResponseBody
	public List<String> getPartition(ArrayList<String> list, HttpServletRequest request){
		String city = request.getParameter("city");
		
		list = memberService.getPartition(city);
		
		list.remove(0);
		
		return list;
	}
	
	// 주소 수정용 컨트롤러
	@RequestMapping("changeAddress.k")
	public String changeAddress(HttpServletRequest request, MemberVO m, Model mo, HttpSession session){
		String url = "";
		
		String city = request.getParameter("city");
		String partition = request.getParameter("partition");
		
		String address = city + " " + partition;
		
		m.setAddress(address);
		
		int result = memberService.changeAddress(m);
		
		if(result > 0){
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			loginUser.setAddress(m.getAddress());
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "주소");
			url = "member/infoModifySuccess";
		}
		else {
			mo.addAttribute("message", "주소 바꾸기");
			url = "member/changeFail";
		}
		
		
		return url;
	}
	
	// 주소 삭제용 컨트롤러
	@RequestMapping("addressDelete.k")
	public String addressDelete(Model mo, HttpSession session){
		String url = "";
		
		MemberVO m = (MemberVO)session.getAttribute("loginUser");
		
		int result = memberService.addressDelete(m);
		
		if(result > 0){
			MemberVO loginUser = memberService.loginCheck(m);
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "주소");
			url = "member/infoModifySuccess";
		}
		else{
			mo.addAttribute("message", "주소 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 생일 삭제용 컨트롤러
	@RequestMapping("birthDelete.k")
	public String birthDeleteDelete(Model mo, HttpSession session){
		String url = "";
		
		MemberVO m = (MemberVO)session.getAttribute("loginUser");
		
		int result = memberService.birthDelete(m);
		
		if(result > 0){
			MemberVO loginUser = memberService.loginCheck(m);
			session.setAttribute("loginUser", loginUser);
			mo.addAttribute("message", "생일");
			url = "member/infoModifySuccess";
		}
		else{
			mo.addAttribute("message", "생일 정보 바꾸기");
			url = "member/changeFail";
		}
		
		return url;
	}
	
	// 마이페이지 로그인 체크
	@RequestMapping("userCheck.k")
	@ResponseBody
	public String userCheck(MemberVO m){
		int res = memberService.userCheck(m);
		
		String result = String.valueOf(res);
		
		return result;
	}
	
	// 벤타임 추가
	@RequestMapping("banTimePlus.k")
	@ResponseBody
	public String banTimePlus(MemberVO vo){
		String result = String.valueOf(memberService.banTimePlus(vo));
		
		return result;
	}
	
	// 벤타임 삭제
	@RequestMapping("banTimeMinus.k")
	@ResponseBody
	public String banTimeMinus(MemberVO vo){
		String result = String.valueOf(memberService.banTimeMinus(vo));
		
		return result;
	}
	
	// 회원 삭제용 컨트롤러
	@RequestMapping("memberDelete.k")
	@ResponseBody
	public String memberDelete(MemberVO vo){
		String result = String.valueOf(memberService.memberDelete(vo));
		
		return result;
	}
	
	//모든맴버 아이디 가져오기 컨트롤러
	@RequestMapping("allmemberid.j")
	@ResponseBody
	public List<String> allMemberId(){
		return memberService.allMemberId();
	}
	// 프로필 사진 바꾸기 컨트롤러
	@RequestMapping("changmyprofile.j")
	public ModelAndView profileChange(@SessionAttribute MemberVO loginUser, @RequestParam("file") MultipartFile file, ModelAndView mv) throws Exception{
		
		if(!file.isEmpty()){
			String filePath = fileUtils.fileInfo(loginUser.getUserId(), file);
			loginUser.setUserProfile(filePath);
			int result = memberService.profileChange(loginUser);
		}
		mv.setViewName("forward:mypage.b");
		return mv;
	}
}
