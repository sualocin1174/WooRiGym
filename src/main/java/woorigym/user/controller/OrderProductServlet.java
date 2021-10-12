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

import woorigym.product.model.vo.ProductTable;
import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderProductServlet
 */
@WebServlet("/orderproduct")
public class OrderProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 장바구니에 해당하는 상품 정보 불러오기 모델명, 가격 필요

		response.setContentType("application/json;charset=UTF-8");
		String userid = request.getParameter("user_id");

		PrintWriter out = response.getWriter();

		ArrayList<ProductTable> volistProduct = new OrderService().getProductinfo(userid);
		//System.out.println(volistProduct);
		Gson product_gob = new GsonBuilder().setPrettyPrinting().create();
		String product_gobStr = "";
		if (volistProduct != null) {
			System.out.println("구매상품 정보 불러오기 성공");
			product_gobStr = product_gob.toJson(volistProduct);
			out.println(product_gobStr);
			//System.out.println(product_gobStr);
		} else {
			System.out.println("구매상품 정보 불러오기 실패");
		}

	}

}
