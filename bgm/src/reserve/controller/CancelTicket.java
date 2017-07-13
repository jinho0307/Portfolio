package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import reserve.model.vo.ReserveName;

/**
 * Servlet implementation class CancelTicket
 */
@WebServlet("/cct")
public class CancelTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelTicket() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String user = request.getParameter("user");
		String cinema = request.getParameter("cinema");
		String screen = request.getParameter("screen");
		String movie = request.getParameter("movie");
		String seat = request.getParameter("seat");
		String time = request.getParameter("time");
		
		String age[] = seat.split("_");
		
		int price = (Integer.parseInt(age[1]) == 1)? 10000 : 8000;
		
		ReserveName rn = new ReserveName(user, cinema, time, screen, age[0], movie);
		
		Reserve r = new ReserveService().checkTicket(rn);
		
		int result = new ReserveService().deleteReserve(r, age[1]);
		
		if(result > 0){
			RequestDispatcher rd = request.getRequestDispatcher("cr");
			request.setAttribute("userid", user);
			request.setAttribute("movieid", r.getMovieId());
			request.setAttribute("price", price);
			rd.forward(request, response);
		}
		else {
			request.setAttribute("message", "예매 취소 실패!!!");
			response.sendRedirect("/bgm/reserve/view/reserveError.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
