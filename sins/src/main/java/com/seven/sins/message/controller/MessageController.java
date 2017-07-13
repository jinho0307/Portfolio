package com.seven.sins.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.seven.sins.member.service.MemberService;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.message.service.MessageService;
import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;
import com.seven.sins.message.vo.SpamUser;
import com.seven.sins.util.FileUtils;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	//메세지 리시트 읽기 컨트롤러
	@RequestMapping("msgreadlist.j")
	public ModelAndView messageReadList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv,
			MessageListVO listvo){
		String seach = listvo.getSeach();
		int currentPage = 1;
		int limit = 10;
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		// 검색창에 아무것도없을대
		int totalListCount = 0;
		List<MessageVO> msglist = null;
		if(listvo.getSeach() == null || listvo.getSeach().equals("")){
			totalListCount = messageservice.getListCount(loginUser.getUserId());
			msglist = messageservice.getMsgList(loginUser.getUserId(), currentPage, limit);
		}else{
			totalListCount = messageservice.getSeachListCount(listvo);
			msglist = messageservice.getMsgSeachList(listvo, currentPage, limit);
		}
		
		//Map<String, MessageVO> msgmap = messageservice.getMsgMap(loginUser.getUserId(), currentPage, limit);
		int maxPage = (int) ((double) totalListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		
		listvo.setSeach(seach);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("msglist", msglist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("seach",listvo.getSeach());
		mv.addObject("select",listvo.getSelect());
		
		mv.setViewName("message/messageread");
		return mv;
	}
	//보낸 메시지 읽기
	@RequestMapping("msgsendlist.j")
	public ModelAndView messageSendList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv,
			MessageListVO listvo){
		String seach = listvo.getSeach();
		int currentPage = 1;
		int limit = 10;
		
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		int sendListCount = 0;
		List<MessageVO> msgsendlist;
		if(listvo.getSeach() == null || listvo.getSeach().equals("")){
			sendListCount = messageservice.getSendListCount(loginUser.getUserId());
			msgsendlist = messageservice.getSendMsgList(loginUser.getUserId(), currentPage, limit);
		}else{
			sendListCount = messageservice.getSendSeachListCount(listvo);
			msgsendlist = messageservice.getSendSeachMsgList(listvo, currentPage, limit);
		}
		
		int maxPage = (int) ((double) sendListCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		listvo.setSeach(seach);
		mv.addObject("sendlistCount", sendListCount);
		mv.addObject("msgsendlist", msgsendlist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("seach",listvo.getSeach());
		mv.addObject("select",listvo.getSelect());

		mv.setViewName("message/messagesendlist");
		return mv;
	}
	//메시지 삭제(보낸 메시지)
	@RequestMapping("msgsenddel.j")
	public ModelAndView messageSendDel(int[] check_no, ModelAndView mv){
		int result = messageservice.messageSendDel(check_no);
		mv.setViewName("forward:msgsendlist.j");
		return mv;
	}
	
	//스팸등록 컨트롤러 
	@RequestMapping("msgspaminsert.j")
	public ModelAndView messageSpamInsert(int[] check_no, ModelAndView mv){
		int result = messageservice.messageSpamInsert(check_no);
		
		if(result > 0){
			//1개이상 스팸이 등록됨
			mv.setViewName("forward:msgreadlist.j");
		}else{
			//스팸등록 같은것만됨
			mv.setViewName("forward:msgreadlist.j");
		}
		
		return mv;
	}
	// 메시지 삭제(받은 메시지)
	@RequestMapping("msgrecivedel.j")
	public ModelAndView messageResiveDelete(int[] check_no, ModelAndView mv){
		System.out.println(check_no.length);
		int result = messageservice.messageResiveDelet(check_no);
		
		if(result > 0){
			mv.setViewName("forward:msgreadlist.j");
		}else{
			//삭제 실페페이지
			mv.setViewName("");
		}
		return mv;
	}
	//디테일 컨트롤러
	@RequestMapping("msgdetail.j")
	public ModelAndView messageDetatil(int msgno,String recive , ModelAndView mv){
		MessageVO msgvo = messageservice.getMessageOne(msgno, recive);
		mv.addObject("msgone", msgvo);
		mv.setViewName("message/msgdetail");
		return mv;
	}
	//디테일 컨트롤러 (헤더부분)
	@RequestMapping("msgheaddetail.j")
	public ModelAndView messageHeadDetatil(int msgno, ModelAndView mv,MessageVO msgvo){
		msgvo = messageservice.getMessageOne(msgno);
		mv.addObject("msgone", msgvo);
		mv.setViewName("message/msgdetail");
		return mv;
	}

	//메세지 보내기 컨트롤러 
	@RequestMapping("msgsead.j")
	public ModelAndView messageSead(MessageVO sendmsg,@RequestParam("file") MultipartFile file, String[] resiveid, ModelAndView mv) throws Exception{		
		// 파일 업로드 영역

		if(file.isEmpty() == false){
			String userid = sendmsg.getSend_id();
			String filePath = fileUtils.fileInfo(userid, file);
			sendmsg.setFilepath(filePath);		
		}

		int result = messageservice.messageSend(sendmsg);
		if(result > 0){
			mv.setViewName("forward:msgsendlist.j");
		}else{
			mv.setViewName("에러페이지");
		}
		
		return mv;
	}
	// 메세지 보낼때 친구목록 자동완성
	@RequestMapping("autocomresiveid.j")
	@ResponseBody
	public List<String> autocomresiveid(MessageVO msgvo){
		List<String> list = messageservice.autocomresiveid(msgvo);
		return list;
	}
	//답장 컨트롤러
	@RequestMapping("msgreference.j")
	public ModelAndView messageReference(int check_no, ModelAndView mv){
		mv = this.messageDetatil(check_no,null, mv);
		
		mv.setViewName("forward:msgbeforewrite.j");
		return mv;
	}
	//메세지 스펨 리스트 컨트롤러
	@RequestMapping("msgspamlist.j")
	public ModelAndView messageSpamList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv,
		MessageListVO listvo){
		String seach = listvo.getSeach();
		int currentPage = 1;
		int limit = 10;
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		int	totalListCount = messageservice.getSpamSeachListCount(listvo, loginUser.getUserId());
		List<MessageVO>	msgspamlist = messageservice.getSpamMsgSeachList(loginUser.getUserId(), listvo, currentPage, limit);
				
		int maxPage = (int) ((double) totalListCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
		endPage = maxPage;
		
		listvo.setSeach(seach);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("msgspamlist", msgspamlist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("seach",listvo.getSeach());
		mv.addObject("select",listvo.getSelect());
		
		mv.setViewName("message/messagespamlist");
		return mv;
	}	
	
	//스팸유저 리스트
	@RequestMapping("msgspamuserlist.j")
	public ModelAndView messageSpamUserList(@SessionAttribute MemberVO loginUser,@RequestParam(value="page", required=false)String page, ModelAndView mv){
		int currentPage = 1;
		int limit = 10;
		
		if (page != null)
			currentPage = Integer.parseInt(page);
		int	totalListCount = messageservice.getSpamUserListCount(loginUser.getUserId());
		List<MessageVO> msgspamuserlist = messageservice.getSpamUserMsgList(loginUser.getUserId(), currentPage, limit);
		
		int maxPage = (int) ((double) totalListCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
		endPage = maxPage;
	
		mv.addObject("totalCount", totalListCount);
		mv.addObject("msgspamuserlist", msgspamuserlist);		
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		
		mv.setViewName("message/spamuser");
		return mv;
	}
	
	//스팸 등록 삭제
	@RequestMapping("spamremove.j")
	public ModelAndView spamRemove(@SessionAttribute MemberVO loginUser, String[] check_spamid , ModelAndView mv){
		int result = messageservice.spamRemove(loginUser.getUserId(),check_spamid);
		mv.setViewName("forward:msgspamuserlist.j");
		return mv;
	}
	//리스트 헤더 쪽에 받은 쪽지
	@RequestMapping("headmsglist.j")
	@ResponseBody
	public List<MessageVO> headmsglist(@SessionAttribute MemberVO loginUser){
		return messageservice.getMsgList(loginUser.getUserId(), 1, 5);
	}
	
	//라이트페이지
	@RequestMapping("msgbeforewrite.j")
	public ModelAndView messageBeforeWrite(ModelAndView mv){
		List<String> list = memberservice.allMemberId();
		mv.addObject("allmember",list);
		mv.setViewName("message/messagewrite");
		return mv;
	}
}
