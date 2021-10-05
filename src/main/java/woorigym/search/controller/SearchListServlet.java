package woorigym.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.common.Command;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.service.SearchListService;

/**
 * Servlet implementation class SearchListServlet
 */
@WebServlet("/slist")
public class SearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String viewPage = null;
		Command cmd = null;
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String com = uri.substring(contextPath.length());
		System.out.println(uri);
		System.out.println(contextPath);
		System.out.println(com);
		
		viewPage = "/WEB-INF/index.jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
//		String productName = request.getParameter("product_name");
		
//		ArrayList<ProductTable> productlist = new SearchListService().productSearch(productName);
//		response.getWriter().append(productName+"상품이 조회되었습니다.");
		
	}

}
