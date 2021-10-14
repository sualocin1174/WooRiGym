package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.shoppingbag.model.vo.CartTable;
import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderDetailInsertServlet
 */
@WebServlet("/orderdetailinsert")
public class OrderDetailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String product_noArr = request.getParameter("productNo");
		String product_quanArr = request.getParameter("ProductQuan");
//		newDataArrayToSendNo
//		newDataArrayToSendQuan
		
		
		String proNoArr[] = product_noArr.split(",");
		String proQuanArr[] = product_quanArr.split(",");
		
		int result = -1;
		
		result = new OrderService().orderDeatilInsert(user_id, proNoArr, proQuanArr);
		
		PrintWriter out = response.getWriter();

		Gson ordetail_gob = new GsonBuilder().setPrettyPrinting().create();
		String ordetail_gobStr = "";
		if (result > 0 ) {
			System.out.println("주문 상세내역 기록 성공");
			ordetail_gobStr = ordetail_gob.toJson(result);
			out.println(ordetail_gobStr);
			// System.out.println(cart_gobStr);
		} else{
			System.out.println("주문 상세내역 기록 실패");
		}

		out.flush();
		out.close();
		
				
		
			
	}

}
