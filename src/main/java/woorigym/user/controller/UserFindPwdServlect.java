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
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		UserService findPwd = new UserService();
//		String user_id = request.getParameter("user_id");
//		String email = request.getParameter("email");
//		String result = findPwd.findPwd(user_id, email);
//		if(result != null) {
//			// ?user_id=user01&email=user01@a.com      -->   임시 확인
//			out.println("비밀번호 찾기 성공");
//			System.out.println(user_id + "님의 비밀번호는" + result + "입니다");
//		}
//		else {
//			System.out.println("정보가 올바르지 않습니다.");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	}

}
