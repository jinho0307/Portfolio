package reserve.controller;

import java.io.IOException;
import java.net.StandardSocketOptions;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import pay.model.service.PayService;

/**
 * Servlet implementation class CashReturn
 */
@WebServlet("/cr2")
public class CashReturn2 extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashReturn2() {
        super();
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      String userid = (String)request.getAttribute("userid");
      String movieid = (String)request.getAttribute("movieid");
      int price = (Integer)request.getAttribute("price");
      
      int result = new PayService().cargeCash(userid, movieid, price);

      if(result > 0){
       
         response.sendRedirect("/bgm/getrsvlist?page=1");
      }else{
         RequestDispatcher view = request.getRequestDispatcher("member/view/memberError.jsp");
         request.setAttribute("massage", "재로그인 실패");
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