package news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import news.model.service.NewsService;
import news.model.vo.NewsCompany;
import news.model.vo.NewsURL;

/**
 * Servlet implementation class ChangeDetailViewServlet
 */
@WebServlet("/dview")
public class ChangeDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String comName= request.getParameter("companyName");
		
		NewsCompany nc= new NewsService().searchCompany(comName);
		ArrayList<NewsURL> ulist=new NewsService().searchURL(comName);
		
		
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		JSONObject img= new JSONObject();
		img.put("comname", URLEncoder.encode(comName,"UTF-8"));
		img.put("comimg", nc.getImage());
		img.put("mainurl", URLEncoder.encode(nc.getMainURL(), "UTF-8"));
		jarr.add(img);
		
		for(int i=0; i<10;i++){
			
			JSONObject jon = new JSONObject();
			
			jon.put("title", URLEncoder.encode(ulist.get(i).getNewsTitle(), "UTF-8"));
			jon.put("url", URLEncoder.encode(ulist.get(i).getNewsURL(),"UTF-8"));
			jon.put("image", ulist.get(i).getImage());
			
			jarr.add(jon);
		}
		
		
		
		json.put("newsURL", jarr);
		
		
		
		
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
