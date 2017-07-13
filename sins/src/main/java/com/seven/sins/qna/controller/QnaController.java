package com.seven.sins.qna.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.member.vo.MemberVO;
import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

@Controller
public class QnaController {

	public static Logger logger = LoggerFactory.getLogger("sinsLog"); 

	
	@Autowired
	private QnaService qnaService;

	@Value("#{dir['dir.url']}")
	private String dir;

	
	@RequestMapping("selectQna.n")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "option", required = false) String option) {
		int currentPage = 1;
		int listLimit = 10;
		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = 0;

		if (keyword == null)
			totalListCount = qnaService.getListCount();
		else
			totalListCount = qnaService.getKeywordCount(option, keyword);

		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);
		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		List<QnaContent> qnaList;
		if (keyword == null)
			qnaList = qnaService.selectList(currentPage, listLimit);

		else {
			qnaList = qnaService.searchList(currentPage, listLimit, option, keyword);
			mv.addObject("keyword", keyword);
			mv.addObject("option", option);
		}

		mv.addObject("totalCount", totalListCount);
		mv.addObject("qnaList", qnaList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);

		mv.setViewName("qna/QnaMain");
		return mv;
	}

	@RequestMapping("detailQna.n")
	public ModelAndView detailView(ModelAndView mv, @RequestParam(value = "no", required = false) String no) {

		if (no != null) {
			int qNo = Integer.parseInt(no);

			qnaService.increaseCount(qNo);
			QnaContent qc = qnaService.getContent(qNo);
			ArrayList<QnaComment> commentList = qnaService.getCommentList(qNo);

			mv.addObject("qna", qc);
			mv.addObject("commentList", commentList);

			mv.setViewName("qna/QnaDetail");

		} else {
			// 에러
		}

		return mv;
	}

	@RequestMapping("insertCom.n")
	public @ResponseBody Map<String, ArrayList<QnaComment>> insertCom(@RequestParam(value = "content") String content,
			@RequestParam(value = "qnaNo") int qnaNo, @RequestParam(value = "lev") int lev, QnaComment qc,
			@SessionAttribute("loginUser") MemberVO member) {

		String userId = member.getUserId();
		Map<String, ArrayList<QnaComment>> map = new HashMap<String, ArrayList<QnaComment>>();

		qc.setBackupId(userId);
		qc.setClassify("QNA_COMMENT");
		qc.setContent(content);
		qc.setFilepath(null);
		qc.setLev(lev);
		qc.setQnaNo(qnaNo);
		qc.setRef(0);
		qc.setUserId(userId);

		int result = qnaService.insertCom(qc);

		ArrayList<QnaComment> comList = qnaService.getCommentList(qnaNo);

		if (result > 0) {
			map.put("comList", comList);

		} else {
			// 실패
		}
		return map;
	}
	@RequestMapping("write.n")
	public ModelAndView qnaWrite(ModelAndView mv, QnaContent qna,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "content", required = false) String content,
			@SessionAttribute(value = "loginUser", required = false) MemberVO member,
			@RequestParam(value = "fileName", required = false) String fileName,
			HttpServletRequest request) {

		String userId = member.getUserId();
		qna.setUserId(userId);
		qna.setTitle(title);

	
		
		

			if (fileName != null) {
				
				String[] fileNames=fileName.split(" ");
				
				for (int i = 0; i < fileNames.length; i++) {
					File originFile = new File(request.getSession().getServletContext().getRealPath("/") + "/temp/" + fileNames[i]);

					File newFile = new File(dir + "/" + userId + "/" + fileNames[i]);
					originFile.renameTo(newFile);

					originFile.delete();

				}

				content = content.replaceAll("/sins/temp/", "/sins/resources/file/" + userId + "/");
			}

			qna.setContent(content);
			qna.setFilepath(fileName);

			int result = qnaService.insertQna(qna);

			if (result > 0)
				mv.setViewName("redirect:selectQna.n");
			else
				mv.setViewName("qna/error?message=글쓰기 에러");

			request.setAttribute("log", "글쓰기 완료");

		

		return mv;

	}

	//임시 파일 업로드
	@RequestMapping("tempUp.n")
	public @ResponseBody Map<String, String> tempUp(HttpServletRequest request, @RequestParam("filedata") MultipartFile file){
		
		Map<String, String> map=new HashMap<String, String>();
		
			
			
			if(request.getContentLength()  > 10*1024*1024){
				map.put("error", "10MB를 초과하였습니다.");
				return map;
			}
			
			
			
			
			
			String[] fileExts={"jpg", "gif", "png", "bmp"};
			String fileName=file.getOriginalFilename().toLowerCase();
			String fileExt=fileName.substring(fileName.indexOf(".")+1, fileName.length());
			
			int cnt=0;
			for(int i=0; i<fileExts.length;i++){
				if(fileExts[i].equals(fileExt))
					cnt++;
			}
			
			
			if(cnt==0){
				map.put("error", "올바른 확장자가 아닙니다.");
				return map;
			}
				
			
			String filePath= request.getSession().getServletContext().getRealPath("/")+File.separator+"temp/";
			
			File dir= new File(filePath);
			
			if(!dir.exists())
				dir.mkdirs();
			
			
			String newFileName= new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+"."+fileExt;
			
			
			File newFile=new File(filePath+newFileName);
			
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			filePath=filePath.replaceAll("\\\\", "/");
			map.put("filePath", "/temp/");
			map.put("fileName", newFileName);
		
		
		
		
		return map;
		
		
	}
	
	
	@RequestMapping("deleteCom.n")
	public @ResponseBody Map<String, ArrayList<QnaComment>> deleteCom(
			@RequestParam("qnaNo") int qnaNo,
			@RequestParam("comNo") int comNo
			){
		
		Map<String, ArrayList<QnaComment>> map= new HashMap<String, ArrayList<QnaComment>>();
		
		qnaService.deleteCom(qnaNo, comNo);
		
		ArrayList<QnaComment> comList = qnaService.getCommentList(qnaNo);

		map.put("comList", comList);
		
		return map;
	}
	
	@RequestMapping("deleteQna.n")
	public ModelAndView deleteQna(ModelAndView mv, @RequestParam("qnaNo") int qnaNo){
		
		qnaService.deleteQna(qnaNo);
		
		
		mv.setViewName("redirect:selectQna.n");
		return mv;
	}
	
	
	@RequestMapping("adjustQna.n")
	public ModelAndView adjustQna(ModelAndView mv, @RequestParam("qnaNo") int qnaNo,
			QnaContent qc){
		
		qc= qnaService.getContent(qnaNo);
		
		mv.addObject("qna", qc);
		
		mv.setViewName("qna/QnaAdjust");
		return mv;
	}
	
	
	@RequestMapping("updateQna.n")
	public ModelAndView updateQna(ModelAndView mv, QnaContent qna,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "content", required = false) String content,
			@SessionAttribute(value = "loginUser", required = false) MemberVO member,
			@RequestParam(value = "fileName", required = false) String fileName,
			@RequestParam("qnaNo") int qnaNo,
			@RequestParam(value="orignFileName", required=false) String orignFileName,
			HttpServletRequest request) {

		
		String userId = member.getUserId();
		qna.setUserId(userId);
		qna.setTitle(title);

	
		//수정후 원래 파일 삭제
		if(orignFileName!=null&&fileName!=null){
			String[] orignFileNames=orignFileName.split(" ");
			
			for(int i=0; i< orignFileNames.length;i++){
				File orignFile=new File(dir + userId+"/" + orignFileNames[i]);
				
				orignFile.delete();
				
			}
		}
		
		

			if (fileName != null) {
				
				String[] fileNames=fileName.split(" ");
				
				for (int i = 0; i < fileNames.length; i++) {
					File originFile = new File(request.getSession().getServletContext().getRealPath("/") + "/temp/" + fileNames[i]);

					File newFile = new File(dir + "/" + userId + "/" + fileNames[i]);
					originFile.renameTo(newFile);

					originFile.delete();

				}

				content = content.replaceAll("/sins/temp/", "/sins/resources/file/" + userId + "/");
			}

			qna.setContent(content);
			qna.setFilepath(fileName);

			qna.setQnaNo(qnaNo);
			
			int result = qnaService.updateQna(qna);

			if (result > 0)
				mv.setViewName("forward:detailQna.n?no="+qnaNo);
			else
				mv.setViewName("qna/error?message=글수정 에러");

			
		

		return mv;

	}

}
