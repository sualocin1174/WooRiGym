package woorigym.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.service.UserService;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class UserJoinServlet
 */
@WebServlet("/join")
public class UserJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/userJoin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_pwdtest = request.getParameter("user_pwdtest");
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		String email_yn = request.getParameter("email_yn");
		int emailYN = Integer.parseInt(email_yn);
		String phone = request.getParameter("phone");
		int mileage = 0;
		String birthday = request.getParameter("birthday");
		String identity_number = request.getParameter("identity_number");
		String gender = request.getParameter("gender");
		int Intgender = Integer.parseInt(gender);
		
		//TODO
		//user_id = request.getParameter("user_id");
//		user_id = "user01";
//		user_pwd = "1234";
//		user_name = "사용자1";
//		email = "user01@a.com";
//		email_yn = 0;
//		phone = "010-1111-2222";
//		birthday = "2001/05/31";
//		identity_number = "2222222";
//		gender = 0;
//		---------------------------------------
//		user_id = "user02";
//		user_pwd = "1234";
//		user_name = "사용자2";
//		email = "user01@a.com";
//		email_yn = 0;
//		phone = "010-1111-2222";
//		birthday = "2001/05/31";
//		identity_number = "2222222";
//		gender = 0;
		//이벤트 진행에 따라 회원가입시 초기 mileage 다르게 세팅함.
//		mileage = 0;
		
		UserTable user = new UserTable();
		if(user_pwd == user_pwdtest) {
		user.setUser_id(user_id);
		user.setUser_pwd(user_pwd);
		user.setUser_name(user_name);
		user.setEmail(email);
		user.setEmail_yn(emailYN);
		user.setPhone(phone);
		user.setMileage(mileage);
		user.setBirthday(birthday);
		user.setIdentity_number(identity_number);
		user.setGender(Intgender);
		}
		else {
			
		}
		int result = new UserService().userInsert(user);
		if(result == 1) {
			response.sendRedirect("login");
		} else {
			response.sendRedirect("join");
		}
		
	}

}
