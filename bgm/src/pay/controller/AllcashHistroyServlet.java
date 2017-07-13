package pay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pay.model.service.PayService;
import pay.model.vo.Cash;

/**
 * Servlet implementation class AllcashHistroyServlet
 */
@WebServlet("/acashhistory")
public class AllcashHistroyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllcashHistroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체 캐쉬 히드토리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String selectitem = request.getParameter("seachItem");
		PayService pservice = new PayService();
		
		int listCount = 0;
		int currentPage = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		ArrayList<Cash> list = null;
		
		list = pservice.selectAll(currentPage, limit, selectitem);
		listCount = pservice.getlistCountAll(selectitem);
		
		int maxPage = (int)((double)listCount / limit +0.9);
		int startPage = (int)(((double)currentPage / limit +0.9)-1)* limit +1;
		int endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		RequestDispatcher view = null;
		if(list.size()>0){
			view = request.getRequestDispatcher("pay/view/allcashhistory.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPAge", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("selectitem", selectitem);
			/*request.setAttribute("keyword", keyword);*/
			/*request.setAttribute("seach", seach);*/
			view.forward(request, response);
		}else{
			/*view = request.getRequestDispatcher("member/view/memberError.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);	*/
			view = request.getRequestDispatcher("pay/view/allcashhistory.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPAge", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("selectitem", selectitem);
			/*request.setAttribute("keyword", keyword);*/
			/*request.setAttribute("seach", seach);*/
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
