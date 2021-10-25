package woorigym.admin.controller;

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

import woorigym.admin.model.service.OrderInfoService;
import woorigym.admin.model.vo.OrderInfoTable;

@WebServlet("/asales")
public class SalesManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SalesManagementServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/asalesmanagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().create();
		String jsonListVo ="";
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		System.out.println("startDate: "+startDate);
		System.out.println("endDate: "+endDate);
		
		OrderInfoTable orderinfoVo = new OrderInfoTable();
		ArrayList<OrderInfoTable> saleslist = new OrderInfoService().salesList(startDate, endDate);
		response.setContentType("application/json;charset=UTF-8");
		request.setAttribute("saleslist", orderinfoVo);
		jsonListVo = gson.toJson(saleslist);
		System.out.println("jsonListVo: "+jsonListVo);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
}
