package news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import member.model.vo.Member;
import news.model.service.NewsService;
import news.model.vo.NewsCompany;
import news.model.vo.NewsURL;


/**
 * Servlet implementation class ChangeDetailViewServlet
 */
@WebServlet("/myview")
public class MyNewsViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyNewsViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		Member loginUser = (Member) session.getAttribute("loginUser");
		if(loginUser==null){
			RequestDispatcher view = request.getRequestDispatcher("member/view/login.jsp");
			request.setAttribute("backUrl", "/bgm/myview");
			
		}else{
		
		String comName= request.getParameter("companyName");
		
		NewsCompany nc= new NewsService().searchCompany(comName);
		
		
		ArrayList<NewsURL> myulist = new NewsService().subNewsURL(loginUser.getUserId(), comName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		String endDate=sdf.format(new NewsService().getEndDate(loginUser.getUserId(), comName));
		
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		
		JSONObject jend= new JSONObject();
		jend.put("endDate", URLEncoder.encode(endDate,"UTF-8"));
		
		jarr.add(jend);
		
		JSONObject company= new JSONObject();
		company.put("comname", URLEncoder.encode(comName,"UTF-8"));
		company.put("comimg", nc.getImage());
		company.put("mainurl", URLEncoder.encode(nc.getMainURL(), "UTF-8"));
		jarr.add(company);
		
		
		
		for(int i=0; i<myulist.size();i++){
			
			JSONObject jon = new JSONObject();
			
			jon.put("title", URLEncoder.encode(myulist.get(i).getNewsTitle(), "UTF-8"));
			jon.put("url", URLEncoder.encode(myulist.get(i).getNewsURL(),"UTF-8"));
			jon.put("image", myulist.get(i).getImage());
			
			jarr.add(jon);
		}
		
		
		
		json.put("myNews", jarr);
		
		
		
		
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
