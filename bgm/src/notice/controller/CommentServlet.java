package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import notice.model.service.NoticeService;
import notice.model.vo.NoticeComment;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/ncomment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeno"));
		String content = request.getParameter("content");
		String userId = request.getParameter("userid");
		
		NoticeService nservice = new NoticeService();
		
		nservice.insertComment(noticeNo, content, userId);
		
		int listsize = nservice.getCommentSize(noticeNo);
		int limit = 5;
		int start = 1;
		if(request.getParameter("start") != null){
			start = Integer.parseInt(request.getParameter("start"));
		}
		
		System.out.println(start);
		
		ArrayList<NoticeComment> list = nservice.commentList(noticeNo, limit, start);
	
	      JSONObject json = new JSONObject();
	      JSONArray jarr = new JSONArray();
	      
	      for(int i=0; i<list.size();i++){
	         
	         JSONObject jon = new JSONObject();
	        jon.put("content", list.get(i).getCommentContent());
	        jon.put("userid", list.get(i).getUserId());
	        jon.put("date", String.valueOf(list.get(i).getCommentDate()));
	         
	         jarr.add(jon);
	      }
	      
	      json.put("list", jarr);
	      json.put("start", String.valueOf(start));
	      	
	      response.setContentType("application/json"); 
	      PrintWriter out = response.getWriter();
	      out.print(json.toJSONString());
	      out.flush();
	      out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
