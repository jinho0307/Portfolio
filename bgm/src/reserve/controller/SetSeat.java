package reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import member.model.service.MemberService;
import member.model.vo.Member;
import reserve.model.service.ReserveService;
import reserve.model.vo.reserveInfo;

/**
 * Servlet implementation class SetSeat
 */
@WebServlet("/sets")
public class SetSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetSeat() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String a1 = request.getParameter("1");
		String a2 = request.getParameter("2");
		String a3 = request.getParameter("3");
		String a4 = request.getParameter("4");
		String a5 = request.getParameter("5");
		String a6 = request.getParameter("6");
		String selectseat = request.getParameter("7");
		String totalprice = request.getParameter("8");
		HttpSession session1 = request.getSession(false);
		Member m = (Member)session1.getAttribute("loginUser");

		reserveInfo ri = new reserveInfo(a1, a2, a3, a4, a5, a6);
		String[] seat = selectseat.split(" ");
		
		
		int price = Integer.parseInt(totalprice) * -1;
	
		int result = 0;
		int result2 = new ReserveService().setMovieReserve(a3, seat.length);
		
		for(int x=0;x<seat.length;x++){
			result = new ReserveService().setSeat(seat[x], ri, m.getUserId());
			if(result < 0){
				request.setAttribute("message", "예매 오류 발생!");
				response.sendRedirect("/bgm/reserve/view/reserveError");
			}
		}
			
		if(result > 0){
			int presult = new ReserveService().minusCash(m.getUserId(), ri, price);
				if(presult > 0){
				Member loginUser = new MemberService().checkLogin(m.getUserId());
				HttpSession session=request.getSession(false);
				session.setAttribute("loginUser", loginUser);
				response.sendRedirect("/bgm/index.jsp");
			}
		}
		else {
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
