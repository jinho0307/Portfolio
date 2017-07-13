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
 * Servlet implementation class ReserveServlet
 */
@WebServlet("/rsv")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 예매시 필요한 객체에 정보 가져와서 저장시키는 컨트롤러
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<Movie> mlist = new ReserveService().movieList();
		
		RequestDispatcher view = null;
		if(mlist.size() > 0){
			view = request.getRequestDispatcher("reserve/view/reserve.jsp");
			request.setAttribute("mlist", mlist);
			view.forward(request, response);
		}
		else{
			view = request.getRequestDispatcher("reserve/view/reserveError.jsp");
			request.setAttribute("message", "시간 조회 실패");
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
