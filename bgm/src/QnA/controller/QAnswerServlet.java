package QnA.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import QnA.model.service.QService;
import QnA.model.vo.Q;

/**
 * Servlet implementation class QAnswerServlet
 */
@WebServlet("/qanswer")
public class QAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String answer = request.getParameter("answer");
		int qNo = Integer.parseInt(request.getParameter("qno"));
		System.out.println(qNo);
		System.out.println();
		System.out.println(answer);
		int result = new QService().insertAnswer(answer, qNo);

		if (result > 0) {
			response.sendRedirect("/bgm/qlist");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("view/notice/noticeError.jsp");
			request.setAttribute("message", "공지글쓰기 실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
