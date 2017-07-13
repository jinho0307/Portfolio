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
 * Servlet implementation class NewMember
 */
@WebServlet("/nmember")
public class NewMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 새맴버 등록
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String ubtemp = request.getParameter("userBirth").substring(0, 4)+"-"+request.getParameter("userBirth").substring(4, 6)+"-"+request.getParameter("userBirth").substring(6, 8);
		String id = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail1")+"@" +request.getParameter("userEmail2");
		Date userBirth = Date.valueOf(ubtemp);
		String userPhone = request.getParameter("guk") + "-"+ request.getParameter("userPhone1")+"-"+request.getParameter("userPhone2");
		char userGender = request.getParameter("userGender").charAt(0);
		String reception = request.getParameter("reception");
		String zipCode1 = request.getParameter("zipcode1");
		String zipCode2 = request.getParameter("zipcode2");
		String userAddress1 = request.getParameter("zipcode2");
		String userAddress2 = request.getParameter("detailAddress2");
		
		if(reception == null){
			reception = "off";
		}
		
		Member member = new Member();
		member.setUserId(id);
		member.setPassword(userPwd);
		member.setUserName(userName);
		member.setEmail(userEmail);
		member.setBirth(userBirth);
		member.setPhone(userPhone);
		member.setGender(userGender);
		member.setZipcode1(zipCode1);
		member.setZipcode2(zipCode2);
		member.setReception(reception);	
		member.setAddress1(userAddress1);
		member.setAddress2(userAddress2);
		
		int result = new MemberService().insertMember(member);
		RequestDispatcher view = null;
		if(result > 0){
			view = request.getRequestDispatcher("member/view/success.jsp");
			request.setAttribute("massage", "가입을 환영합니다.");
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("massage", "회원가입 실패 하셧습니다. 다시시도해주세요");
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
