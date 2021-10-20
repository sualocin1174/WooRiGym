package woorigym.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import woorigym.user.model.service.UserService;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class UserInfoUpdateServlet
 */
@WebServlet("/userinfoupdate")
public class UserInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		HttpSession session = request.getSession(false);
		UserTable user = (UserTable)session.getAttribute("loginSS");
		
		UserService userSvc = new UserService();
		int result = userSvc.userInsert(user);
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String email_ynStr = request.getParameter("Email_ynStr");
		int email_yn = Integer.parseInt(email_ynStr);
		
		if(user != null && user.getUser_id().equals(user_id)) {
			user.setUser_pwd(user_pwd);
			user.setEmail(email);
			user.setPhone(phone);
			user.setUser_name(user_name);
			user.setEmail_yn(email_yn);
			
		}
	}

}
