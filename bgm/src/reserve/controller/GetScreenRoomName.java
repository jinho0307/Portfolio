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
import reserve.model.vo.Relation;
import reserve.model.vo.RelationName;
import reserve.model.vo.Temp;

/**
 * Servlet implementation class GetScreenRoomName
 */
@WebServlet("/getscreen")
public class GetScreenRoomName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetScreenRoomName() {
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
		
		String year = dname.split("-")[0].substring(2);
		String month = dname.split("-")[1];
		String day = dname.split("-")[2];
		
		String date = year+"/"+month+"/"+day;
		ArrayList<Temp> tmp = new ReserveService().getTempList(mname, cname, dname);
		
		ArrayList<Temp> list = new ArrayList<Temp>();
		ArrayList<Temp> reslist = new ArrayList<Temp>();
		
		ArrayList<RelationName> rnlist = new ReserveService().getRelationName(cname, mname, date);		
		
		
		String lotte[] = {"L1관", "L2관", "L3관"};
		String cgv[] = {"C1관", "C2관", "C3관"};
		String maga[] = {"M1관", "M2관", "M3관"};
		String time[] = {"12:00", "16:00", "20:00"};
		
		if(cname.equals("롯데시네마")){
			for(int x=0;x<3;x++){
				for(int y=0;y<3;y++){
					Temp t = new Temp(lotte[x], time[y], 0);
					list.add(t);
				}
			}
		}
		else if(cname.equals("CGV")){
			for(int x=0;x<3;x++){
				for(int y=0;y<3;y++){
					Temp t = new Temp(cgv[x], time[y], 0);
					list.add(t);
				}
			}
		}
		else{
			for(int x=0;x<3;x++){
				for(int y=0;y<3;y++){
					Temp t = new Temp(maga[x], time[y], 0);
					list.add(t);
				}
			}
		}
		
		if(rnlist.size() > 0){
			for(int x=0;x<list.size();x++){
				for(int y=0;y<tmp.size();y++){
					if(list.get(x).getScreenRoomName().equals(tmp.get(y).getScreenRoomName()) && list.get(x).getTime().equals(tmp.get(y).getTime())){
						list.remove(x);
					
					}
				}
				
			}
			boolean flag = false;
			int i = 0;
			int j = 0;
			int k = list.size();
			
			while(true){
				if(i >= list.size()){
					break;
				}
				while(true){
					if(list.size() == 0){
						break;
					}
					if(j >= rnlist.size()){
						break;
					}
					if(list.get(i).getScreenRoomName().equals(rnlist.get(j).getScreenRoomName()) && list.get(i).getTime().equals(rnlist.get(j).getShowTime().split(" ")[1])){
						list.remove(i);
						i = list.size() - list.size() + i - 1;
						if(i < 0){
							i = 0;
						}
					}
					j++;
				}
				j = 0;
				i++;
			}
			
		}
		
		else if(rnlist.size() == 0){
			for(int x=0;x<list.size();x++){
				for(int y=0;y<tmp.size();y++){
					if(list.get(x).getScreenRoomName().equals(tmp.get(y).getScreenRoomName()) && list.get(x).getTime().equals(tmp.get(y).getTime())){
						list.remove(x);
					}
				}
			}
		}
		
		
		if(list.size() > 0){
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
		else {
			JSONObject json = new JSONObject();
			JSONArray jarr = new JSONArray();
			JSONObject job = new JSONObject();
			job.put("screen", "빈 상영관이 없습니다.");
			job.put("time", "다른 날짜를 선택하싶시오.");
			jarr.add(job);
			json.put("list", jarr);
			response.setContentType("application/json"); 
	    	PrintWriter out = response.getWriter();
	    	out.print(json.toJSONString());
	    	out.flush();
	    	out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
