package pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import pay.model.service.PayService;

/**
 * Servlet implementation class CashCharge
 */
@WebServlet("/ccharge")
public class CashCharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashCharge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 캐쉬 충전 서블렛
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String userid = request.getParameter("userid");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		int result = new PayService().cargeCash(userid, amount);
		

		if(result > 0){
			Member loginUser = new MemberService().checkLogin(userid);
			HttpSession session=request.getSession(false);
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect("/bgm/index.jsp");
		}else{
			RequestDispatcher view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "재로그인 실패");
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
