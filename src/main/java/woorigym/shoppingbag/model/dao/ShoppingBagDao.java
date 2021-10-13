package woorigym.shoppingbag.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;
import woorigym.shoppingbag.model.vo.CartTable;

public class ShoppingBagDao {
	// 장바구니에 담기
	public int putCartList(Connection conn, String userId, String productNo, int cart_quantity) {
		System.out.println("putCartList 1");
		System.out.println(userId);
		System.out.println(productNo);
		System.out.println(cart_quantity);
		int result = -1;
		String sql = "insert into CART values (cart_seq.nextval, ?, ?, ?, 0)";
		System.out.println(sql);

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("putCartList executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, productNo);
			pstmt.setInt(3, cart_quantity);
			rset = pstmt.executeQuery();
			System.out.println("putCartList executeQuery 2");
			if (rset.next()) {
				System.out.println("putCartList executeQuery over 1");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("putCartList 2" + result);
		return result;
	}

	// 상품 개별 배송비
	ArrayList<CartTable> orderCost(Connection conn, String userId) {
		System.out.println("orderCost 1");
		System.out.println(userId);
		ArrayList<CartTable> volist = null;
		String sql = "SELECT c.checked, c.user_id, p.price,"
				+ "       CASE"
				+ "          WHEN p.price >= 100000  THEN '무료배송'"
				+ "          WHEN p.price < 100000  THEN '배송비 2,500원'"
				+ "       END as 배송비"
				+ " from cart c join product p on c.product_no = p.product_no"
				+ " where user_id = ? ";
		System.out.println(sql);

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("orderCost executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			System.out.println("orderCost executeQuery 2");
			if (rset.next()) {
				System.out.println("orderCost executeQuery over 1");
				volist = new ArrayList<CartTable>();
				do {
					CartTable vo = new CartTable();
					vo.setChecked(rset.getInt("checked"));
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setCartQuantity(rset.getInt("cart_quantity"));
					vo.setPrice(rset.getInt("price"));
					volist.add(vo);
					System.out.println("orderCost executeQuery over++ 1");
				} while (rset.next());
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("cartList 2" + volist);
		return volist;
	}

	// 장바구니 내역 리스트
	ArrayList<CartTable> cartList(Connection conn, String userId) {
		System.out.println("cartList 1");
		System.out.println(userId);
		ArrayList<CartTable> volist = null;
		String sql = "select c.checked, p.product_name, p.product_option, c.cart_quantity, p.price, p.price *0.01 "
				+ " from cart c join product p on c.product_no = p.product_no " + " where user_id = ? ";
		System.out.println(sql);

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("cartList executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			System.out.println("cartList executeQuery 2");
			if (rset.next()) {
				System.out.println("cartList executeQuery over 1");
				volist = new ArrayList<CartTable>();
				do {
					CartTable vo = new CartTable();
					vo.setChecked(rset.getInt("checked"));
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setCartQuantity(rset.getInt("cart_quantity"));
					vo.setPrice(rset.getInt("price"));
					volist.add(vo);
					System.out.println("cartList executeQuery over++ 1");
				} while (rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("cartList 2" + volist);
		return volist;
	}

}
