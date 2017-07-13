package movie.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.model.service.MovieService;
import movie.model.vo.Movie;
import movie.model.vo.MovieFileLink;
import sun.awt.dnd.SunDragSourceContextPeer;

/**
 * Servlet implementation class MovieUpdateServlet
 */
@WebServlet("/mupdate")
public class MovieUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MovieUpdateServlet() {
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
		String mtemp = request.getParameter("mDate");
		String mName = request.getParameter("mName");
		String mDirector = request.getParameter("mDirector");
		String mCast = request.getParameter("mCast");
		String mGenre = request.getParameter("mGenre");
		Date mDate = Date.valueOf(mtemp);
		String mAge = request.getParameter("mAge");
		String mSite = request.getParameter("mSite");
		String mPlot = request.getParameter("mPlot");
		String mSite1 = request.getParameter("mSite1");
		String mMp4 = request.getParameter("mMp4");
		String mImg1 = request.getParameter("mImg1");
		String mImg2 = request.getParameter("mImg2");
		String mImg3 = request.getParameter("mImg3");
		String mImg4 = request.getParameter("mImg4");
		String mImg5 = request.getParameter("mImg5");
		String mImg6 = request.getParameter("mImg6");
		String mImg7 = request.getParameter("mImg7");
		String mImg8 = request.getParameter("mImg8");
		System.out.println(mSite1);
		System.out.println(mImg6);
		System.out.println(mMp4);
		int mYN = Integer.parseInt(request.getParameter("mYN"));
		int mPay = Integer.parseInt(request.getParameter("mPay"));
		
		Movie movie = new Movie(mId, mName, mDate,  mDirector,  mCast,  mGenre,  mAge,
				 mSite,  mPlot,  mYN, mPay);
		MovieFileLink movieLink = new MovieFileLink(mSite1, mId, mImg1,mImg2,mImg3,mName,mImg4,mImg5,mImg6,mImg7,mImg8,mMp4,mDate);
		
		
		int result = new MovieService().updateMovie(movie, movieLink);
				
		if(result > 0){
			response.sendRedirect("/bgm/mmlist");
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
