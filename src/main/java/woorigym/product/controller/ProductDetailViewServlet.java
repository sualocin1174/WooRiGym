package woorigym.product.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.controller.SearchListServletAjax;
import woorigym.search.model.service.SearchListService;
import woorigym.user.model.vo.UserTable;

@WebServlet("/pdetailview")
public class ProductDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductDetailViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 안되면 진입불가
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		if(loginSS == null) {
			System.out.println("loginSS~~~~~~~~~");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
		}
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String ProdectNum ="";
		int price = 0;
		String productName = request.getParameter("productName");
		String productImg = request.getParameter("productImg");
		System.out.println("상품 이름 -->"+productName);
		System.out.println("상품 이미지 경로--> "+productImg);
		ProductService pService = new ProductService();
		ProductTable vo = new ProductTable();
		vo = pService.select(productName);
		System.out.println("상품 리스트"+vo);
		System.out.println("상품 번호--> "+ProdectNum);
		 
			
		request.setAttribute("img", productImg);
		request.setAttribute("prodectInfo", vo);
		request.getRequestDispatcher("/WEB-INF/product_detail.jsp").forward(request, response);
	}
}
