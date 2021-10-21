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
 * Servlet implementation class OrderUsedCouponServlet
 */
@WebServlet("/orderusedcoupon")
public class OrderUsedCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderUsedCouponServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");

		System.out.println("쿠폰 사용 진입");
		String user_id = request.getParameter("user_id");
		String coupon_no = request.getParameter("coupon_no");

		int result = -1;

		result = new OrderService().UpdateCoupon(coupon_no, user_id);

		PrintWriter out = response.getWriter();

		Gson usecou_gob = new GsonBuilder().setPrettyPrinting().create();
		String usecou_gobStr = "";
		if (result > 0) {
			usecou_gobStr = usecou_gob.toJson(result);
			out.println(usecou_gobStr);
			System.out.println("사용된 쿠폰 변경 성공");
			// System.out.println(cart_gobStr);
		} else {
			System.out.println("사용된 쿠폰 변경 실패");
		}

		out.flush();
		out.close();

	}

}
