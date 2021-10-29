package woorigym.user.model.service;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;

import woorigym.user.model.dao.OrderCancelDao;

public class OrderCancelService {

	public OrderCancelService() {
	}
	public void cancelOrder(String uid, String order_no) {
		Connection conn = getConnection();
		new OrderCancelDao().cancelOrder(conn,uid,order_no);
		close(conn);
		
	}
}
