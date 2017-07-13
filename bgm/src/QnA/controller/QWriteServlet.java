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
 * Servlet implementation class QWriteServlet
 */
@WebServlet("/qwrite")
public class QWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String qTitle = request.getParameter("qtitle");
		String qWriter = request.getParameter("qwriter");
		String qContent = request.getParameter("qcontent");
		String category = request.getParameter("question");
		String cinemaId = request.getParameter("qcinema");
		
		System.out.println(qTitle + "/" + qWriter + "/"  + qContent + "/"  + category + "/"  + cinemaId);
		
		Q q = new Q(qTitle, qContent, cinemaId, category, qWriter);

		int result = new QService().insertQ(q);

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
