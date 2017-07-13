package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 공지글 상세조회 서비스용 컨트롤러.
		response.setContentType("text/html; charset=utf-8");

		int noticeNo = Integer.parseInt(request.getParameter("noticeno"));
		
		
		// 조회수 1증가처리
		NoticeService nservice = new NoticeService();
		int result = nservice.updateReadCount(noticeNo);

		// 글번호로 공지글 조회
		Notice notice = nservice.selectOne(noticeNo);
		
		System.out.println(notice);
		int limit = 5;
		int start = 1;
		
		ArrayList<NoticeComment> list = nservice.commentList(noticeNo, limit, start);
		
		RequestDispatcher view = null;

		if (notice != null) {
			view = request.getRequestDispatcher("notice/view/noticeDetailView.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("comment", list);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("notice/view/noticeError.jsp");
			request.setAttribute("message", "공지글 상세조회 실패");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
