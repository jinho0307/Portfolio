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
import news.model.vo.NewsURL;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/newscontroll")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = utf-8;"); 
		
		ArrayList<NewsCompany> list = new NewsService().getNewsCom();
		ArrayList<NewsURL> ulist=new NewsService().getNewsURL();
		RequestDispatcher rd=null;
		
		if(list!=null&&ulist!=null){
			rd= request.getRequestDispatcher("news/view/news.jsp");
			request.setAttribute("newslist", list);
			request.setAttribute("newsurl", ulist);
			rd.forward(request, response);
		}else{
			rd=request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "뉴스를 불러오는데 실패하였습니다.");
			rd.forward(request, response);
		}
		
		
		
	}

	
}
