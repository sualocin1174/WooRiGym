package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
//		UserService userservice = new UserService();
		PrintWriter out = response.getWriter();
		String user_id = request.getParameter("id");
		String user_pwd = request.getParameter("pw");
		
		// login?id=gym11&pw=qw1234       -->   로그인 확인방법 (임시)
		int result = new UserService().Login(user_id, user_pwd);
		if(result == 1) {
			request.getSession().setAttribute("LoginInfo", user_id);
			System.out.println(user_id + "로그인 성공");
//			out.append("<p>aaa<p/>");
//			response.sendRedirect("/web-inf/join.jsp");
//			request.getRequestDispatcher("test.jsp").forward(request,response);
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
		}
		else if(result == 0) {
			out.print("비밀번호 불일치");
		}
		else {
			out.print("아이디가 없습니다");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
