package woorigym.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.service.SearchListService;

/**
 * Servlet implementation class ProductPageServlet
 */
@WebServlet("/ppage")
public class ProductPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/productpage.jsp";
		//확인하고 싶은 jsp 경로만 수정하고 새로고침하면 됩니다.
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8"); 
		// 2021-10-07 수정
		PrintWriter out = response.getWriter();
		Map<String, Object> map1 = new HashMap<String, Object>();
		String jsonResultMap = "";
		
		// 검색 조건들 읽어오기
		String parentCategory = request.getParameter("parentCategory");
		String childCategory = request.getParameter("childCategory");
		ProductTable searchKeyVo = new ProductTable();
		if(parentCategory != null && !parentCategory.equals(""))   searchKeyVo.setParentCategory(parentCategory);
		if(childCategory != null && !childCategory.equals(""))   searchKeyVo.setChildCategory(childCategory);
		
		System.out.println("searchKeyVo 전달받은:"+ searchKeyVo);
		

		final int PAGE_SIZE = 20; // 한 페이지 당 글수
		final int PAGE_BLOCK = 5; // 한 화면에 나타날 페이지 링크 수
		// 페이지당 글 수랑 화면에 나타낼 페이지 수 변경
		int bCount = 0; // 총 글수
		int pageCount = 0; // 총 페이지수
		int startPage = 1; // 화면에 나타날 시작페이지
		int endPage = 1; // 화면에 나타날 마지막페이지
		int currentPage = 1;
		int startRnum = 1; // 화면에 글
		int endRnum = 1; // 화면에 글
		
		String pageNum = request.getParameter("pagenum");
		if (pageNum != null) { // 눌려진 페이지가 있음.
			currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
		}
		// 총 글수
		bCount = new SearchListService().getProductPageListCount(searchKeyVo);
		// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)
		pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
		// rownum 조건 계산
		startRnum = (currentPage - 1) * PAGE_SIZE + 1; // 1//6//11/16//21
		endRnum = startRnum + PAGE_SIZE - 1;
		if (endRnum > bCount) {
			endRnum = bCount;
		}

		if (currentPage % PAGE_BLOCK == 0) {
			startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
		} else {
			startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
		}
		endPage = startPage + PAGE_BLOCK - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("bCount:"+bCount);
		System.out.println("startRnum:"+startRnum);
		System.out.println("endRnum:"+endRnum);
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		System.out.println("pageCount:"+pageCount);
		System.out.println("currentPage:"+currentPage);

		ArrayList<ProductTable> productlist = new SearchListService().productPageList(searchKeyVo, startRnum, endRnum);
		System.out.println("productlist :"+productlist);

		// vo 관련 데이터 채우기
		map1.put("productlist", productlist);
		// search 관련 데이터 채우기
		map1.put("searchKeyVo", searchKeyVo);
		// page 관련 데이터 채우기
		map1.put("startPage", startPage);
		map1.put("endPage", endPage);
		map1.put("pageCount", pageCount);
		map1.put("currentPage", currentPage);
		
		
		Gson gson = new GsonBuilder().create();
		jsonResultMap = gson.toJson(map1);
		System.out.println("jsonListVo"+jsonResultMap);
		out.print(jsonResultMap);
		out.flush();
		out.close();
	}
}