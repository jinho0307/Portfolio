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
import movie.model.vo.Movie;
import movie.model.vo.MovieFileLink;

/**
 * Servlet implementation class MovieManagerListServlet
 */
@WebServlet("/mmlist")
public class MovieManagerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieManagerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		/*Movie movie = new Movie();
		int currentPage = 1;
		int limit = 10;
		if(request.getParameter("page") != null) 
			currentPage = Integer.parseInt(request.getParameter("page"));*/
		
		
		ArrayList<Movie> movieMap = new MovieService().selectMovieAllList();
		
		RequestDispatcher view = null;
		if(movieMap != null){
			view = request.getRequestDispatcher("Movie/view/MovieListView.jsp");
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
		doGet(request, response);
	}

}
