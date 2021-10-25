package woorigym.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.OrderInfoTable;
import woorigym.common.jdbcTemplate;

public class OrderInfoDao {

	public OrderInfoDao() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<OrderInfoTable> salesList(Connection conn, String start_date, String end_date){
		ArrayList<OrderInfoTable> saleslist = null;
		String sql = "SELECT ORDER_PAYMENT FROM ORDERINFO WHERE to_char(ORDER_DATE, 'yyyy-mm-dd') BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start_date);
			pstmt.setString(2, end_date);
			rset = pstmt.executeQuery();
			System.out.println("orderinfo-1");
			
			if(rset.next()) {
				saleslist = new ArrayList<OrderInfoTable>();
				System.out.println("orderinfo-2");
				do {
					OrderInfoTable orderinfoVo = new OrderInfoTable();
					orderinfoVo.setOrder_payment(rset.getInt("order_payment"));
					saleslist.add(orderinfoVo);
					System.out.println("orderinfo-3");
				} while(rset.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("orderinfo-4");
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("orderinfo 리턴은 : " + saleslist);
		return saleslist;
	}
}
