package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import woorigym.user.model.service.UserService;
import woorigym.user.model.vo.UserTable;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String admin_id = user_id;
		String admin_pwd = user_pwd;
		UserService userSvc = new UserService();
		UserTable vo = userSvc.Login(user_id, user_pwd);
		int result = userSvc.adminLogin(admin_id, admin_pwd);
		System.out.println("관리자 로그인 성공하면 뜨는 result값 -->" + result);
		if(result == 1) {
			System.out.println("관리자 로그인 성공");
			request.setAttribute("result", "관리자 로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("admin_id", admin_id);
			request.getRequestDispatcher("/WEB-INF/adminAction.jsp").forward(request, response);
			
		 
		} else if(vo != null) {		
			System.out.println("로그인 성공");
			request.setAttribute("result", "로그인성공");
			HttpSession session = request.getSession();
			session.setAttribute("loginSS", vo);
			request.getRequestDispatcher("/WEB-INF/loginAction.jsp").forward(request, response);
		}
		else if(vo == null || result != 0){
			System.out.println("-->"+"로그인 실패");
			request.setAttribute("result", "로그인실패");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}		
	}
}
