package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderUsedMileageSerlvet
 */
@WebServlet("/orderusedmile")
public class OrderUsedMileageSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderUsedMileageSerlvet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");

		int result = -1;
		String user_id = request.getParameter("user_id");
		int used_mile = Integer.parseInt(request.getParameter("used_mile"));

		result = new OrderService().usedMileage(user_id, used_mile);

		PrintWriter out = response.getWriter();

		Gson usemile_gob = new GsonBuilder().setPrettyPrinting().create();
		String usemile_gobStr = "";
		if (result != -1) {
			System.out.println("사용한 적립금 빼기 성공");
			usemile_gobStr = usemile_gob.toJson(result);
			out.println(usemile_gobStr);
		} else {
			System.out.println("사용한 적립금 빼기 실패");
		}

		out.flush();
		out.close();

	}

}
