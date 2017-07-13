package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import member.model.vo.*;
import movie.model.service.MovieService;
import movie.model.vo.*;
import movie.model.vo.Movie;
import reserve.model.service.*;
import reserve.model.vo.*;

/**
 * Servlet implementation class GetSeat
 */
@WebServlet("/gets")
public class GetSeat extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSeat() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      HttpSession session = request.getSession(false);
      Member m = (Member)session.getAttribute("loginUser");
      String user = m.getUserId();
      String movie = request.getParameter("mname");
      String cname = request.getParameter("cname");
      String dname = request.getParameter("dname");
      String tname = request.getParameter("tname");
      String screen = request.getParameter("screen");
      
      String sar[] = dname.split("-");
      
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
      
      String mpname = new ReserveService().getMoviePoster(movie);
      
      String mage = new ReserveService().getMovieAge(movie);
      
      reserveInfo ri = new reserveInfo(cname, screen, movie, mage, mpname, date);
      
      String[] ssar1 = new ReserveService().getSeat(movie, cname, date, screen);
      int index = 0;
      Movie movieInfo = new MovieService().searchMovieId(movie);
      if(ssar1.length > 0){
         if(ssar1[0] != null){
            for(int x=0;x<ssar1.length;x++){
               if(ssar1[x] != null){
                  ssar1[x] = ssar1[x].split("_")[0];
               }
               else {
                  index = x;
                  break;
               }
            }
         }
      }
      String ssar[] = new String[index];
      for(int x=0;x<index;x++){
         ssar[x] = ssar1[x];
      }

      RequestDispatcher rd = null;
      
      if(ri != null){
         rd = request.getRequestDispatcher("reserve/view/seatInfo.jsp");
         request.setAttribute("ssar", ssar);
         request.setAttribute("ri", ri);
         request.setAttribute("movie", movieInfo);
         rd.forward(request, response);
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