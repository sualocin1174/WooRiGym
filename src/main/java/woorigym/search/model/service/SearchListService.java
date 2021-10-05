package woorigym.search.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.dao.SearchListDao;

public class SearchListService {
	public ArrayList<ProductTable> productSearch(String productName) {
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		productlist = new SearchListDao().productSearch(conn, productName);
		jdbcTemplate.close(conn);
		return productlist;
	}
}