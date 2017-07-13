package reserve.controller;

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
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import reserve.model.vo.ReserveName;

/**
 * Servlet implementation class Cancel
 */
@WebServlet("/ccv")
public class CancelView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelView() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("loginUser");
		String loginUser = m.getUserId();
		
		ArrayList<Reserve> list = new ReserveService().getReserve(loginUser);
		
		ArrayList<ReserveName> nlist = new ArrayList<ReserveName>();
		
		for(int x=0; x<list.size(); x++){
			Reserve r = list.get(x);

			ReserveName rn = new ReserveService().getReserveName(r);
			
			nlist.add(rn);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("reserve/view/cancelTicket.jsp");
		request.setAttribute("nlist", nlist);
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
