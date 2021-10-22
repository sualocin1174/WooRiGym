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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
//		UserTable user = (UserTable)session.getAttribute("loginSS");
		String phone01 = request.getParameter("phone01");
		String phone02 = request.getParameter("phone02");
		String phone03 = request.getParameter("phone03");
		String phone = phone01 + "-" + phone02 + "-" + phone03;
		String email = request.getParameter("email");
		String email_ynStr = request.getParameter("email_ynStr");
		int email_yn = Integer.parseInt(email_ynStr);
		
		
	}

}
