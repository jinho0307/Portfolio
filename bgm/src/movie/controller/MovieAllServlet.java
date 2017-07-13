package movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import movie.model.service.MovieService;
import movie.model.vo.MovieFileLink;

/**
 * Servlet implementation class MovieAllServlet
 */
@WebServlet("/movieMap")
public class MovieAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MovieAllServlet() {
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 전체 회원조회 서비스처리용 컨트롤러
				response.setContentType("text/html; charset=utf-8");
				
				ArrayList<MovieFileLink> movieMap = new MovieService().selectMoviePosterAll();
				
				
				RequestDispatcher view = null;
				if(movieMap != null){
					view = request.getRequestDispatcher("Movie/view/MovieMain.jsp");
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
