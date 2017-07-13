package pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class CashModifyServlet
 */
@WebServlet("/cashmodify")
public class CashModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 토탈 캐쉬 변경 컨트롤러
		String id = request.getParameter("userid");
		int totalcash = Integer.parseInt(request.getParameter("totalcash")); 
		int result = new MemberService().cashModify(id, totalcash);
		System.out.println(totalcash);
		RequestDispatcher view = null;
		if(result > 0 ){
			view = request.getRequestDispatcher("pay/view/success.jsp");
			request.setAttribute("massage", "변경이 완료되었습니다.");
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "병경에 실패 하엿습니다..");
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
