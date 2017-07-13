package pay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class PaySeachServlet
 */
@WebServlet("/pseach")
public class PaySeachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySeachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이 검색 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String seach = request.getParameter("seachItem");
		String keyword = request.getParameter("keyword");
		String keyword1 = request.getParameter("keyword1");
		int seachgroup = 0;//검색 분료
		if(seach.equals("userId")){
			seachgroup = 1;
		}else if(seach.equals("userNAme")){
			seachgroup = 2;
		}else{
			seachgroup = 3;
		}
		
		MemberService mservice = new MemberService();
		int listCount = 0;
		int currentPage = 1;
		int limit = 20;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		ArrayList<Member> list = null;
		if(keyword == null && keyword1 == null){
			list = new MemberService().selectAll();
			listCount = mservice.getListCount();
		}else{
			if(keyword !=null){
				list = mservice.selecList(currentPage, limit, keyword,seachgroup);
				listCount = mservice.getListCount(keyword,seachgroup);
			}else{
				keyword = keyword1;
				list = mservice.selecList(currentPage, limit, keyword,seachgroup);
				listCount = mservice.getListCount(keyword,seachgroup);
			}
		}
		
		int maxPage = (int)((double)listCount / limit +0.9);
		int startPage = (int)(((double)currentPage / limit +0.9)-1)* limit +1;
		int endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		RequestDispatcher view = null;
		if(list.size()>0){
			view = request.getRequestDispatcher("pay/view/payManagerMentPage.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPAge", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("keyword", keyword);
			request.setAttribute("seach", seach);
			view.forward(request, response);
		}else{
			/*view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);	*/
			view = request.getRequestDispatcher("pay/view/payManagerMentPage.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPAge", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("keyword", keyword);
			request.setAttribute("seach", seach);
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
