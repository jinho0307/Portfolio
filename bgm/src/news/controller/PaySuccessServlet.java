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
import pay.model.service.PayService;

/**
 * Servlet implementation class PayPageServlet
 */
@WebServlet("/paySuc")
public class PaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doPost(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String option = request.getParameter("option");
		
		
		
		String comName= request.getParameter("comName");
		int price= Integer.parseInt(request.getParameter("price"));
		String id= request.getParameter("id");
	
		String endDay=request.getParameter("endDay");
		String endDate=endDay.replaceAll(" ", "/").replace("년", "").replace("월", "").replace("일", "");
		
		
		NewsCompany nc= new NewsService().searchCompany(comName);
		
		
		
		HttpSession session = request.getSession(false);
		Member loginUser =(Member)session.getAttribute("loginUser");
		
		if(option!=null&&option.equals("point")){
			
			int pay = new PayService().cargeCash(loginUser.getUserId(), nc.getCompanyNo(), (-1)*price);
			
			if(pay > 0){
				loginUser.setTotalCash(loginUser.getTotalCash() - price);
				session.removeAttribute("loginUser");
				session.setAttribute("loginUser", loginUser);
				
			}else{
				RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
				request.setAttribute("message", "결제에 실패하였습니다. 다시 시도해주세요.(포인트db)");
				view.forward(request, response);
				return;
			}
			
		}
		
		
		int result=new NewsService().insertSub(nc.getCompanyNo(), price, id, endDate);
		
		if(result>0){
			
			session.setAttribute("endDay", endDay);
			session.setAttribute("nc", nc);
			session.setAttribute("price", price);
			response.sendRedirect("/bgm/news/view/paySuccess.jsp");
			
		}else{
			
			RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
			
			request.setAttribute("message", "결제에 실패하였습니다. 다시 시도해주세요.");
			view.forward(request, response);
		}
	}

}
