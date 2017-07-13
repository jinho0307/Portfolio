package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.vo.Movie;
import reserve.model.service.ReserveService;
import reserve.model.vo.Cinema;
import reserve.model.vo.Time;

/**
 * Servlet implementation class GetReserveInfo
 */
@WebServlet("/getrsvinfo")
public class GetReserveInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReserveInfo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<Movie> mlist = new ReserveService().movieList();
		ArrayList<Cinema> clist = new ReserveService().cinemaList();
		
		RequestDispatcher view = null;
		if(mlist.size() > 0){
			view = request.getRequestDispatcher("reserve/view/insertReserve.jsp");
			request.setAttribute("mlist", mlist);
			request.setAttribute("clist", clist);
			view.forward(request, response);
		}
		else{
			view = request.getRequestDispatcher("reserve/view/reserveError.jsp");
			request.setAttribute("message", "조회 실패");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
