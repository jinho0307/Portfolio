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
 * Servlet implementation class MovieNameSearchServlet
 */
@WebServlet("/mmsearch2")
public class MovieNameSearchServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieNameSearchServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 영화정보추가 처리용 컨트롤러
				//1. 전송값에 한글이 있을 경우 인코딩처리
				request.setCharacterEncoding("utf-8");
				//2. 응답할 뷰 페이지 타입 지정
				response.setContentType("text/html; charset=utf-8");
				
				//3. 전송값 꺼내서 변수에 담기
				String mId = request.getParameter("select");
				
				String select = request.getParameter("sel");
				
				
				ArrayList<Movie> movieMap = new MovieService().searchMovie2(mId, select);
				
				RequestDispatcher view = null;
				if(movieMap != null){
					view = request.getRequestDispatcher("Movie/view/MovieListView2.jsp");
					request.setAttribute("movieMap", movieMap);
					request.setAttribute("mId", mId);
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
