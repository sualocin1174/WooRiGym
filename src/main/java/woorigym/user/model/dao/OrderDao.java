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

		String sql = "SELECT POSTCODE, BASIC_ADDRESS, DETAIL_ADDRESS, FIXED_ADDRESS, ADDRESS_NO FROM ADDRESS WHERE USER_ID = ? ORDER BY FIXED_ADDRESS DESC";

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
					vo.setAddress_no(Integer.toString(rs.getInt(5)));
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

		String sql = "SELECT * FROM COUPON WHERE USER_ID=? AND C_USE = 0 AND c_expire_date > SYSDATE";

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
					vo.setCoupon_no(rs.getString(1));
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
			// close(pstmt);
		}

		sql = "SELECT address_no FROM ADDRESS WHERE USER_ID=? AND postcode=? and basic_address=? and detail_address=? ORDER BY address_no desc";
		pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, postcode);
			pstmt.setString(3, basic_address);
			pstmt.setString(4, detail_address);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
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

	public int insertOrderinfo(String user_id, int address_no, String order_memo, int order_total, int order_cost,
			int point_discount, int coupon_discount, int order_payment, int order_method, String pay_state,
			int add_mileage, Connection conn) {
		int result = -1;

		String sql = "insert into ORDERINFO values ('GYM'||to_char(sysdate, 'yyyymmdd')||ORDER_SEQ.nextval, ? , ? , ? , ? , ? ,? ,? ,? ,? ,sysdate , ?,'배송전',null, ? )";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, address_no);
			pstmt.setString(3, order_memo);
			pstmt.setInt(4, order_total);
			pstmt.setInt(5, order_cost);
			pstmt.setInt(6, point_discount);
			pstmt.setInt(7, coupon_discount);
			pstmt.setInt(8, order_payment);
			pstmt.setInt(9, order_method);
			pstmt.setString(10, pay_state);
			pstmt.setInt(11, add_mileage);

			result = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int UpdateCoupon(String coupon_no, String user_id, Connection conn) {
		int result = -1;

		String sql = "UPDATE COUPON SET C_USE = 1 WHERE COUPON_NO = ? AND USER_ID = ?";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, coupon_no);
			pstmt.setString(2, user_id);
			result = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int usedMileage(String userid, int used_mile, Connection conn) {
		int result = -1;
		String sql = "UPDATE MEMBER SET MILEAGE = (MILEAGE-?) WHERE USER_ID = ?";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, used_mile);
			pstmt.setString(2, userid);
			result = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

}// class
