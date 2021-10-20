package woorigym.user.controller;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;

import woorigym.user.model.vo.OrderDetailTable;


public class OrderDetailService {

	public OrderDetailService() {
	}
	public OrderDetailTable OrderDetailList(String order_no) {
		Connection conn = getConnection();
		OrderDetailTable volist = (OrderDetailTable) new OrderDetailDao().OrderDetailList(conn, order_no);
		close(conn);
		return volist;
	}
}
