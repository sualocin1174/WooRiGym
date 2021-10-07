package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.OrderTable;

public class OrderListDao {

	public OrderListDao() {
	}
//	  <!-- 주문번호 -->
//  <!-- 날짜 시간 yyyy.mm-dd hh:mm-->
//  상품이미지, 상품명, 수량, 가격, 배송비(기본 2,500원, 5만원 이상 무배)
	public ArrayList<OrderTable> readOrderListAll(Connection conn, String user_id){
		ArrayList<OrderTable> volist = null;
//		ArrayList<OrderDetailTable> olist = null; //상품번호, 수량은 주문상세내역 테이블에..
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM ORDERINFO WHERE USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			volist = new ArrayList<OrderTable>();
			if(rset.next()) {
				do {
					OrderTable vo = new OrderTable();
					vo.setOrder_no(rset.getString("order_no")); //주문번호
					vo.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					vo.setOrder_total(rset.getInt("order_cost")); //배송비
					vo.setOrder_date(rset.getString("order_date")); //주문일자
					vo.setPay_state(rset.getString("pay_state")); //결제상태
					vo.setOrder_state(rset.getString("order_state")); //배송상태
					volist.add(vo);
				} while(rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return volist;
	}
}

