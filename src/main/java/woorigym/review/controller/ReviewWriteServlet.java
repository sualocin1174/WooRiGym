package woorigym.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import woorigym.user.model.vo.UserTable;


@WebServlet("/rwrite")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		//로그인 안하면 진입 불가
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");//확인
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
			}	String uid = loginSS.getUser_id();
			System.out.println("uid: "+uid);
			String viewPage = "/WEB-INF/review_write.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		//로그인 안하면 진입 불가
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");//확인
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
			}	String uid = loginSS.getUser_id();
			System.out.println("uid: "+uid);
			
			String r_content = request.getParameter("r_content");
			String score = request.getParameter("score");
			System.out.println(r_content);
			System.out.println(score);
			 String fileSavePath = "images"; 
			 int uploadSizeLimit = 10 * 1024 * 1024;
			 String encType = "UTF-8"; 
			 if(!ServletFileUpload.isMultipartContent(request)) 
			      response.sendRedirect("view/error/Error.jsp");
			 ServletContext context = getServletContext(); 
			String uploadPath = context.getRealPath(fileSavePath);
			
			System.out.println(uploadPath); 
			MultipartRequest file = new MultipartRequest(request,
					uploadPath, // 서버 상 업로드 될 디렉토리 
			        uploadSizeLimit, // 업로드 파일 크기 제한
			        encType, // 인코딩 방법 
			        new DefaultFileRenamePolicy() // 동일 이름 존재 시 새로운 이름 부여 방식
			        );
			// 업로드 된 파일 이름 얻어오기 
		    String img = file.getFilesystemName("uploadFile");
		    if (img == null) { 
		      // 업로드 실패 시 
		      System.out.println("업로드 실패");
		      } else { 
		      // 업로드 성공 시 
		      out.println("<br> 글쓴이 : " + file.getParameter("name")); 
		      out.println("<br> 제목 : " + file.getParameter("title")); 
		      out.println("<br> 첨부파일명 : " + img); 
		      out.println("<br> 업로드 성공!!!");     } 
	}

}
