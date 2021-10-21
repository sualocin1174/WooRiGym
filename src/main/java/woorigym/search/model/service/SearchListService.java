package woorigym.search.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.dao.SearchListDao;

public class SearchListService {
	
	// 2021.10.12 1차 추가시작
	public ProductTable getProductNo(String productNo) {
		ProductTable vo = null;
		Connection conn = jdbcTemplate.getConnection();
		vo = new SearchListDao().getProductNo(conn, productNo);
		jdbcTemplate.close(conn);
		return vo;
	}
	
	public ArrayList<ProductTable> searchProductList(ProductTable searchKeyVo, int start, int end) {
		ArrayList<ProductTable> produList = null;
		Connection conn = jdbcTemplate.getConnection();
		produList = new SearchListDao().searchProductList(conn, searchKeyVo, start, end);
		jdbcTemplate.close(conn);
		return produList;
	}
	// 2021.10.12 1차 추가완료
	
	// 2021.10.11 추가시작
	public int getProductListCount() {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		result = new SearchListDao().getProductListCount(conn);		
		jdbcTemplate.close(conn);
		return result;
	}
	// 2021.10.11 추가완료
	
	// 2021.10.07 추가시작
	public ArrayList<ProductTable> productSearch(ProductTable searchKeyVo) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().productSearch(conn, searchKeyVo);
		jdbcTemplate.close(conn);
		return productlist;
	}
	// 2021.10.07 추가완료
	
	
	public ArrayList<ProductTable> productSearch(String productName) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().productSearch(conn, productName);
		jdbcTemplate.close(conn);
		return productlist;
	}
	
	// 2021.10.07 추가시작
	public ArrayList<ProductTable> priceSearch(int minprice, int maxprice) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().priceSearch(conn, minprice, maxprice);
		return productlist;
	}
	
	public ArrayList<ProductTable> buyRankSearch() {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().buyRankSearch(conn);
		return productlist;
	}
	
	public ArrayList<ProductTable> scoreRankSearch() {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().scoreRankSearch(conn);
		return productlist;
	}
	
	public ArrayList<ProductTable> categorySearch() {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().categorySearch(conn);
		return productlist;
	}
	// 2021.10.07 추가완료
}