package woorigym.shoppingbag.model.dao;

import static woorigym.common.jdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;
import woorigym.shoppingbag.model.vo.CartTable;

public class ShoppingBagDao {
	// 2021.10.24 내용추가 시작
	// 장바구니 선택구매
		public int selectBuyCartList(Connection conn, int[] list) {
			System.out.println("selectBuyCartList 1");
			System.out.println(list);
			int result = -1;
			String sql = "update cart set checked = 1 where cart_no = ?";
			System.out.println(sql);

			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try {
				System.out.println("selectBuyCartList executeQuery 1");
				for(int i = 0 ; i < list.length;i++ ) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, list[i]);
					rset = pstmt.executeQuery();
				}
				System.out.println("selectBuyCartList executeQuery 2");
				if (rset.next()) {
					System.out.println("selectBuyCartList executeQuery over 1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				jdbcTemplate.close(rset);
				jdbcTemplate.close(pstmt);
			}
			System.out.println("selectBuyCartList 2" + result);
			return result;
		}
	
	// 장바구니 전체구매
		public ArrayList<CartTable> allbuyCartList(Connection conn, String userId) {
			System.out.println("allbuyCartList 1");
			System.out.println(userId);
			ArrayList<CartTable> volist = null;
			String sql = "update cart set checked = 1 where user_id = ?";
			System.out.println(sql);

			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try {
				System.out.println("allbuyCartList executeQuery 1");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();
				System.out.println("allbuyCartList executeQuery 2");
				if (rset.next()) {
					System.out.println("allbuyCartList executeQuery over 1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				jdbcTemplate.close(rset);
				jdbcTemplate.close(pstmt);
			}
			System.out.println("allbuyCartList 2" + volist);
			return volist;
		}
	// 2021.10.24 내용추가 완료
	
	
	// 2021.10.22 1차 내용추가 시작
	// 장바구니 옵션변경 모달창 수량변경부분 쿼리문
//	public int ShoppingBagQuantityUpdate(Connection conn, int cartNo) {
//		
//	}
	
	// 장바구니 옵션변경 모달창 옵션변경부분 쿼리문
	public ArrayList<ProductTable> ShoppingBagOptionUpdate(Connection conn, String productName){
		System.out.println(productName);
		System.out.println("ShoppingBagOptionUpdate 1");
		ArrayList<ProductTable> volist = null;
		String sql = "select product_info_url, product_name, product_option"
				+ " from product"
				+ " where product_name = ?";
		
		System.out.println(sql);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("ShoppingBagOptionUpdate executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			rset = pstmt.executeQuery();
			System.out.println("ShoppingBagOptionUpdate executeQuery 2");
			if (rset.next()) {
				System.out.println("ShoppingBagOptionUpdate executeQuery over 1");
				volist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setProductInfoUrl(rset.getNString("product_info_url"));
					volist.add(vo);			
					System.out.println("ShoppingBagOptionUpdate executeQuery over 2");
				} while (rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("ShoppingBagOptionUpdate 2" + volist);
		return volist;
	}
	// 2021.10.22 1차 내용추가 완료
	
	// 2021.10.14 1차 내용추가 시작
	public ArrayList<CartTable> ShoppingBagList(Connection conn, String userId, int start, int end) {
		System.out.println(userId);
		System.out.println(start);
		System.out.println(end);
		System.out.println("ShoppingBagList 1");
		
		ArrayList<CartTable> volist = null;
		String sql = "select *"
				+ " from (select rownum r, t1.*"
				+ "      from(select c.cart_no, c.checked, p.product_name, p.product_option, c.cart_quantity, p.price, p.price *0.01,"
				+ "       		 CASE"
				+ "         		 WHEN p.price >= 100000  THEN '개별구매시 무료배송'"
				+ "       		   WHEN p.price < 100000  THEN '개별구매시 배송비 2,500원'"
				+ "      		 END as ordercost"
				+ "           from cart c join product p on c.product_no = p.product_no"
				+ "           where user_id = ?"
				+ "           )"
				+ "      t1) t2"
				+ " where r between ? and ?";
		System.out.println(sql);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("ShoppingBagList executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			System.out.println("ShoppingBagList executeQuery 2");
			if (rset.next()) {
				System.out.println("ShoppingBagList executeQuery over 1");
				volist = new ArrayList<CartTable>();
				do {
					CartTable vo = new CartTable();
					vo.setCartNo(rset.getInt("cart_no")); // 2021.10.15 2차 내용추가 시작 및 완료
					vo.setChecked(rset.getInt("checked"));
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setCartQuantity(rset.getInt("cart_quantity"));
					vo.setPrice(rset.getInt("price"));
					vo.setOrdercost(rset.getNString("ordercost"));
					volist.add(vo);			
					System.out.println("ShoppingBagList executeQuery over 2");
				} while (rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("ShoppingBagList 2" + volist);
		return volist;
	}

	public int getShoppingBagListCount(Connection conn, String userId) {
		int result = 0;
		String sql = "select count(cart_no) from cart where user_id = ? ";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	// TODO
	// 장바구니 체크박스 선택 및 해제 update .. 체크박스를 체크하면 cartNo를 알 수 있어야하고 조건값 일치할때 다른 쿼리문 적용해야
	public int selectCheckBoxUpdateCartList(Connection conn, int cartNo) {
		System.out.println("selectCheckBoxUpdateCartList 1");
		System.out.println(cartNo);
		int result = -1;
		String selectsql = "update cart set checked = 1 where cart_no = ? ";
		String cancelsql = "update cart set checked = 1 where cart_no = ? ";

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("selectCheckBoxUpdateCartList executeQuery 1");
			pstmt = conn.prepareStatement(selectsql);
			pstmt.setInt(1, cartNo);
			rset = pstmt.executeQuery();
			System.out.println("selectCheckBoxUpdateCartList executeQuery 2");
			if (rset.next()) {
				System.out.println("selectCheckBoxUpdateCartList executeQuery over 1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("selectCheckBoxUpdateCartList 2" + result);
		return result;
	}
	
	// TODO
	// 장바구니 선택삭제 .. 체크박스를 체크하면 cartNo를 알 수 있어야함?
	public int selectDeleteCartList(Connection conn, int[] list) {
		System.out.println("selectDeleteCartList 1");
		System.out.println(list);
		int result = -1;
		String sql = "delete from cart where cart_no = ? ";
		System.out.println(sql);

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("selectDeleteCartList executeQuery 1");
			for(int i = 0 ; i < list.length;i++ ) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, list[i]);
				rset = pstmt.executeQuery();
			}
			System.out.println("selectDeleteCartList executeQuery 2");
			if (rset.next()) {
				System.out.println("selectDeleteCartList executeQuery over 1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("selectDeleteCartList 2" + result);
		return result;
	}

	// 장바구니 전체삭제
	public ArrayList<CartTable> allDeleteCartList(Connection conn, String userId) {
		System.out.println("deleteCartList 1");
		System.out.println(userId);
		ArrayList<CartTable> volist = null;
		String sql = "delete from cart where user_id = ?";
		System.out.println(sql);

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("allDeleteCartList executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			System.out.println("allDeleteCartList executeQuery 2");
			if (rset.next()) {
				System.out.println("allDeleteCartList executeQuery over 1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("allDeleteCartList 2" + volist);
		return volist;
	}
	// 2021.10.14 1차 내용추가 완료

	// 장바구니 담기
	public int putCartList(Connection conn, String userId, String productNo, int cart_quantity) {
		System.out.println("putCartList 1");
		System.out.println(userId);
		System.out.println(productNo);
		System.out.println(cart_quantity);
		int result = -1;
		String sql = "insert into cart values (cart_seq.nextval, ?, ?, ?, 0)";
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
	public ArrayList<CartTable> orderCost(Connection conn, String userId) {
		System.out.println("orderCost 1");
		System.out.println(userId);
		ArrayList<CartTable> volist = null;
		String sql = "SELECT c.checked, c.user_id, p.price,"
				+ "       CASE"
				+ "          WHEN p.price >= 100000  THEN '개별구매시 무료배송'"
				+ "          WHEN p.price < 100000  THEN '개별구매시 배송비 2,500원'"
				+ "       END as ordercost" + " from cart c join product p on c.product_no = p.product_no"
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
					vo.setOrdercost(rset.getNString("ordercost"));
					// 2021.10.15 2차 내용삭제 시작
//					vo.setChecked(rset.getInt("checked"));
//					vo.setProductName(rset.getString("product_name"));
//					vo.setProductOption(rset.getString("product_option"));
//					vo.setCartQuantity(rset.getInt("cart_quantity"));
//					vo.setPrice(rset.getInt("price"));
					// 2021.10.15 2차 내용삭제 완료
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
	public ArrayList<CartTable> cartList(Connection conn, String userId) {
		System.out.println("cartList 1");
		System.out.println(userId);
		ArrayList<CartTable> volist = null;
		String sql = "select c.cart_no, c.checked, p.product_name, p.product_option, c.cart_quantity, p.price, p.price *0.01,"
				+ "       CASE"
				+ "          WHEN p.price >= 100000  THEN '개별구매시 무료배송'"
				+ "          WHEN p.price < 100000  THEN '개별구매시 배송비 2,500원'"
				+ "       END as ordercost"
				+ " from cart c join product p on c.product_no = p.product_no"
				+ " where user_id = ? ";
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
					vo.setCartNo(rset.getInt("cart_no"));
					vo.setChecked(rset.getInt("checked"));
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setCartQuantity(rset.getInt("cart_quantity"));
					vo.setPrice(rset.getInt("price"));
					vo.setOrdercost(rset.getNString("ordercost"));
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
