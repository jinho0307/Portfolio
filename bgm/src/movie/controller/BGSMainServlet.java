package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import movie.model.service.MovieService;
import movie.model.vo.MovieFileLink;

/**
 * Servlet implementation class BGSMainServlet
 */
@WebServlet("/bgscom")
public class BGSMainServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BGSMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html; charset=utf-8");
      
      ArrayList<MovieFileLink> movieMap = new MovieService().selectMoviePosterAll();
      JSONObject json = new JSONObject();
      JSONArray jarr = new JSONArray();
      
      for(int i=0; i<movieMap.size(); i++){
         JSONObject jso = new JSONObject();
         jso.put("url", movieMap.get(i).getMoviePoster());
         jso.put("mid", movieMap.get(i).getMovieId());
         
         jarr.add(jso);
      }
      json.put("main", jarr);
      
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
      doGet(request, response);
   }

}