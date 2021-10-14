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
		UserService insertSvc = new UserService();
		int result = 0;
		String user_id = request.getParameter("user_id");
		System.out.println("여기 user_id: "+ user_id);
		String user_pwd = request.getParameter("user_pwd");
		String user_pwdtest = request.getParameter("user_pwdtest");
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
//		String email_yn = request.getParameter("email_yn");
//		int emailYN = Integer.parseInt(email_yn);
		String phone = request.getParameter("phone");
		int mileage = 0;
		String birthday = request.getParameter("birthday");
		String identity_number = request.getParameter("identity_number");
//		String gender = request.getParameter("gender");
//		int Intgender = Integer.parseInt(gender);
		
		int email_yn = 0;
		int gender = 0;
		
		//TODO
		//user_id = request.getParameter("user_id");
//		String user_id = "user01";
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
		
		UserTable vo =  new UserTable();
		if(user_pwd.equals(user_pwdtest)) {
			System.out.println("여기 1: " + user_id);
			vo.setUser_id(user_id);
			vo.setUser_pwd(user_pwd);
			vo.setUser_name(user_name);
			vo.setEmail(email);
			vo.setEmail_yn(email_yn);
			vo.setPhone(phone);
			vo.setMileage(mileage);
			vo.setBirthday(birthday);
			vo.setIdentity_number(identity_number);
			vo.setGender(gender);
			
		}
		else {
			System.out.println("비밀번호가 같지 않습니다");
		}
		result = insertSvc.userInsert(vo);
		System.out.println("여기 2: " + vo.getUser_id());
		
		if(result > 0) {
			response.sendRedirect("login");
		} else {
			response.sendRedirect("join");
		}
		
	}

}
