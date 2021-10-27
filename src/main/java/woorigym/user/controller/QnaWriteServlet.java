package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.admin.model.vo.QnaTable;
import woorigym.user.model.service.QnaWriteService;
import woorigym.user.model.vo.UserTable;

@WebServlet("/qna_write")
public class QnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnaWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인이 안되면 진입불가
				UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");//확인
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
				}
				String ViewPage = "/WEB-INF/qna_write.jsp";
				request.getRequestDispatcher(ViewPage).forward(request, response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//매개변수와 동일한 객체 속성값 불러오는 메소드
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS"); // 10/15 추가
		if(userTableSessionAttr == null) {
			out.append("로그인 상태가 아닙니다!\n로그인 해주세요!");
			 out.flush();
			 out.close();
			 return;
		}
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("user_id: "+uid);
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(category);
		System.out.println(title);
		System.out.println(content);
		
		QnaTable vo = new QnaTable();
		//vo가 빈값이라 set
		vo.setQ_category(category);
		vo.setQ_title(title);
		vo.setQ_content(content);
		new QnaWriteService().QnaWrite(uid, vo);
		
		
		// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
				response.setContentType("application/json;charset=UTF-8");
				Gson order_gob = new GsonBuilder().setPrettyPrinting().create();
				String gobStr ="";
				gobStr = order_gob.toJson("");//리턴할 게 없으니까 ""(insert만 할거니까)
				System.out.println(gobStr);
				out.print(gobStr);
				out.flush(); //현재 버퍼에 출력된 내용들을 클라이언트로 전송
				out.close();
	}

}
