package woorigym.shoppingbag.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.service.SearchListService;
import woorigym.shoppingbag.model.service.ShoppingBagService;
import woorigym.shoppingbag.model.vo.CartTable;
import woorigym.user.model.vo.UserTable;


@WebServlet("/sblist.ajax")
public class ShoppingBagListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ShoppingBagListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		execute(request, response); // 2021.10.14 1차 내용추가 시작 및 완료
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response); // 2021.10.14 1차 내용추가 시작 및 완료
	}

	// 2021.10.14 1차 내용추가 시작
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2021.10.13 1차 수정시작

		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable) request.getSession().getAttribute("loginSS");
		String userId = "";
		if (loginSS == null) {
			response.sendRedirect("login");
			return;
		} else {
			userId = loginSS.getUser_id();
		}
		
		// DB에서 값 읽어오기
		ArrayList<CartTable> volist = new ShoppingBagService().cartList(userId);
		System.out.println("22222@@@@@@@@@@@@@@@===============");
		System.out.println(volist);
		// ArrayList<CartTable> orderCost = new ShoppingBagService().orderCost(userId); // 2021.10.15 2차 내용추가 시작 및 완

		// Data 전달을 위해서 request에 셋
//		request.setAttribute("cartTableVolist", volist);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("pageCount", pageCount);
//		request.setAttribute("userId", userId);
//		request.getRequestDispatcher("/WEB-INF/shoppingbag.jsp").forward(request, response);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("cartTableVolist", volist);
		map1.put("userId", userId);

		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(map1);
		
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
	// 2021.10.14 1차 내용추가 완료
}
