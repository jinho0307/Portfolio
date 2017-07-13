package com.seven.sins.group.controller;

import java.util.*;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.fire.vo.FireVO;
import com.seven.sins.group.service.GroupCommentService;
import com.seven.sins.group.service.GroupLikeService;
import com.seven.sins.group.service.GroupMemberService;
import com.seven.sins.group.service.GroupService;
import com.seven.sins.group.service.GroupWriteService;
import com.seven.sins.group.vo.GroupCommentVO;
import com.seven.sins.group.vo.GroupLikeVO;
import com.seven.sins.group.vo.GroupMemberVO;
import com.seven.sins.group.vo.GroupVO;
import com.seven.sins.group.vo.GroupWriteVO;
import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.util.FileUtils;

@Controller("GroupController.y")
public class GroupController {

	@Autowired private GroupService groupService;
	@Autowired private GroupLikeService groupLikeService;
	@Autowired private GroupWriteService groupWriteService;
	@Autowired private GroupMemberService groupMemberService;
	@Autowired private GroupCommentService groupCommentService;
	@Resource(name="fileUtils") private FileUtils fileUtils;

	// 그룹 관련------------------------------------------------------------------

	// 그룹 클릭 시, 리스트 보여줌.
	@RequestMapping("selectGroupList.y")
	public ModelAndView selectGroupList(ModelAndView mv) {
		ArrayList<GroupVO> list = groupService.selectGroupList();
		
		mv.addObject("list", list);
		mv.setViewName("group/GroupList");

		return mv;
	}

	// 그룹 리스트에서 그룹 하나 선택 시, 그룹 메인으로 이동함.
	@SuppressWarnings("null")
	@RequestMapping("selectGroup.y")
	public ModelAndView selectGroup(ModelAndView mv, int groupNo, @SessionAttribute MemberVO loginUser) {
		GroupVO vo = groupService.selectGroup(groupNo);
		GroupLikeVO likevo = new GroupLikeVO();
		
		likevo.setGroupNo(groupNo);
		likevo.setUserId(loginUser.getUserId());
		
		ArrayList<GroupLikeVO> likeList = groupLikeService.groupLikeList(likevo);
		ArrayList<GroupWriteVO> writeList = groupWriteService.selectGroupWriteList(groupNo);
		ArrayList<GroupMemberVO> memberList = groupMemberService.selectGroupMemberList(groupNo);
		
		
		if(likeList == null) { 
			GroupLikeVO dummylike = new GroupLikeVO();
			dummylike.setWriteNo(0);
			likeList.add(dummylike);
		}
		
		// 신고 (원석)
		FireVO search = new FireVO();
		search.setClassify("GROUP_MAIN");
		search.setFireById(loginUser.getUserId());
		ArrayList<FireVO> fireContentList = groupService.getfireList(search);
		
		if(fireContentList.size() < 1){
			FireVO fivo = new FireVO("GROUP_MAIN", 0, "admin", "admin", 0, 0, 0);
			
			fireContentList.add(fivo);
		}
		mv.addObject("fireContentList", fireContentList);
		
		// 그룹 회원인지 확인.
		String memberCheck = "false";
		
		for (GroupMemberVO member : memberList) {
			if (loginUser.getUserId().equals(member.getUserId()) && member.getGroupAccept().equals("Y")) {
				memberCheck = "true";
			} else if(loginUser.getUserId().equals(member.getUserId()) && member.getGroupAccept().equals("N")) {
				memberCheck = "wait";
			}
		}
		
		mv.addObject("memberCheck", memberCheck);
		mv.addObject("group", vo);
		mv.addObject("likeList", likeList);
		mv.addObject("writeList", writeList);
		mv.addObject("memberList", memberList);
		mv.setViewName("group/GroupMain");

		return mv;
	}

	// 그룹 생성.
		@RequestMapping("insertGroup.y")
		public String insertGroup(GroupVO vo, @RequestParam("file") MultipartFile file) throws Exception {

			if(file.isEmpty() == false){
				String userId = vo.getUserId();
				String filepath = fileUtils.fileInfo(userId, file);
				vo.setFilepath(filepath);		
			}
			
			System.out.println(vo);
			
			groupService.insertGroup(vo);
			
			return "forward:/selectGroupList.y";
		}
	
	// 그룹 수정
	@RequestMapping("updateGroup.y")
	public String updateGroup(GroupVO vo) {
		groupService.updateGroup(vo);
		
		return "forward:/selectGroup.y?groupNo=" + vo.getGroupNo();
	}
	
	// 그룹 삭제
	@RequestMapping("deleteGroup.y")
	public String deleteGroup(int groupNo) {
		groupService.deleteGroup(groupNo);
		return "forward:/selectGroupList.y";
	}

	// 그룹 멤버--------------------------------------------------------------------
	// 그룹에 가입된 멤버 상세히 보여줌.
	@RequestMapping("groupMemberDetail.y")
	public ModelAndView groupMemberDetail(ModelAndView mv, int groupNo, @SessionAttribute MemberVO loginUser) {
		ArrayList<GroupMemberVO> list = groupMemberService.selectGroupMemberList(groupNo);
		GroupVO vo = groupService.selectGroup(groupNo);
		
		for(GroupMemberVO member : list) {
			if(loginUser.getUserId().equals(member.getUserId())) {
				mv.addObject("member", member);
			}
		}
		
		mv.addObject("group", vo);
		mv.addObject("list", list);
		mv.setViewName("group/GroupMemberList");

		return mv;
	}

