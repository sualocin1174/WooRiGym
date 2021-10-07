package woorigym.admin.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.dao.ProductDao;
import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;

public class ProductService {

	public ProductService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductTable> readProductListAll(){
		ArrayList<ProductTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		volist = new ProductDao().readProductListAll(conn);
		
		jdbcTemplate.close(conn);
		return volist;
	}
	
}
