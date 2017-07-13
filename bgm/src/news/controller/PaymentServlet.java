package news.controller;

import java.io.IOException;

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
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/pay")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; utf-8");
		request.setCharacterEncoding("utf-8");

		int newsNo = Integer.parseInt(request.getParameter("newsno"));

		HttpSession session = request.getSession();

		Member member = (Member) session.getAttribute("loginUser");
		
		RequestDispatcher view = null;
		if (member != null) {

			NewsCompany newsCom = new NewsService().selectNews(newsNo);

			
			Subscription sub= new NewsService().getUserSub(member.getUserId(), newsNo);


			
			
			if(sub!=null){
				response.sendRedirect("/bgm/mynews");
				return;
			}
			
			
			
			if (newsCom != null) {

				view = request.getRequestDispatcher("news/view/payment.jsp");

				request.setAttribute("newscom", newsCom);
				view.forward(request, response);
			} else {
				 view= request.getRequestDispatcher("news/view/newsError.jsp");
				 request.setAttribute("message", "결제페이지를 불러오는데 실패하였습니다.");
				 view.forward(request, response);
			}

		}else{
			
			view=request.getRequestDispatcher("member/view/login.jsp");
			request.setAttribute("backUrl", "/bgm/sub");
			view.forward(request, response);
		}
	}

}
