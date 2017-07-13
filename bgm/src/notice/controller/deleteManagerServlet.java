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

/**
 * Servlet implementation class deleteManagerServlet
 */
@WebServlet("/deletemanager")
public class deleteManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteManagerServlet() {
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

		String str = request.getParameter("arr");

		String[] sarr = str.split(",");
		
		int[] arr = new int[sarr.length];
		int result = 0;
		
		for(int i = 0; i < sarr.length; i++){
			arr[i] = Integer.parseInt(sarr[i]);
			
			result = new NoticeService().deleteNotice(arr[i]);
		}

		if (result > 0) {
			response.sendRedirect("/bgm/nmanager");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("view/notice/noticeError.jsp");
			request.setAttribute("message", "공지글쓰기 실패");
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
