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
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/findpwd")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 찾기 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("userId");
		String name = request.getParameter("userName");
		String phone = request.getParameter("guk") +"-"+request.getParameter("userPhone1")+"-"+request.getParameter("userPhone2");
		
		MemberService mservice = new MemberService();
		
		Member member = mservice.findPwd(id,name,phone);
		
		
		RequestDispatcher view = null;
		if(member !=null){
			view = request.getRequestDispatcher("member/view/findSuccess.jsp");
			request.setAttribute("userp", member);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "비밀번호를 찾을수없습니다.");
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
