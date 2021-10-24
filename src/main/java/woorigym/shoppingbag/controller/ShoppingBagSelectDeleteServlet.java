package woorigym.shoppingbag.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.shoppingbag.model.service.ShoppingBagService;
import woorigym.shoppingbag.model.vo.CartTable;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class ShoppingBagSelectDeleteServlet
 */
@WebServlet("/sbsdelete.ajax")
public class ShoppingBagSelectDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingBagSelectDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String sbsdelete = request.getParameter("cartNo");
		System.out.println("장바구니 번호1"+sbsdelete);
		// cartNo = Integer.parseInt(sbsdelete);
		// System.out.println("장바구니 번호2"+cartNo);
		
		StringTokenizer st = new StringTokenizer(sbsdelete, ",");
		int length = st.countTokens();
		int[] list = new int[length];
		for(int i = 0 ; i < length ; i++) {
			list[i] = Integer.parseInt(st.nextToken());
			System.out.println(list[i]);
		}
		
		int cartNo = 0;
		
		// DB에서 값 읽어오기
		cartNo = new ShoppingBagService().selectDeleteCartList(list);
		
		PrintWriter out = response.getWriter();
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonListVo = gson.toJson(cartNo);
		out.print(jsonListVo);
		out.flush();
		out.close();
		System.out.println(list);
		System.out.println(cartNo);
	}
}
