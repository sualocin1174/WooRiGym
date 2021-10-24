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
@WebServlet("/userModify")
public class UserModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		
		if(loginSS == null) {
			System.out.println("로그인 확인");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
		} else {
			request.getRequestDispatcher("/WEB-INF/userModify.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		UserTable user = (UserTable)session.getAttribute("loginSS");
		String user_id = request.getParameter("user_id");
		String phone01 = request.getParameter("phone01");
		String phone02 = request.getParameter("phone02");
		String phone03 = request.getParameter("phone03");
		String phone = phone01 + "-" + phone02 + "-" + phone03;
		String email = request.getParameter("email");
		String email_ynStr = request.getParameter("email_ynStr");
		int email_yn = Integer.parseInt(email_ynStr);
		String user_pwd = request.getParameter("user_pwd");
		String new_user_pwd01 = request.getParameter("new_user_pwd01");
		String new_user_pwd02 = request.getParameter("new_user_pwd02");
			
		System.out.println(user_id);
		System.out.println(phone01);
		System.out.println(phone02);
		System.out.println(phone03);
		System.out.println(email);
		System.out.println(email_yn);
		System.out.println(user_pwd);
		System.out.println(new_user_pwd01);
		System.out.println(new_user_pwd02);
		System.out.println(user);
		
		if(user != null && user.getUser_id().equals(user_id)) {
			user.setPhone(phone);
			user.setEmail(email);
			user.setEmail_yn(email_yn);
			user.setUser_pwd(new_user_pwd02);
			int result = new UserService().updateUser(user);
			System.out.println("여기는 업데이트 끝나고 ->"+result);
			if(result>0) {
				session.setAttribute("loginSS", user);
				response.sendRedirect("main");
			}
		} else {
			response.sendRedirect("userModify");
		}
		
		
	}

}
