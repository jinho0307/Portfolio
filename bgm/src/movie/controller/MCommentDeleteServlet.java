package movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.service.MovieService;
import movie.model.vo.Movie;
import movie.model.vo.MovieComment;
import movie.model.vo.MovieFileLink;

/**
 * Servlet implementation class MCommentDeleteServlet
 */
@WebServlet("/deletec")
public class MCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디를 이용한 영화정보 조회용 컨트롤러
		
		//1. 인코딩 처리
		response.setContentType("text/html; charset=utf-8");
		
		//2. 전송값(parameter) 추출해서 변수에 기록
		String userid = request.getParameter("userid");
		String movieId = request.getParameter("movieid");
		
		//3. 모델용 서비스클래스의 처리 메소드로 넘기고, 결과받기
		MovieComment mcomment = new MovieService().mCommentDelet(userid);
		Movie movie = new MovieService().selectMovie(movieId);
		MovieFileLink movieLink = new MovieService().selectMovieFileLink(movieId);
		ArrayList<MovieComment> movieMap = new MovieService().selectMovieComment(movieId);
		//4. 받은 결과에 대한 성공/실패 페이지 내보내기
		RequestDispatcher rd = null;
		if(movie != null){
			rd = request.getRequestDispatcher("Movie/view/Pokemon.jsp");
			request.setAttribute("movie", movie);
			request.setAttribute("movieLink", movieLink);
			request.setAttribute("movieMap", movieMap);
			rd.forward(request, response);
			
		}else{
			request.setAttribute("message", "영화 조회 실패");
			rd = request.getRequestDispatcher("Movie/view/Error.jsp");
			//절대경로 사용 못 함.  상대경로만 사용할 수 있음.
			rd.forward(request, response);
		}
	}

}
