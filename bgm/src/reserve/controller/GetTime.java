package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import reserve.model.service.ReserveService;
import reserve.model.vo.Temp;
import reserve.model.vo.Time;

/**
 * Servlet implementation class GetTime
 */
@WebServlet("/gett")
public class GetTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTime() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String mname = request.getParameter("mname");
		String cname = request.getParameter("cname");
		String dname = request.getParameter("dname");
		
		ArrayList<Temp> list = new ReserveService().getTempList(mname, cname, dname);
		
		int cnt[] = new int[list.size()];
		
		for(int x = 0; x < list.size(); x++){

			String time = dname + " " + list.get(x).getTime();
			cnt[x] = new ReserveService().getCnt(list.get(x).getScreenRoomName(), time, mname, cname);
			list.get(x).setCnt(cnt[x]);
		}
		
		JSONObject json = new JSONObject();
    	JSONArray jarr = new JSONArray();
    	for(Temp t : list){
    		JSONObject job = new JSONObject();
    		job.put("screen", t.getScreenRoomName());
    		job.put("time", t.getTime());
    		job.put("cnt", t.getCnt());
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
