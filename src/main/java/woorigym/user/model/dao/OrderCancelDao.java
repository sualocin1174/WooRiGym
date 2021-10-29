package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderCancelDao {

	public OrderCancelDao() {
	}
	
	public void cancelOrder(Connection conn, String uid, String order_no) {
		
		PreparedStatement pstmt = null;
		String sql = "update orderinfo set order_state = '주문취소' "
				+ "where user_id=? and order_no= ?  ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, order_no);
			pstmt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	}
}
