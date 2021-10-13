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
 * Servlet implementation class DupIdChkServlet
 */
@WebServlet("/DupIdChkServlet")
public class DupIdChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DupIdChkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService UserSVC = new UserService();
		int result = UserSVC.dupidChk(request.getParameter("user_id"));
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.append("fail"); // 만약 dupIdChk()의 결과값이 0 이상이면 ‘fail’
		} else {
			out.append("ok"); // 결과값이 0 보다 크지 않으면, ‘ok’를 담아서 보낸다.
		}
		out.flush();
		out.close();
	}

}
