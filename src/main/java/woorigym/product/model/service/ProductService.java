package woorigym.product.model.service;

import static woorigym.common.jdbcTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.ProductImgTable;
import woorigym.admin.model.vo.ProductOptionTable;
import woorigym.common.jdbcTemplate;
import woorigym.product.model.dao.ProductDao;
import woorigym.product.model.vo.ProductTable;

public class ProductService {

	public ProductService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductTable> readProductList(){
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		productlist = new ProductDao().readProductList(conn);
		
		jdbcTemplate.close(conn);
		return productlist;
	}
	
	public ArrayList<ProductTable> readProductList(String productNo){
		ArrayList<ProductTable> productlist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		productlist = new ProductDao().readProductList(conn, productNo);
		
		jdbcTemplate.close(conn);
		return productlist;
	}
	
	public int addProduct(ProductTable productVo){
		int result = -1;
		Connection conn = getConnection();

		result = new ProductDao().addProduct(conn, productVo);
			
		jdbcTemplate.close(conn);
		return result; //오류발생:-1 상품등록성공:1, 상품등록실패:0. 기존에 등록되어 있던 상품:2 
	}
	
	public int checkDuplicatedProduct(String productNo) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new ProductDao().checkDuplicatedProduct(conn, productNo);
		jdbcTemplate.close(conn);
		return result;
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
	
	public ProductTable select(String productName) {
		Connection conn = getConnection();
		ProductTable vo = new ProductDao().ProdectDetailList(conn, productName);
		jdbcTemplate.close(conn);
		return vo;
	}
	
}
