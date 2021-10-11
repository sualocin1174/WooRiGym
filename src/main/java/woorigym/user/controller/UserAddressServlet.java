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

import woorigym.user.model.service.OrderService;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class UserAddressServlet
 */
@WebServlet("/useraddress")
public class UserAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAddressServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		// 받아온 정보
		// 1. 로그인된 유저 아이디
//		String userid = "gym11"; //일단 임의로 정함
		UserTable user = (UserTable) request.getSession().getAttribute("LoginInfo");

		try {
			String userid = user.getUser_id();
			System.out.println(user.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("/WEB-INF/useraddress.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 배송지 정보 - 고정 주소랑 아닌 것 다 가져오기 --> 객체 배열로 넘길 것임
		response.setContentType("application/json;charset=UTF-8");
		String userid = request.getParameter("user_id");

		PrintWriter out = response.getWriter();

		ArrayList<AddressTable> volistAddress = new OrderService().getAddress(userid);
		//System.out.println(volistAddress);
		Gson address_gob = new GsonBuilder().setPrettyPrinting().create();
		String address_gobstr = "";
		if (volistAddress != null) {
			System.out.println("주소 정보 불러오기 성공");
			address_gobstr = address_gob.toJson(volistAddress);
			out.println(address_gobstr);
			//System.out.println(address_gobstr);
		} else {
			System.out.println("주소 정보 불러오기 실패");

		}
		out.flush();
		out.close();

	}
}
