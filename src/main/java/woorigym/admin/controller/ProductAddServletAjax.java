package woorigym.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;

/**
 * Servlet implementation class ProductAddServlet
 */
@WebServlet("/apadd.ajax")
public class ProductAddServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddServletAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String productNo = request.getParameter("productNo");
		String productName = request.getParameter("productName");
		String parentCategory = request.getParameter("parentCategory");
		String childCategory = request.getParameter("childCategory");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String productInfoUrl = request.getParameter("product_info_url");
		String productOption = request.getParameter("product_option");
		
		int quantityInt = 0;
		int priceInt = 0;
		
		try {
			quantityInt = Integer.parseInt(quantity);
			priceInt = Integer.parseInt(price);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("숫자로 변환하지 못했음.");
			out.println("오류발생");
			out.flush();
			out.close();
			return;
		}
		
		ProductTable vo = new ProductTable(productNo, productName, parentCategory, childCategory, quantityInt, priceInt, productInfoUrl, productOption);
		int result = new ProductService().addProduct(vo);
		if(result ==0) {
			out.println("상품이 추가되지않았습니다.");
		}
		else {
			out.println("상품이 추가되었습니다.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
