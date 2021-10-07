package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.vo.UserTable;
import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderUserInfoServlet
 */
@WebServlet("/orderuserinfo")
public class OrderUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유저 정보 - 이름 , 연락처, 마일리지  불러오기
		response.setContentType("application/json;charset=UTF-8");
		String userid = request.getParameter("user_id");

		PrintWriter out = response.getWriter();

		ArrayList<UserTable> voUser = new OrderService().getUserInfo(userid);
		System.out.println(voUser);
		Gson user_gob = new GsonBuilder().setPrettyPrinting().create();
		String user_gobstr = "";
		if (voUser != null) {
			System.out.println("유저 정보 불러오기 성공");
			user_gobstr = user_gob.toJson(voUser);
			out.println(user_gobstr);
			System.out.println(user_gobstr);
		} else {
			System.out.println("유저 정보 불러오기 실패");
		}
		
	}

}
