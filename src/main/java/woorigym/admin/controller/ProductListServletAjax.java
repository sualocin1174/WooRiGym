
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

import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;

/**
 * Servlet implementation class ProductListSerbletAjax
 */
@WebServlet("/plist.ajax")
public class ProductListServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServletAjax() {
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
		String productInfoUrl = request.getParameter("productInfoUrl");
		String productOption = request.getParameter("productOption");

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
		
		ProductTable productVo = new ProductTable();
		productVo.setProductNo(productNo);
		productVo.setProductName(productName);
		productVo.setParentCategory(parentCategory);
		productVo.setChildCategory(childCategory);
		productVo.setQuantity(quantityInt);
		productVo.setPrice(priceInt);
		productVo.setProductInfoUrl(productInfoUrl);
		productVo.setProductOption(productOption);
		
		ArrayList<ProductTable> productlist = new ProductService().readProductList(productNo);
		request.setAttribute("productlist", productVo);
		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(productlist);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
