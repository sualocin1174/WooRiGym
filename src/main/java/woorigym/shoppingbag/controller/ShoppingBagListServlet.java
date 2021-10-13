package woorigym.shoppingbag.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class ShoppingBagListServlet
 */
@WebServlet("/sblist.ajax")
public class ShoppingBagListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingBagListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//doPost로 바꾸기
		
		PrintWriter out = response.getWriter();
		
		//받아온 정보
		//1. 로그인된 유저 아이디
//		String userid = "gym11"; //일단 임의로 정함
		UserTable user = (UserTable)request.getSession().getAttribute("loginSS");
		
		try {
			String userid = user.getUser_id();
			System.out.println(user.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
