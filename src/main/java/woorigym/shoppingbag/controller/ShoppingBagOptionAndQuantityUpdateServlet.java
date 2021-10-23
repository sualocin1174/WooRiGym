package woorigym.shoppingbag.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class ShoppingBagOptionAndQuantityUpdateServlet
 */
@WebServlet("/sboaqupdate")
public class ShoppingBagOptionAndQuantityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShoppingBagOptionAndQuantityUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/shoppingbag.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		response.setContentType("application/json;charset=UTF-8");
		Gson coupon_gob = new GsonBuilder().setPrettyPrinting().create();
		String gobstr = "";
		System.out.println("옵션변경 목록 조회 성공");
		//gobstr = coupon_gob.toJson(volist);
		//System.out.println(volist);
		System.out.println(gobstr);
		out.println(gobstr);
	}

}
