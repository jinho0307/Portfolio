package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import reserve.model.vo.Search;
import reserve.model.service.ReserveService;
import reserve.model.vo.*;

/**
 * Servlet implementation class GetReserveListServelt
 */
@WebServlet("/getrsvlist")
public class GetReserveListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReserveListServelt() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int currentPage = 1;
		int limit = 10;
		Search search = new Search();
		if(request.getParameter("page") != null) 
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int listCount = new ReserveService().getListCount();
		
		//ArrayList<Reserve> rlist = new ReserveService().getReserveList(currentPage, limit);
		ArrayList<Reserve> rlist = new ReserveService().getReserveList();
		
		
		ArrayList<ReserveName> list = new ArrayList<ReserveName>();
		
		for(int x=0;x<rlist.size();x++){
			//ReserveName r = new ReserveService().getReserveName(rlist.get(x));
			ReserveName r = new ReserveService().getReserveName(rlist.get(x));
			list.add(r);
		}
		
		// 총 페이지 수 계산 : 목록이 최소 1개일 때, 1page 로 처리
		// 0.9 를 더함.
		int lastPage = (int)((double)listCount / limit + 0.9);
		// 현재 페이지에 보여질 시작 페이지 값 (1, 11, 21, 31, ...)
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		// 현재 페이지에 보여질 마지막 페이지 값 (10, 20, 30, 40,...)
		int endPage = startPage + limit -1;
		
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		// 읽기 시작할 행 번호
		int startRow = (currentPage - 1) * limit + 1;
		// 읽을 마지막 행 번호
		int endRow = startRow + limit - 1;
		
		ArrayList<ReserveName> reslist = new ArrayList<ReserveName>(); 
		for(int x=startRow-1;x<endRow;x++){
			if(x >= listCount){
				break;
			}
			reslist.add(list.get(x));
		}
		
		
		if(list.size() > 0){
			RequestDispatcher rd = request.getRequestDispatcher("reserve/view/totalReserve.jsp");
			request.setAttribute("list", reslist);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("reserve/view/totalReserve.jsp");
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("search", search);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
