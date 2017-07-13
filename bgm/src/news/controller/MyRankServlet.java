package news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import news.model.service.NewsService;
import news.model.vo.NewsURL;

/**
 * Servlet implementation class MyRankServlet
 */
@WebServlet("/myrank")
public class MyRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRankServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String comName=request.getParameter("companyName");
		
		NewsURL[] myRank=null;
		
		myRank = new NewsService().getRank(comName);
		
	
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(int i=0; i<myRank.length;i++){
			
			JSONObject jon = new JSONObject();
			jon.put("title", URLEncoder.encode(myRank[i].getNewsTitle(), "UTF-8"));
			jon.put("url", URLEncoder.encode(myRank[i].getNewsURL(),"UTF-8"));
			
			jarr.add(jon);
		}
		
		
		
		json.put("myRank", jarr);
		
		
		
		
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
