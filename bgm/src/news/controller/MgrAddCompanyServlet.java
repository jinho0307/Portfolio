package news.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import news.model.service.NewsService;

/**
 * Servlet implementation class MgrAddCompanyServlet
 */
@WebServlet("/addcompany")
public class MgrAddCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrAddCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
	

		// 전송파일에 대한 용량 제한을 설정하고 싶으면 정함 : 10메가바이트로 할경우
		int limitSize = 1024 * 1024 * 100;

		// 전송방식에 multipart 설정을 했는지 검사함
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (!isMultipart) {
			RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "multipart 설정을 하지 않았습니다.");
			view.forward(request, response);
		}
		
		

		String savePath = request.getSession().getServletContext().getRealPath("/news/images/");

		
		String originalFileName = null;
		// 실제 저장기록될 변경된 파일명 저장용 변수
		

		MultipartRequest mrequest = new MultipartRequest(request, savePath, limitSize, "utf-8",
				new DefaultFileRenamePolicy());
		
		
		
		String comName=mrequest.getParameter("comName");
		String mainURL=mrequest.getParameter("mainURL");
		String price=mrequest.getParameter("price");
		String deposit=mrequest.getParameter("deposit");
		
		
		
		originalFileName = mrequest.getFilesystemName("upfile");

		
		int result= new NewsService().insertCom(comName, mainURL, new File(originalFileName).getName(), Integer.parseInt(price), Integer.parseInt(deposit));
		
		if (result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("news/view/addSuccess.jsp");
			request.setAttribute("result", 1);
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "뉴스사를 추가하지 못했습니다.");
			view.forward(request, response);
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
