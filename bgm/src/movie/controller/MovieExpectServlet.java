package movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.service.MovieService;
import movie.model.vo.MovieFileLink;

/**
 * Servlet implementation class MovieExpectServlet
 */
@WebServlet("/mexpect")
public class MovieExpectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieExpectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<MovieFileLink> movieMap = new MovieService().selectMoviePosterExpect();
		
		RequestDispatcher view = null;
		if(movieMap != null){
			view = request.getRequestDispatcher("Movie/view/MovieMain2.jsp");
			request.setAttribute("movieMap", movieMap);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("Movie/view/Error.jsp");
			request.setAttribute("message", "영화 전체 페이지 조회 실패");
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
