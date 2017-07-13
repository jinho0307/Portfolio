package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findid")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디 찾기 컨트롤러
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("userName");
		String phone = request.getParameter("guk") +"-"+request.getParameter("userPhone1")+"-"+request.getParameter("userPhone2");
		
		Member user = new MemberService().findId(name,phone);
		
		RequestDispatcher view = null;
		if(user != null){
			view = request.getRequestDispatcher("member/view/findSuccess.jsp");
			request.setAttribute("user", user);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/success.jsp");
			request.setAttribute("massage", "아이디를 찾을수 없습니다.");
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
