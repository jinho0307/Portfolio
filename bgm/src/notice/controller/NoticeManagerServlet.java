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
import notice.model.vo.Search;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nmanager")
public class NoticeManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeManagerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		NoticeService nservice = new NoticeService();
		
		int currentPage = 1;
		int limit = 10;
		Search search = new Search();
		if(request.getParameter("page") != null) 
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int listCount = nservice.getListCount();
		//ArrayList<Notice> list = nservice.selectList();
		ArrayList<Notice> list = nservice.selectList(currentPage, limit);

		// 총 페이지 수 계산 : 목록이 최소 1개일 때, 1page 로 처리
		// 0.9 를 더함.
		int lastPage = (int)((double)listCount / limit + 0.9);
		// 현재 페이지에 보여질 시작 페이지 값 (1, 11, 21, 31, ...)
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		// 현재 페이지에 보여질 마지막 페이지 값 (10, 20, 30, 40,...)
		int endPage = startPage + limit -1;
		
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		RequestDispatcher view = null;

		if (list.size() > 0) {
			view = request.getRequestDispatcher("notice/view/noticeManager.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("notice/view/noticeManager.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
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
