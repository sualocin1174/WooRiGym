package common.template;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.vo.UserTable;


@WebServlet("/LoginTemplate")
public class LoginTemplate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginTemplate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.append("<title>로그인 템플릿</title>"); // 10/11 추가
		UserTable u = new UserTable();
		u.setUser_id("gym11");
		u.setEmail("gym11@gmail.com");
		u.setUser_name("김민수");
		request.getSession().setAttribute("loginSS", u); // 10/13 수정
		out.println("로그인 성공"); // 10/08 추가
		System.out.println("로그인 성공"); // 10/11 추가
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
