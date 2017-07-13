package news.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import news.model.service.NewsService;

/**
 * Servlet implementation class MgrAddNewsServlet
 */
@WebServlet("/addnews")
public class MgrAddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MgrAddNewsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		// 전송파일에 대한 용량 제한을 설정하고 싶으면 정함 : 10메가바이트로 할경우
		int limitSize = 1024 * 1024 * 100;

		// 전송방식에 multipart 설정을 했는지 검사함
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (!isMultipart) {
			RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "multipart 설정을 하지 않았습니다.");
			view.forward(request, response);
		}

		String savePath = request.getSession().getServletContext().getRealPath("/news/images/temp/");

		String originalFileName = null;
		// 실제 저장기록될 변경된 파일명 저장용 변수
		String newFileName = null;

		MultipartRequest mrequest = new MultipartRequest(request, savePath, limitSize, "utf-8",
				new DefaultFileRenamePolicy());

		String comName = mrequest.getParameter("comName");
		String url = mrequest.getParameter("url");
		String title = mrequest.getParameter("title");
		String date = mrequest.getParameter("date");
		String folder = mrequest.getParameter("folder");
		// 업로드 파일 기록하고 파일명 읽기
		originalFileName = mrequest.getFilesystemName("upfile");

		if (originalFileName != null) {

			File saveFile = new File(savePath + "\\" + originalFileName);

			newFileName = saveFile.getName();
			String newFilePath = request.getSession().getServletContext().getRealPath("/news/images/") + "/" + folder;

			File newFile = new File(newFilePath + "\\" + newFileName);
			File path = new File(newFilePath);
			
			if (!path.exists()) {
				path.mkdir();
			}

			if (!saveFile.renameTo(newFile)) {
				// 파일의 데이터 읽어서 저장할 변수
				int readData = 0;
				// 한번에 읽을 크기와 값 담을 배열 지정
				byte[] buf = new byte[1024];

				// 파일입력용 스트림과 파일기록용 스트림 생성
				FileInputStream fin = new FileInputStream(saveFile);
				FileOutputStream fout = new FileOutputStream(newFile);

				while ((readData = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf);
				}

				fin.close();
				fout.close();

			}
			saveFile.delete();

		}

		int result = new NewsService().insertNews(comName, url, title, date, (folder + "/" + newFileName));

		if (result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("news/view/addSuccess.jsp");
			request.setAttribute("result", 2);
			view.forward(request, response);

			
		} else {
			RequestDispatcher view = request.getRequestDispatcher("news/view/newsError.jsp");
			request.setAttribute("message", "뉴스를 추가하지 못했습니다.");
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
