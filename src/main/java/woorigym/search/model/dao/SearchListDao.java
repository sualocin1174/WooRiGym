package woorigym.search.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;

public class SearchListDao {
	public ArrayList<ProductTable> productSearch(Connection conn, String productName) {
		ArrayList<ProductTable> productlist = null;
//		String product_name = null;
		String sql = "select * from product where product_name like '% ? %'";
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rest.getString("product_info_url"));
					vo.setProductName(rest.getString("product_name"));
					vo.setProductOption(rest.getString("product_option"));
					vo.setPrice(rest.getInt("price"));
					productlist.add(vo);
				} while(rest.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rest);
			jdbcTemplate.close(pstmt);
		}
		return productlist;
	}
}