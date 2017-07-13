package news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import news.model.service.NewsService;
import news.model.vo.NewsCompany;
import news.model.vo.Subscription;


/**
 * Servlet implementation class SubscriptionServlet
 */
@WebServlet("/sub")
public class SubscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubscriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = utf-8;"); 
		
		ArrayList<NewsCompany> list = new NewsService().getNewsCom();
		ArrayList<Subscription> sublist = null;
		HttpSession session = request.getSession(false);  
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		if(loginUser!=null){
			sublist =new NewsService().getSubList(loginUser.getUserId());
		}
		
		
		
		
		
		
		RequestDispatcher rd=null;
		
		if(list!=null){
		rd= request.getRequestDispatcher("news/view/subscription.jsp");
		if(loginUser!=null){
			request.setAttribute("sublist", sublist);
		}
		request.setAttribute("newslist", list);
		
		rd.forward(request, response);
		}else{
			rd= request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "신문사 목록을 불러오는데 실패하였습니다.");
			rd.forward(request, response);
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
