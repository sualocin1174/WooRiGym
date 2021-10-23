package woorigym.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.ProductImgTable;
import woorigym.admin.model.vo.ProductOptionTable;
import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;

public class ProductDao {
	public ProductDao() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductTable> readProductList(Connection conn){
		ArrayList<ProductTable> productlist = null;
		String sql = "select * from product";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
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
	public int addProduct(Connection conn, ProductTable productVo, ArrayList<ProductOptionTable> productOption, ArrayList<ProductImgTable> productImg) {
		int result = -1;
		PreparedStatement pstmt = null;
		
		String productsql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?,?,?,?)";
		String optionsql = "INSERT INTO PRODUCT_OPTION VALUES(PRODUCT_OPTION_SEQ.NEXTVAL,?,?)";
		String imgsql = "INSERT INTO PRODUCT_IMG VALUES(PRODUCT_IMG_SEQ.NEXTVAL, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(productsql);
			pstmt.setString(1, productVo.getProductNo());
			pstmt.setString(2, productVo.getProductName());
			pstmt.setString(3, productVo.getParentCategory());
			pstmt.setString(4, productVo.getChildCategory());
			pstmt.setInt(5, productVo.getQuantity());
			pstmt.setInt(6, productVo.getPrice());
			pstmt.setString(7, productVo.getProductInfoUrl());
			pstmt.setString(8, productVo.getProductOption());
			
			result = pstmt.executeUpdate();
			jdbcTemplate.close(pstmt);
			
			System.out.println("productVo:"+ productVo);
			System.out.println("productOption:"+ productOption);
			System.out.println("여기 몇번? "+ productOption.get(0).getOptionContent());
			
			pstmt=conn.prepareStatement(optionsql);
			for(int i=0; i<productOption.size(); i++) {
				pstmt.setString(1, productVo.getProductNo());
				pstmt.setString(2, productOption.get(i).getOptionContent());
				result=pstmt.executeUpdate();
			}
			jdbcTemplate.close(pstmt);
			
			for(int i=0; i<productImg.size(); i++) {
				pstmt=conn.prepareStatement(imgsql);
				pstmt.setString(1, productVo.getProductNo());
				pstmt.setString(2, productImg.get(i).getImgAddress());
				result = pstmt.executeUpdate();
			}
			jdbcTemplate.close(pstmt);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}

	public int updateProduct(Connection conn, ProductTable productVo) {
		int result = -1;
		String sqlUpdate = "UPDATE PRODUCT SET (PRODUCT_NAME=?, PARENT_CATEGORY=?, CHILD_CATEGORY=?, QUANTITY=?, PRICE=?, PRODUCT_INFO_URL=?, PRODUCT_OPTION=?) WHERE PRODUCT_NO=?"; 
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, productVo.getProductName());
			pstmt.setString(2, productVo.getParentCategory());
			pstmt.setString(3, productVo.getChildCategory());
			pstmt.setInt(4, productVo.getQuantity());
			pstmt.setInt(5, productVo.getPrice());
			pstmt.setString(6, productVo.getProductInfoUrl());
			pstmt.setString(7, productVo.getProductOption());
			pstmt.setString(8, productVo.getProductNo());
			
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
	
	public int checkDuplicatedProduct(Connection conn, String productNo) {
		int result = 0;
		String sql = "select count(*) from PRODUCT where PRODUCT_NO=?";
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt(1);
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
