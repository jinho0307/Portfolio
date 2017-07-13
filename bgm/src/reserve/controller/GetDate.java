package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.simple.*;
import reserve.model.service.ReserveService;
import reserve.model.vo.*;

/**
 * Servlet implementation class getDate
 */
@WebServlet("/getd")
public class GetDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
    	String mname = request.getParameter("mname");
    	String cname = request.getParameter("cname");
    	
    	ArrayList<Time> list = new ReserveService().getTimeList(mname, cname);
    	
    	JSONObject json = new JSONObject();
    	JSONArray jarr = new JSONArray();
    	for(Time t : list){
    		JSONObject job = new JSONObject();
    		job.put("timeIndex", t.getTimeIndex());
    		job.put("showTime", t.getShowTime());
    		jarr.add(job);
    	}
    	json.put("list", jarr);
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
