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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		execute(request, response); // 2021.10.14 1차 내용추가 시작 및 완료
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response); // 2021.10.14 1차 내용추가 시작 및 완료
	}

	// 2021.10.14 1차 내용추가 시작
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2021.10.13 1차 수정시작
		final int PAGE_SIZE = 10; // 한 페이지 당 글수
		final int PAGE_BLOCK = 5; // 한 화면에 나타날 페이지 링크 수
		// 페이지당 글 수랑 화면에 나타낼 페이지 수 변경
		// 2021.10.13 1차 수정완료
		int bCount = 0; // 총 글수
		int pageCount = 0; // 총 페이지수
		int startPage = 1; // 화면에 나타날 시작페이지
		int endPage = 1; // 화면에 나타날 마지막페이지
		int currentPage = 1;
		int startRnum = 1; // 화면에 글
		int endRnum = 1; // 화면에 글

		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable) request.getSession().getAttribute("loginSS");
		String userId = "";
		if (loginSS == null) {
			response.sendRedirect("login");
			return;
		} else {
			userId = loginSS.getUser_id();
		}
		String pageNum = request.getParameter("pagenum");
		if (pageNum != null) { // 눌려진 페이지가 있음.
			currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
		}
		// 총 글수
		bCount = new ShoppingBagService().getShoppingBagListCount(userId);
		// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)
		pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
		// rownum 조건 계산
		startRnum = (currentPage - 1) * PAGE_SIZE + 1; // 1//6//11/16//21
		endRnum = startRnum + PAGE_SIZE - 1;
		if (endRnum > bCount) {
			endRnum = bCount;
		}

		if (currentPage % PAGE_BLOCK == 0) {
			startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
		} else {
			startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
		}
		endPage = startPage + PAGE_BLOCK - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println(bCount);
		System.out.println(startRnum);
		System.out.println(endRnum);
		System.out.println(endPage);
		System.out.println(startPage);
		System.out.println(pageCount);
		// DB에서 값 읽어오기
		ArrayList<CartTable> volist = new ShoppingBagService().ShoppingBagList(userId, startRnum, endRnum);
		System.out.println("22222@@@@@@@@@@@@@@@===============");
		System.out.println(volist);

		// Data 전달을 위해서 request에 셋
//		request.setAttribute("cartTableVolist", volist);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("pageCount", pageCount);
//		request.setAttribute("userId", userId);
//		request.getRequestDispatcher("/WEB-INF/shoppingbag.jsp").forward(request, response);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("cartTableVolist", volist);
		map1.put("startPage", startPage);
		map1.put("endPage", endPage);
		map1.put("pageCount", pageCount);
		map1.put("userId", userId);

		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(map1);
		
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
	// 2021.10.14 1차 내용추가 완료
}
