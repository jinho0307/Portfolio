package QnA.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnA.model.service.QService;
import QnA.model.vo.Q;
import QnA.model.vo.QSearch;

/**
 * Servlet implementation class QSearchServlet
 */
@WebServlet("/qsearch")
public class QSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset=utf-8");
		QService qservice = new QService();

		String searchText = request.getParameter("searchText");
		String searchCinema = request.getParameter("searchCinema");
		String searchType = request.getParameter("searchType");
		String searchCategory = request.getParameter("searchCategory");

		QSearch search = new QSearch(searchText, searchCinema, searchType, searchCategory);

		int currentPage = 1;
		int limit = 10;

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = qservice.getSearchListCount(search);

		ArrayList<Q> list = qservice.searchQ(search, currentPage, limit);

		// 총 페이지 수 계산 : 목록이 최소 1개일 때, 1page 로 처리
		// 0.9 를 더함.
		int lastPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여질 시작 페이지 값 (1, 11, 21, 31, ...)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여질 마지막 페이지 값 (10, 20, 30, 40,...)
		int endPage = startPage + limit - 1;

		if (lastPage < endPage) {
			endPage = lastPage;
		}

		RequestDispatcher view = null;

		if (list.size() > 0) {
			view = request.getRequestDispatcher("QnA/view/qListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("QnA/view/qListView.jsp");
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
