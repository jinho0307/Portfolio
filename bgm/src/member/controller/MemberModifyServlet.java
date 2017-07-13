package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberModifyServlet
 */
@WebServlet("/mmodify")
public class MemberModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail1")+"@" +request.getParameter("userEmail2");
		Date userBirth = Date.valueOf(request.getParameter("userBirth"));
		Date userEnroll = Date.valueOf(request.getParameter("enroll"));
		String userPhone = request.getParameter("guk") + "-"+ request.getParameter("userPhone1")+"-"+request.getParameter("userPhone2");
		char userGender = request.getParameter("userGender").charAt(0);
		String reception = request.getParameter("reception");
		String zipCode1 = request.getParameter("zipcode1");
		String zipCode2 = request.getParameter("zipcode2");
		String userAddress1 = request.getParameter("zipcode2");
		String userAddress2 = request.getParameter("detailAddress2");
		int manager = Integer.parseInt(request.getParameter("manager"));
		
		Member member = new Member();
		member.setUserId(id);
		member.setPassword(userPwd);
		member.setUserName(userName);
		member.setEmail(userEmail);
		member.setBirth(userBirth);
		member.setEnroll_date(userEnroll);
		member.setPhone(userPhone);
		member.setGender(userGender);
		member.setZipcode1(zipCode1);
		member.setZipcode2(zipCode2);
		member.setReception(reception);	
		member.setAddress1(userAddress1);
		member.setAddress2(userAddress2);
		member.setManager(manager);
		
		int result = new MemberService().updateMember(member);
		RequestDispatcher view = null;
		
		if(result > 0){
			view = request.getRequestDispatcher("member/view/success.jsp");
			request.setAttribute("massage", "수정에 성공하엿습니다.");
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/success.jsp");
			request.setAttribute("massage", "정보수정 실패");
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
