package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/login")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		
		Member member = new MemberService().checkLogin(id, password);
		
		/*if(mname == null){*/
			if(member != null){
				HttpSession session=request.getSession();
				session.setAttribute("loginUser", member);
				response.sendRedirect("/bgm/index.jsp");
			}else{
				response.sendRedirect("/bgm/member/view/loginfail.html");
				
			}
		/*}
		else {
			if(member != null){
				HttpSession session=request.getSession();
				session.setAttribute("loginUser", member);
				response.sendRedirect("/bgm/rsv");
			}else{
				response.sendRedirect("/bgm/member/view/loginfail.html");
				
			}
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
