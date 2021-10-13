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

/**
 * Servlet implementation class UserFindIdServlect
 */
@WebServlet("/fineId")
public class UserFindIdServlect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindIdServlect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/findId.jsp").forward(request, response);
		
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		UserService findID = new UserService();
//		String user_name = request.getParameter("user_name");
//		String phone = request.getParameter("phone");
//		String result = findID.findId(user_name, phone);
//		if(result != null) {
//			// ?user_name=user01&phone=010-1111-2222       -->   임시확인
//			out.println("아이디 찾기 성공");
//			System.out.println(user_name + "님의 아이디는" + result + "입니다.");
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
		String user_name = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		UserService userDao = new UserService();
		String result = userDao.findId(user_name, phone);
		
		if(result != null) {
//			request.setAttribute("user_id", result);
			request.getSession().setAttribute("user_id", result);
			request.getRequestDispatcher("").forward(request, response);;
			
		}
		else {
			
		}
		
		
	}

}
