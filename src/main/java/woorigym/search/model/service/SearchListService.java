package woorigym.search.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.dao.SearchListDao;

public class SearchListService {
	
	// 2021-10-07 추가
	public ArrayList<ProductTable> productSearch(ProductTable searchKeyVo) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().productSearch(conn, searchKeyVo);
		jdbcTemplate.close(conn);
		return productlist;
	}
	// 2021-10-07 추가완료
	
	
	public ArrayList<ProductTable> productSearch(String productName) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().productSearch(conn, productName);
		jdbcTemplate.close(conn);
		return productlist;
	}
	
	// 2021-10-07 추가
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
	// 2021-10-07 추가완료
}