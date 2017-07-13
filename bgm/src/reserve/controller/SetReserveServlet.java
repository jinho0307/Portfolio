package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.service.MovieService;
import movie.model.vo.Movie;
import reserve.model.service.ReserveService;
import reserve.model.vo.Relation;

/**
 * Servlet implementation class SetReserveServlet
 */
@WebServlet("/setreserve")
public class SetReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetReserveServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String movie = request.getParameter("mname");
		String cname = request.getParameter("cname");
		String dname = request.getParameter("dname");
		String tname = request.getParameter("tname");
		String screen = request.getParameter("screen");
		String sar[] = dname.split("-");
		
		System.out.println(movie);
		System.out.println(cname);
		System.out.println(dname);
		System.out.println(tname);
		System.out.println(screen);
		
		String date = "";
		for(int x=0;x<3;x++){
			if(x <= 1){
				date += sar[x] + "/";
			}
			else {
				date += sar[x];
			}
		}
		
		date += " " + tname;
		
		Movie movieinfo = new MovieService().searchMovieId(movie);
		String screenid = new ReserveService().getScreenRoomId(screen);
		String cinemaid = new ReserveService().getCinemaId(cname);
		int timeIndex = new ReserveService().getTimeIndex(date);
		
		Relation r = new Relation(movieinfo.getmId(), cinemaid, screenid, timeIndex);
		ArrayList<Relation> list = new ReserveService().getRelation();
		boolean flag = true;
		for(int x=0;x<list.size();x++){
			System.out.println(list.get(x).getCinemaId() + " " + list.get(x).getScreenRoomId() + " " + list.get(x).getMovieId() + " " + list.get(x).getTimeIndex());
			System.out.println(r.getCinemaId() + " " + r.getScreenRoomId() + " " + r.getMovieId() + " " + r.getTimeIndex());
			if(list.get(x).getCinemaId().equals(r.getCinemaId()) && list.get(x).getMovieId().equals(r.getMovieId()) && 
					list.get(x).getScreenRoomId().equals(r.getScreenRoomId()) && list.get(x).getTimeIndex() == r.getTimeIndex()){
				flag = false;
				
			}
			if(list.get(x).getCinemaId().equals(r.getCinemaId()) && list.get(x).getScreenRoomId().equals(r.getScreenRoomId()) && list.get(x).getTimeIndex() == r.getTimeIndex()){
				flag = false;
			}
			System.out.println("flag = " + flag);
		}
		
		int result = new ReserveService().setRelation(r);

		if(flag){
			if(result > 0){
				flag = true;
				response.sendRedirect("/bgm/index.jsp");
			}
		}
		else {
			flag = true;
			request.setAttribute("message", "등록하신 상영정보가 이미 있습니다.");
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
