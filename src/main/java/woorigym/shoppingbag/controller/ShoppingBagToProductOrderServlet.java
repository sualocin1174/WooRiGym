package woorigym.shoppingbag.controller;

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

import woorigym.shoppingbag.model.service.ShoppingBagService;
import woorigym.shoppingbag.model.vo.CartTable;

/**
 * Servlet implementation class ShoppingBagToProductOrderServlet
 */
@WebServlet("/sbtopo.ajax")
public class ShoppingBagToProductOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShoppingBagToProductOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("userId");
		
		ArrayList<CartTable> allbuyCartList = new ShoppingBagService().allbuyCartList(userId);
		System.out.println("아이디"+allbuyCartList);
		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(allbuyCartList);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}

}
