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

import woorigym.user.model.vo.CouponTable;
import woorigym.user.model.vo.UserTable;
import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderCouponServlet
 */
@WebServlet("/ordercoupon")
public class OrderCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO 쿠폰 정보 - 만료전, 사용 안 된 것  가져오기  --> 객체 배열로 넘길 것임 
		response.setContentType("application/json;charset=UTF-8");
		String userid = request.getParameter("user_id");
		PrintWriter out = response.getWriter();

		ArrayList<CouponTable> volistCoupon = new OrderService().getCoupon(userid);
		//System.out.println(volistCoupon);
		Gson coupon_gob = new GsonBuilder().setPrettyPrinting().create();
		String coupon_gobstr = "";
		if (volistCoupon != null) {
			System.out.println("쿠폰 정보 불러오기 성공");
			coupon_gobstr = coupon_gob.toJson(volistCoupon);
			out.println(coupon_gobstr);
//			System.out.println(coupon_gobstr);
		} else {
			System.out.println("쿠폰 정보 불러오기 실패");
		}
	}

}
