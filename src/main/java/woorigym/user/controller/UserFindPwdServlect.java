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
 * Servlet implementation class UserFindPwdServlect
 */
@WebServlet("/findPwd")
public class UserFindPwdServlect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindPwdServlect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/findPwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String email = request.getParameter("email");
		
		UserService userSvc = new UserService();
		String user_pwd = userSvc.findPwd(user_id, email);
		if(user_pwd != null) {
			System.out.println("비밀번호 찾기 성공");
			request.setAttribute("user_pwd", user_pwd);
			request.getRequestDispatcher("/WEB-INF/findPwd.jsp").forward(request, response);
		}
		else {
			System.out.println("비밀번호 찾기 실패");
			request.setAttribute("user_pwd", "비밀번호 찾기 실패");
			request.getRequestDispatcher("/WEB-INF/findPwd.jsp").forward(request, response);
		}
	}

}
