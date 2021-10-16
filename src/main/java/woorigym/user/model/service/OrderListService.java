package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;
import woorigym.user.model.dao.OrderListDao;
import woorigym.user.model.vo.OrderList;

public class OrderListService {

	public OrderListService() {
	}
	public ArrayList<OrderList> readOrderListPeriod(String uid, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<OrderList> volist = (ArrayList<OrderList>) new OrderListDao().readOrderListPeriod(conn, uid, startDate, endDate);
		close(conn);
		
		return volist;
	}
	
	public int getOrderCount(String uid){
		int result = 0; //0이든 -1이든 어차피 못 읽어오는거 똑같다. 0,1 둘 다 사용가능!!
		Connection conn = getConnection();
		result = new OrderListDao().getOrderCount(conn,uid); //result = 빼먹어서 result가 0이 되는 바람에 오류났었음.
		close(conn);
		return result;
	}
	
	public ArrayList<OrderList> selectOrderList(String uid, int start, int end){
		ArrayList<OrderList> result = new ArrayList() ; //0이든 -1이든 어차피 못 읽어오는거 똑같다. 0,1 둘 다 사용가능!!
		Connection conn = getConnection();
		result = new OrderListDao().selectOrderList(conn,uid, start, end);
		close(conn);
		return result;
		
	}
}
