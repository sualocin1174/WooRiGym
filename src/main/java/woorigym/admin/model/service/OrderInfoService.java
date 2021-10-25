package woorigym.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.dao.OrderInfoDao;
import woorigym.admin.model.vo.OrderInfoTable;
import woorigym.common.jdbcTemplate;

public class OrderInfoService {

	public OrderInfoService() {
		// TODO Auto-generated constructor stub
	}

	
	public ArrayList<OrderInfoTable> salesList(String start_date, String end_date){
		ArrayList<OrderInfoTable> saleslist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		saleslist = new OrderInfoDao().salesList(conn, start_date, end_date);
		
		jdbcTemplate.close(conn);;
		return saleslist;
	}
}
