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
 * Servlet implementation class SelectOneServlet
 */
@WebServlet("/sone")
public class SelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원하나 선택해서 내보내기
		String id = request.getParameter("userid");
		int where = 0;
		if(request.getParameter("where") != null){
			where = Integer.parseInt(request.getParameter("where"));
		}
		response.setContentType("text/html; charset=utf-8");
		
		Member member = new MemberService().selectOne(id);
		RequestDispatcher view =null;
		if(member != null){
			view = request.getRequestDispatcher("member/view/memberModify.jsp");
			request.setAttribute("member", member);
			request.setAttribute("where", where);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "회원정보 조회 실패");
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
