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
		
		
		//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		UserService user = new UserService();
//		PrintWriter out = response.getWriter();
//		String user_id = request.getParameter("user_id");
//		String user_pwd = request.getParameter("user_pwd");
//		int result = user.Login(user_id, user_pwd);
//		if(result == 1) {
//			response.sendRedirect("/WEB-INF/login.jsp");
//		}
//		else {
//			
//		}
		
		// login?id=gym11&pw=qw1234       -->   로그인 확인방법 (임시)
//		int result = new UserService().Login(user_id, user_pwd);
//		if(result == 1) {
//			request.getSession().setAttribute("LoginInfo", user_id);
//			System.out.println(user_id + "로그인 성공");
//			out.append("<p>aaa<p/>");
//			response.sendRedirect("/web-inf/join.jsp");
//			request.getRequestDispatcher("test.jsp").forward(request,response);
//			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
//		}
//		else if(result == 0) {
//			out.print("비밀번호 불일치");
//		}
//		else {
//			out.print("아이디가 없습니다");
//		}
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
//		UserTable user = new UserTable();
//		ArrayList<UserTable> volist = new UserService().userInfo(user_id);
		
//		if(user_id == )
//		for(UserTable vo : volist){
//			vo.getUser_id();
//			vo.getUser_name();
//			vo.getEmail();
//		
//		}
		if(vo != null) {		
//			userDao.userInfo(user_id);
			System.out.println("로그인 성공");
			request.setAttribute("result", "로그인성공");
			HttpSession sessionId = request.getSession();
			sessionId.setAttribute("loginSS", vo);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/loginAction.jsp");
			rd.forward(request, response);
		}
		else {
			System.out.println("로그인 실패");
			request.setAttribute("result", "로그인실패");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/login.jsp");
			rd.forward(request, response);
		}		
	}
}
