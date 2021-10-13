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
@WebServlet("/join.do")
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id;
		String user_pwd;
		String user_name;
		String email;
		int email_yn;
		String phone;
		int mileage;
		String birthday;
		String identity_number;
		int gender;
		
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
		user_id = "user02";
		user_pwd = "1234";
		user_name = "사용자2";
		email = "user01@a.com";
		email_yn = 0;
		phone = "010-1111-2222";
		birthday = "2001/05/31";
		identity_number = "2222222";
		gender = 0;
		//이벤트 진행에 따라 회원가입시 초기 mileage 다르게 세팅함.
		mileage = 0;
		
		UserTable user = new UserTable();
		
		user.setUser_id(user_id);
		user.setUser_pwd(user_pwd);
		user.setUser_name(user_name);
		user.setEmail(email);
		user.setEmail_yn(email_yn);
		user.setPhone(phone);
		user.setMileage(mileage);
		user.setBirthday(birthday);
		user.setIdentity_number(identity_number);
		user.setGender(gender);
		
		int result = new UserService().userInsert(user);
		if(result == 1) {
			response.sendRedirect("login");
		} else {
			response.sendRedirect("join");
		}
		
	}

}