	// 회원이 아닌 사람이 그룹 가입 요청
	@RequestMapping("requestGroupMember.y")
	public String requestGroupMember(GroupMemberVO vo) {
		groupMemberService.requestGroupMember(vo);
		
		return "forward:/selectGroup.y";
	}
	
	// 가입 승인.
	@RequestMapping("agreeGroupMember.y")
	public String agreeGroupMember(GroupMemberVO vo) {
		groupMemberService.agreeGroupMember(vo);
		
		return "forward:/groupMemberDetail.y";
	}
	
	// 가입 거절.  회원 강퇴.
	@RequestMapping("disagreeGroupMember.y")
	public String disagreeGroupMember(GroupMemberVO vo) {
		groupMemberService.deleteGroupMember(vo);
		
		return "forward:/groupMemberDetail.y";
	}
	
	// 그룹 탈퇴.
	@RequestMapping("deleteGroupMember.y")
	public String deleteGroupMember(GroupMemberVO vo) {
		groupMemberService.deleteGroupMember(vo);
		
		return "forward:/selectGroupList.y";
	}
	
	// 글쓰기----------------------------------------------------------------------
	// 글 추가
	@RequestMapping("insertGroupWrite.y")
	public String insertGroupWrite(GroupWriteVO vo) {
		groupWriteService.insertGroupWrite(vo);

		return "forward:/selectGroup.y";
	}
	
	// 글 삭제
	@RequestMapping("deleteGroupWrite.y")
	public String deleteGroupWrite(int writeNo, int groupNo) {
		groupWriteService.deleteGroupWrite(writeNo);
		
		return "forward:/selectGroup.y?groupNo=" + groupNo;
	}
	
	// 글 수정
	@RequestMapping("updateGroupWrite.y")
	public String updateGroupWrite(GroupWriteVO vo) {
		groupWriteService.updateGroupWrite(vo);
		
		return "forward:/selectGroup.y?groupNo=" + vo.getGroupNo();
	}
	
	/*@RequestMapping("reportWrite.y")
	public @ResponseBody int reportWrite() {
		groupWriteService.reportWrite();
		
		return 0;
	}*/
	
	// 좋아요 ----------------------------------------------------------------------
	@RequestMapping("groupLike.y")
	public @ResponseBody int groupLike(GroupLikeVO vo) {
		int result = groupLikeService.groupLike(vo);
		
		return result;
	}
	
	@RequestMapping("groupUnlike.y")
	public @ResponseBody int groupUnlike(GroupLikeVO vo) {
		int result = groupLikeService.groupUnlike(vo);
		
		return result;
	}
	
	// 댓글 -----------------------------------------------------------------------
	@RequestMapping("selectGroupCommentList.y")
	public @ResponseBody Map selectGroupCommentList(int writeNo, @SessionAttribute MemberVO loginUser) {
		ArrayList<GroupCommentVO> commentList = groupCommentService.selectGroupCommentList(writeNo);
		
		FireVO search = new FireVO();
		search.setClassify("GROUP_COMMENT");
		search.setFireById(loginUser.getUserId());
		ArrayList<FireVO> fireList = groupService.getfireList(search);
		
		if(fireList.size() < 1) {
			FireVO fivo = new FireVO("GROUP_COMMENT", 0, "admin", "admin", 0, 0, 0);
			
			fireList.add(fivo);
		}
		
		Map map = new HashMap();
		map.put("list", commentList);
		map.put("firelist", fireList);
		
		return map;
	}
	
	@RequestMapping("insertGroupComment.y")
	public @ResponseBody Map insertGroupComment(GroupCommentVO vo, @SessionAttribute MemberVO loginUser) {
		groupCommentService.insertGroupComment(vo);
		
		return selectGroupCommentList(vo.getWriteNo(), loginUser);
	}
	
	@RequestMapping("deleteGroupComment.y")
	public @ResponseBody Map deleteGroupComment(GroupCommentVO vo, @SessionAttribute MemberVO loginUser) {
		groupCommentService.deleteGroupComment(vo);
		ArrayList<GroupCommentVO> commentList = groupCommentService.selectGroupCommentList(vo.getWriteNo());
		
		FireVO search = new FireVO();
		search.setClassify("GROUP_MAIN");
		search.setFireById(loginUser.getUserId());
		ArrayList<FireVO> fireList = groupService.getfireList(search);
		
		Map map = new HashMap();
		map.put("list", commentList);
		map.put("firelist", fireList);
		
		return map;
	}
	
	// 답글 -----------------------------------------------------------------------------
	@RequestMapping("selectGroupCommentList2.y")
	public @ResponseBody ArrayList<GroupCommentVO> selectGroupCommentList2(GroupCommentVO vo) {
		ArrayList<GroupCommentVO> list = groupCommentService.selectGroupCommentList2(vo);
		
		return list;
	}
	
	@RequestMapping("insertGroupComment2.y")
	public @ResponseBody ArrayList<GroupCommentVO> insertGroupComment2(GroupCommentVO vo) {
		System.out.println(vo);
		groupCommentService.insertGroupComment2(vo);
		
		return selectGroupCommentList2(vo);
	}
	
	
}
