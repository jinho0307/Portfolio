package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.simple.*;
import reserve.model.service.ReserveService;
import reserve.model.vo.*;

/**
 * Servlet implementation class GetCinema
 */
@WebServlet("/getc")
public class GetCinema extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCinema() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset=utf-8");
	    	String str = request.getParameter("mname");
	      
	    	ArrayList<Cinema> list = new ReserveService().getCinemaList(str);
	    	
	    	JSONObject json = new JSONObject();
	    	JSONArray jarr = new JSONArray();
	    	for(Cinema c : list){
	    		JSONObject job = new JSONObject();
	    		job.put("cinemaId", c.getCinemaId());
	    		job.put("cinemaName", c.getCinemaName());
	    		job.put("cinemaGps", c.getCinemaGps());
	    		jarr.add(job);
	    	}
	    	json.put("clist", jarr);
	    	response.setContentType("application/json"); 
	    	PrintWriter out = response.getWriter();
	    	out.print(json.toJSONString());
	    	out.flush();
	    	out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
