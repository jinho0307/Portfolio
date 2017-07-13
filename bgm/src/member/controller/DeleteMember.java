package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/delmember")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원탈퇴 컨롤러
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("userid");
		System.out.println(userid);
		int result = new MemberService().delMember(userid);
		
		RequestDispatcher view = null;
		if(result > 0 ){
			HttpSession session = request.getSession(false);
			if(session != null){
				session.invalidate();
			}
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "회원탈퇴 되었습니다.");
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "회원 탈퇴에 실패하였습니다.");
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
