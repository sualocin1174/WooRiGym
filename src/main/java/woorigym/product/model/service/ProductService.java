package woorigym.product.model.service;

import static woorigym.common.jdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.dao.ProductDao;
import woorigym.product.model.vo.ProductTable;

public class ProductService {

	public ProductService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductTable> readProductList(String productNo){
		ArrayList<ProductTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		volist = new ProductDao().readProductList(conn, productNo);
		
		jdbcTemplate.close(conn);
		return volist;
	}
	
	public int addProduct(ProductTable vo){
		int result = -1;
		int result2 = -1;
		Connection conn = getConnection();
		jdbcTemplate.setAutoCommit(conn, false);
		result2 = new ProductDao().checkDuplicatedProduct(conn, vo);
		
		if(result == 0) {
			result = new ProductDao().addProduct(conn, vo);
			
			if(result >0 && result2 >0) {
				jdbcTemplate.commit(conn);
			}
			else
				jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result; //오류발생:-1 상품등록성공:1, 상품등록실패:0. 기존에 등록되어 있던 상품:2 
	}
	
	public int updateProduct(ProductTable vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new ProductDao().updateProduct(conn, vo);
		
		jdbcTemplate.close(conn);
		return result;
	}
	
	public int deleteProduct(String productNo) {
		int result = -1;
		Connection conn = getConnection();
		result = new ProductDao().deleteProduct(conn, productNo);
		
		jdbcTemplate.close(conn);
		return result;
	}
	
}
