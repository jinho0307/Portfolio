package QnA.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnA.model.vo.Q;
import QnA.model.service.QService;
/**
 * Servlet implementation class QAlterServlet
 */
@WebServlet("/qalter")
public class QAlterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QAlterServlet() {
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

		int qNo = Integer.parseInt(request.getParameter("qno"));

		// 조회수 1증가처리
		QService qservice = new QService();
		int result = qservice.updateReadCount(qNo);

		// 글번호로 공지글 조회
		Q q = qservice.selectOne(qNo);

		RequestDispatcher view = null;

		if (q != null) {
			view = request.getRequestDispatcher("QnA/view/qAlterForm.jsp");
			request.setAttribute("q", q);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("QnA/view/qError.jsp");
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
