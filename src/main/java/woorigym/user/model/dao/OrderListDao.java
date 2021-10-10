package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.OrderList;
import woorigym.user.model.vo.OrderTable;

public class OrderListDao {

	public OrderListDao() {
	}
//	  <!-- 주문번호 -->
//  <!-- 날짜 시간 yyyy.mm-dd hh:mm-->
//  상품이미지, 상품명, 수량, 가격, 배송비(기본 2,500원, 5만원 이상 무배)
	public ArrayList<OrderTable> readOrderListAll(Connection conn, String uid){
		System.out.println("uid : "+uid);
		ArrayList<OrderTable> volist = null;
//		ArrayList<OrderDetailTable> olist = null; //상품번호, 수량은 주문상세내역 테이블에..
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT order_no,order_total,order_cost,order_date,order_state FROM ORDERINFO WHERE USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			rset = pstmt.executeQuery();
			volist = new ArrayList<OrderTable>();
			if(rset.next()) {
				do {
					OrderTable vo = new OrderTable();
					vo.setOrder_no(rset.getString("order_no")); //주문번호
					vo.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					vo.setOrder_cost(rset.getInt("order_cost")); //배송비
					vo.setOrder_date(rset.getString("order_date")); //주문일자
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
		System.out.println("volist 리턴");
		return volist;
	}
	
	
	public ArrayList<OrderList> readOrderListPeriod(Connection conn, String uid, String startDate ,String endDate){
		System.out.println("uid : "+uid);
		ArrayList<OrderList> volist = null;
//		ArrayList<OrderDetailTable> olist = null; //상품번호, 수량은 주문상세내역 테이블에..
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT oinfo.order_no,order_total,order_cost, to_char(order_date, 'yyyy/mm/dd hh:mm') order_date,order_state, ";
		query += " odetail.product_no, buy_quantity, ";
		query += " product.product_name, product.PRODUCT_INFO_URL";
		query += " FROM ORDERINFO oinfo ";
		query += " join order_detail odetail on oinfo.order_no = odetail.order_no";
		query += " join product product on odetail.PRODUCT_NO = product.PRODUCT_NO";
		query += " WHERE ";
		query += " USER_ID = ?";
		query += " and order_date between to_date(?, 'yyyy/mm/dd') and to_date(?, 'yyyy/mm/dd')";
//		private String order_no;
//		private int order_total;
//		private int order_cost;
//		private String order_date;
//		private String order_state;
//		private String product_no;
//		private int buy_quantity;
//		private String product_name;
//		private String product_info_url;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rset = pstmt.executeQuery();
			volist = new ArrayList<OrderList>();
			if(rset.next()) {
				do {
					OrderList vo = new OrderList();
					vo.setOrder_no(rset.getString("order_no")); //주문번호
					vo.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					vo.setOrder_cost(rset.getInt("order_cost")); //배송비
					vo.setOrder_date(rset.getString("order_date")); //주문일자
					vo.setOrder_state(rset.getString("order_state")); //배송상태
					vo.setProduct_no(rset.getString("product_no")); //배송상태
					vo.setBuy_quantity(rset.getInt("buy_quantity")); //배송상태
					vo.setProduct_name(rset.getString("product_name")); //배송상태
					vo.setProduct_info_url(rset.getString("product_info_url")); //배송상태
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
		System.out.println("volist 리턴");
		return volist;
	}
}

