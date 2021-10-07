package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.user.model.dao.OrderListDao;
import woorigym.user.model.vo.OrderTable;

public class OrderListService {

	public OrderListService() {
	}
	public ArrayList<OrderTable> readOrderListAll(String user_id) {
		Connection conn = jdbcTemplate.getConnection();
		ArrayList<OrderTable> result = (ArrayList<OrderTable>) new OrderListDao().readOrderListAll(conn, user_id);
		jdbcTemplate.close(conn);
		
		return result;
	}
}
