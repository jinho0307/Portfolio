package movie.controller;

import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class MovieCommentServlet
 */
@WebServlet("/mcomment")
public class MovieCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCommentServlet() {
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
		String mId = request.getParameter("mId");
		String uId = request.getParameter("uId");
		String txtComment = request.getParameter("txtComment");
		
		
		MovieComment mcomment = new MovieComment(0,uId,mId,txtComment,null );
		
		int result = new MovieService().movieComment(mcomment);
				
		if(result > 0){
			response.sendRedirect("/bgm/msearch?movieid="+mId);
		}else{
			response.sendRedirect("/bgm/Movie/view/Error.jsp");
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
