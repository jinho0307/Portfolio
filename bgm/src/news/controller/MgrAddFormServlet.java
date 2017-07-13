package news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.service.NewsService;
import news.model.vo.NewsCompany;

/**
 * Servlet implementation class MgrPageServlet
 */
@WebServlet("/addform")
public class MgrAddFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrAddFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = utf-8;"); 
		
		ArrayList<NewsCompany> list = new NewsService().getNewsCom();
		
		RequestDispatcher view=null;
		if(list!=null&& list.size()>0){
			view=request.getRequestDispatcher("news/view/addNewsForm.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else{
			view=request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "신문사 목록을 불러오는데 실패하였습니다.");
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
