package woorigym.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String productNoStr = request.getParameter("productNo");
		String productName = request.getParameter("productName");
		String parentCategory = request.getParameter("parentCategory");
		String childCategory = request.getParameter("childCategory");
		String quantityStr = request.getParameter("quantity");
		String price = request.getParameter("price");
		String productInfoUrl = request.getParameter("productInfoUrl");
		String productOption = request.getParameter("productOption");
		int productNo = 0;
		int quantity = 0;
		try {
			productNo = Integer.parseInt(productNoStr);
			quantity = Integer.parseInt(quantityStr);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("숫자로 변환하지 못했음.");
			//
//			out.println("오류발생");
//			out.flush();
//			out.close();
//			return;
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
