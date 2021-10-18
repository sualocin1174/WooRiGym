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
@WebServlet("/findId")
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_name = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		
		UserService userSvc = new UserService();
		String user_id = userSvc.findId(user_name, phone);
		
		if(user_id != null) {
			System.out.println("아이디 찾기 성공");
			request.setAttribute("user_id", user_id);
			request.getRequestDispatcher("/WEB-INF/findId.jsp").forward(request, response);
			}
		else {
			System.out.println("아이디 찾기 실패");
			request.setAttribute("user_id", "아이디 찾기 실패");
			request.getRequestDispatcher("/WEB-INF/findId.jsp").forward(request, response);
		}

	}

}
