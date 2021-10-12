package woorigym.search.controller;

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

import woorigym.common.Command;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.service.SearchListService;

/**
 * Servlet implementation class SearchListServlet
 */
@WebServlet("/slist.ajax")
public class SearchListServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListServletAjax() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");

		// 2021-10-07 수정
		PrintWriter out = response.getWriter();
		
		String productName = request.getParameter("productName");
		String parentCategory = request.getParameter("parentCategory");
		String childCategory = request.getParameter("childCategory");
		String minPriceStr = request.getParameter("minPrice");
		String maxPriceStr = request.getParameter("maxPrice");
		String selectRank = request.getParameter("selectRank"); // 2021.10.11 1차 내용추가
		int minPrice = -1;
		int maxPrice = -1;
		System.out.println(minPrice);
		System.out.println(maxPrice);
		
		try {
			minPrice = Integer.parseInt(minPriceStr);
			maxPrice = Integer.parseInt(maxPriceStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ProductTable searchKeyVo = new ProductTable();
		if(productName != null && !productName.equals(""))	searchKeyVo.setProductName(productName);
		if(parentCategory != null && !parentCategory.equals(""))   searchKeyVo.setParentCategory(parentCategory);
		if(selectRank != null && !selectRank.equals(""))   searchKeyVo.setSelectRank(selectRank); // 2021.10.11 1차 내용추가
		if(childCategory != null && !childCategory.equals(""))   searchKeyVo.setChildCategory(childCategory);
		searchKeyVo.setMinPrice(minPrice);
		searchKeyVo.setMaxPrice(maxPrice);
		
		ArrayList<ProductTable> productlist = new SearchListService().productSearch(searchKeyVo);
		request.setAttribute("productlist", productlist);
		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(productlist);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
	// 2021-10-07 수정완료

}
