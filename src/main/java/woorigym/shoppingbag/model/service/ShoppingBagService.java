package woorigym.shoppingbag.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.shoppingbag.model.dao.ShoppingBagDao;
import woorigym.shoppingbag.model.vo.CartTable;

public class ShoppingBagService {
	public ArrayList<CartTable> ShoppingBagList(String userId, int start, int end) {
		ArrayList<CartTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		volist = new ShoppingBagDao().ShoppingBagList(conn, userId, start, end);
		jdbcTemplate.close(conn);
		return volist;
	}

	public int getShoppingBagListCount(String userId) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		result = new ShoppingBagDao().getShoppingBagListCount(conn, userId);
		jdbcTemplate.close(conn);
		return result;
	}
	
	
	// TODO
	// 장바구니 체크박스 선택 및 해제 update .. 체크박스를 체크하면 cartNo를 알 수 있어야하고 조건값 일치할때 다른 쿼리문 적용해야
	public int selectCheckBoxUpdateCartList(int cartNo) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		result = new ShoppingBagDao().selectCheckBoxUpdateCartList(conn, cartNo);
		jdbcTemplate.close(conn);
		return result;
	}

	// TODO
	// 장바구니 선택삭제 .. 체크박스를 체크하면 cartNo를 알 수 있어야함?
	public int selectDeleteCartList(int cartNo) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		result = new ShoppingBagDao().selectDeleteCartList(conn, cartNo);
		jdbcTemplate.close(conn);
		return result;
	}

	// 장바구니 전체삭제
	public int allDeleteCartList(String userId) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		result = new ShoppingBagDao().allDeleteCartList(conn, userId);
		jdbcTemplate.close(conn);
		return result;
	}

	// 장바구니 담기
	public int putCartList(String userId, String productNo, int cart_quantity) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		result = new ShoppingBagDao().putCartList(conn, userId, productNo, cart_quantity);
		jdbcTemplate.close(conn);
		return result;
	}

	// 상품 개별 배송비
	public ArrayList<CartTable> orderCost(String userId) {
		ArrayList<CartTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		volist = new ShoppingBagDao().orderCost(conn, userId);
		jdbcTemplate.close(conn);
		return volist;
	}

	// 장바구니 내역 리스트
	public ArrayList<CartTable> cartList(String userId) {
		ArrayList<CartTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		volist = new ShoppingBagDao().cartList(conn, userId);
		jdbcTemplate.close(conn);
		return volist;
	}

}
