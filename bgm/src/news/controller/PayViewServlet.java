package news.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.service.NewsService;
import news.model.vo.NewsCompany;
import news.model.vo.Subscription;

/**
 * Servlet implementation class PayViewServlet
 */
@WebServlet("/payview")
public class PayViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
	
		String comNo=request.getParameter("comNo");
		String userId=request.getParameter("userId");
		
		Subscription sub=new NewsService().getUserSub(userId, Integer.parseInt(comNo)); 
		
		NewsCompany nc=new NewsService().selectNews(Integer.parseInt(comNo));
		
		RequestDispatcher view=null;
		if(sub!=null){
			view= request.getRequestDispatcher("news/view/newsPayView.jsp");
			request.setAttribute("sub", sub);
			request.setAttribute("nc", nc);
			view.forward(request, response);
		}else{
			view=request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "상세 거래내역을 불러오는데 실패하였습니다.");
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
