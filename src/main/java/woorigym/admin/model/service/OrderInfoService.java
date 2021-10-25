package woorigym.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.dao.OrderInfoDao;
import woorigym.admin.model.vo.OrderInfoTable;
import woorigym.common.jdbcTemplate;

public class OrderInfoService {

	public OrderInfoService() {
	}

	
	public ArrayList<OrderInfoTable> salesList(String startDate, String endDate){
		Connection conn = jdbcTemplate.getConnection();
		ArrayList<OrderInfoTable> saleslist = new OrderInfoDao().salesList(conn, startDate, endDate);
		
		jdbcTemplate.close(conn);;
		return saleslist;
	}
}
