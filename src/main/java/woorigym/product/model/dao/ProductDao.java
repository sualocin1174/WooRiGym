package woorigym.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;

public class ProductDao {

	public ProductDao() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductTable> readProductList(Connection conn, String productNo){
		ArrayList<ProductTable> productlist = null;
		String sql = "select * from product where product_No=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productNo);
			rset = pstmt.executeQuery();
			System.out.println("product-1");
			if(rset.next()) {
				productlist = new ArrayList<ProductTable>();
				System.out.println("product-2");
				do {
					ProductTable vo = new ProductTable();
					vo.setProductNo(rset.getString("PRODUCT_NO"));
					vo.setProductName(rset.getString("PRODUCT_NAME"));
					vo.setParentCategory(rset.getString("PARENT_CATEGORY"));
					vo.setChildCategory(rset.getString("CHILD_CATEGORY"));
					vo.setQuantity(rset.getInt("QUANTITY"));
					vo.setPrice(rset.getInt("PRICE"));
					vo.setProductInfoUrl(rset.getString("PRODUCT_INFO_URL"));
					vo.setProductOption(rset.getString("PRODUCT_OPTION"));
					productlist.add(vo);
					System.out.println("product-3");
				} while(rset.next());
			}
		} catch(Exception e) {
			System.out.println("product-4");
			e.printStackTrace();
		} finally {
				jdbcTemplate.close(rset);
				jdbcTemplate.close(pstmt);
			}
		System.out.println("product 리턴은" + productlist);
		return productlist;
	}
	
	public int addProduct(Connection conn, ProductTable vo) {
		int result = -1;
		String sqlInsert = "INSERT INTO"
				+ " PRODUCT"
				+ " (PRODUCT_NO, PRODUCT_NAME, PARENT_CATEGORY, CHILD_CATEGORY, QUANTITY, PRICE, PRODUCT_INFO_URL, PRODUCT_OPTION)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, vo.getProductNo());
			pstmt.setString(2, vo.getProductName());
			pstmt.setString(3, vo.getParentCategory());
			pstmt.setString(4, vo.getChildCategory());
			pstmt.setInt(5, vo.getQuantity());
			pstmt.setInt(6, vo.getPrice());
			pstmt.setString(7, vo.getProductInfoUrl());
			pstmt.setString(8, vo.getProductOption());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateProduct(Connection conn, ProductTable vo) {
		int result = -1;
		String sqlUpdate = "UPDATE PRODUCT SET (PRODUCT_NAME=?, PARENT_CATEGORY=?, CHILD_CATEGORY=?, QUANTITY=?, PRICE=?, PRODUCT_INFO_URL=?, PRODUCT_OPTION=?) WHERE PRODUCT_NO=?"; 
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, vo.getProductName());
			pstmt.setString(2, vo.getParentCategory());
			pstmt.setString(3, vo.getChildCategory());
			pstmt.setInt(4, vo.getQuantity());
			pstmt.setInt(5, vo.getPrice());
			pstmt.setString(6, vo.getProductInfoUrl());
			pstmt.setString(7, vo.getProductOption());
			pstmt.setString(8, vo.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn, String productNo) {
		int result = -1;
		String sqlDelete = "DELETE FROM PRODUCT WHERE PRODUCT_NO=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setString(1, productNo);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int checkDuplicatedProduct(Connection conn, ProductTable vo) {
		int result =-1;
		String sql = "select PRODUCT_NO from PRODUCT where PRODUCT_NO=?";
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getProductNo());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;  //  기존 상품이 있으면
				System.out.println("이미 상품이 존재합니다.");
			} else {
				result = 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류 발생");
			// 여기 -1
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
}
