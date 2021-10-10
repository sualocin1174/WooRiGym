package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;
import woorigym.user.model.dao.OrderListDao;
import woorigym.user.model.vo.OrderList;
import woorigym.user.model.vo.OrderTable;

public class OrderListService {

	public OrderListService() {
	}
	public ArrayList<OrderTable> readOrderListAll(String uid) {
		Connection conn = getConnection();
		ArrayList<OrderTable> volist = (ArrayList<OrderTable>) new OrderListDao().readOrderListAll(conn, uid);
		close(conn);
		
		return volist;
	}
	public ArrayList<OrderList> readOrderListPeriod(String uid, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<OrderList> volist = (ArrayList<OrderList>) new OrderListDao().readOrderListPeriod(conn, uid, startDate, endDate);
		close(conn);
		
		return volist;
	}
}
