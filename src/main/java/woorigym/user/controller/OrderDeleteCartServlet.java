package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderDeleteCartServlet
 */
@WebServlet("/orderdeletecart")
public class OrderDeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String cart_nolist = request.getParameter("cart_nolist");
		
		StringTokenizer st = new StringTokenizer(cart_nolist, ",");
		int length = st.countTokens();
		int[] list = new int[length];
		for(int i = 0 ; i < length ; i++) {
			list[i] = Integer.parseInt(st.nextToken());
			System.out.println(list[i]);
		}
		// 주문한 상품의 번호 리스트인 list를 이용해서 db에서 cart테이블의 행 삭제
		int result = -1;
		
		result = new OrderService().deleteCartList(list);
		
		if(result == length) {
			System.out.println("장바구니에서 주문한 상품 삭제 성공");
			
		}
		
		PrintWriter out = response.getWriter();

		Gson cart_gob = new GsonBuilder().setPrettyPrinting().create();
		String cart_gobStr = "";
		if (result == length) {
			cart_gobStr = cart_gob.toJson(result);
			out.println(cart_gobStr);
			System.out.println("장바구니에서 주문한 상품 모두 삭제 성공");
		} else{
			System.out.println("장바구니에서 주문한 상품 삭제 실패");
		}

		out.flush();
		out.close();
		
	}

}
