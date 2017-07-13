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
 * Servlet implementation class NewsDetailViewServlet
 */
@WebServlet("/detail")
public class NewsDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; utf-8"); 
		request.setCharacterEncoding("utf-8"); 
		
		String comName=request.getParameter("comname");
		
		NewsCompany nc=new NewsService().searchCompany(comName);
		
		ArrayList<NewsCompany> list = new NewsService().getNewsCom();
		
		RequestDispatcher view=null;
		
		if(nc!=null&&list!=null){
			
			view= request.getRequestDispatcher("news/view/newsDetailView.jsp");
			request.setAttribute("company", nc);
			
			request.setAttribute("newslist", list);
			
			view.forward(request, response);
			
			
			
		}else{
			view=request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "뉴스 상세페이지를 불러오는데 실패하였습니다.");
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
