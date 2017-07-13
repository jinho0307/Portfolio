package pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pay.model.service.PayService;

/**
 * Servlet implementation class SetTlementServelt
 */
@WebServlet("/sslement")
public class SetTlementServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetTlementServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 결산금액 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PayService payservice = new PayService();
		// 매입 금액
		int movieseetl = payservice.getMovieMoney();
		int newsseetl = payservice.getNewsMoney();
		// 총매출
		int totalssetl = payservice.getTotalMoney();
		// 순매출
		int  netprofit = -payservice.getNetrofit();
		RequestDispatcher view = null;
		
		view = request.getRequestDispatcher("manager/view/ManagerPage.jsp");
		request.setAttribute("movie", movieseetl);
		request.setAttribute("news", newsseetl);
		request.setAttribute("charge", totalssetl);
		request.setAttribute("use", netprofit);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
