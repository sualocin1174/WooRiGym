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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		UserService userSvc = new UserService();
		UserTable vo = userSvc.Login(user_id, user_pwd);

		if(vo != null) {		
			System.out.println("로그인 성공");
			request.setAttribute("result", "로그인성공");
			HttpSession sessionId = request.getSession();
			sessionId.setAttribute("loginSS", vo);
			request.getRequestDispatcher("/WEB-INF/loginAction.jsp").forward(request, response);;
		}
		else {
			System.out.println("로그인 실패");
			request.setAttribute("result", "로그인실패");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);;
		}		
	}
}
