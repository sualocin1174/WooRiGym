package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;

import woorigym.product.model.vo.ProductTable;
import woorigym.shoppingbag.model.vo.CartTable;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.CouponTable;
import woorigym.user.model.vo.UserTable;

public class OrderDao {

	public OrderDao() {
	}

	public ArrayList<UserTable> getUserInfo(String userid, Connection conn) {
		ArrayList<UserTable> volist;
		String sql = "SELECT USER_NAME, PHONE , MILEAGE  FROM MEMBER";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		volist = new ArrayList<UserTable>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				UserTable vo = new UserTable();
				vo.setUser_name(rs.getString(1));
				vo.setPhone(rs.getString(2));
				vo.setMileage(rs.getInt(3));
				volist.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return volist;
	} // getUserInfo();

	public ArrayList<AddressTable> getAddress(String userid, Connection conn) {
		ArrayList<AddressTable> volist;

		String sql = "SELECT POSTCODE, BASIC_ADDRESS, DETAIL_ADDRESS, FIXED_ADDRESS FROM ADDRESS WHERE USER_ID = ? ORDER BY FIXED_ADDRESS DESC";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		volist = new ArrayList<AddressTable>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				do {
					AddressTable vo = new AddressTable();
					vo.setPostcode(rs.getString(1));
					vo.setBasic_address(rs.getString(2));
					vo.setDetail_address(rs.getString(3));
					vo.setFixed_address(rs.getInt(4));
					volist.add(vo);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return volist;
	} // getAddress();

	public ArrayList<CartTable> getCart(String userid, Connection conn) {
		ArrayList<CartTable> volist;

		String sql = "SELECT PRODUCT_NO, CART_QUANTITY FROM CART WHERE USER_ID=? AND CHECKED = 1 ORDER BY cart_no ASC";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		volist = new ArrayList<CartTable>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					CartTable vo = new CartTable();
					vo.setProductNo(rs.getString(1));
					vo.setCartQuantity(rs.getInt(2));
					volist.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return volist;
	}

	public ArrayList<ProductTable> getProductinfo(String userid, Connection conn) {
		ArrayList<ProductTable> volist;

		String sql = "SELECT PRODUCT_NAME, price" + " FROM CART C JOIN PRODUCT P ON c.product_no = p.product_no"
				+ " WHERE C.USER_ID=? AND C.CHECKED = 1 ORDER BY c.cart_no ASC";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		volist = new ArrayList<ProductTable>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					ProductTable vo = new ProductTable();
					vo.setProductName(rs.getString(1));
					vo.setPrice(rs.getInt(2));
					volist.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}

	public ArrayList<CouponTable> getCoupon(String userid, Connection conn) {
		ArrayList<CouponTable> volist;

		String sql = "SELECT * FROM COUPON WHERE USER_ID=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		volist = new ArrayList<CouponTable>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					CouponTable vo = new CouponTable();// 3 4
					vo.setC_name(rs.getString(3));
					vo.setC_discount(rs.getInt(4));
					volist.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return volist;
	}

	public int addressInsert(String user_id, String postcode, String basic_address, String detail_address,
			Connection conn) {
		int result = -1;

		String sql = "INSERT INTO ADDRESS VALUES(ADDRESS_SEQ.NEXTVAL,? , ? , ?, ?, 0 )";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, postcode);
			pstmt.setString(3, basic_address);
			pstmt.setString(4, detail_address);
			result = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteInsert(String user_id, String postcode, String basic_address, String detail_address,
			Connection conn) {
		int result = -1;
		
		String sql = "DELETE ADDRESS WHERE USER_ID = ? AND POSTCODE = ? AND BASIC_ADDRESS = ? AND DETAIL_ADDRESS = ?";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, postcode);
			pstmt.setString(3, basic_address);
			pstmt.setString(4, detail_address);
			result = pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
