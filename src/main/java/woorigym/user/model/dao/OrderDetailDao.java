package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import woorigym.user.model.vo.OrderDetailTable;

import static woorigym.common.jdbcTemplate.*;


public class OrderDetailDao {

	public OrderDetailDao() {
	}

	public OrderDetailTable OrderDetailList(Connection conn, String order_no){
		System.out.println("order_no: "+order_no);
		OrderDetailTable volist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT oinfo.order_no,order_total,order_cost, to_char(order_date, 'yyyy-mm-dd hh:mm'), \r\n" + 
				"				 order_method, order_date,pay_state,order_state,   \r\n" + 
				"				     odetail.product_no, buy_quantity  \r\n" + 
				"						,  product.product_name, product.PRODUCT_INFO_URL,  \r\n" + 
				"				        coupon_discount, add_mileage, point_discount, (coupon_discount+point_discount) discount_all, (order_total-(coupon_discount+point_discount)) total_pay  \r\n" + 
				"				    ,postcode, basic_address, detail_address, receiver_name, phone_no   \r\n" + 
				"					 FROM ORDERINFO oinfo  \r\n" + 
				"					join order_detail odetail on oinfo.order_no = odetail.order_no  \r\n" + 
				"						join product product on odetail.PRODUCT_NO = product.PRODUCT_NO  \r\n" + 
				"				        join address on oinfo.address_no = address.address_no  \r\n" + 
				"						 WHERE   \r\n" + 
				"					 oinfo.order_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, order_no);
			rset = pstmt.executeQuery();
			volist = new OrderDetailTable();
			if(rset.next()) {
				do {
					volist.setOrder_no(rset.getString("order_no")); //주문번호
					volist.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					volist.setOrder_cost(rset.getInt("order_cost")); //배송비
					volist.setOrder_date(rset.getString("order_date")); //주문일자
					volist.setPay_state(rset.getString("pay_state")); //결제상태
					volist.setOrder_state(rset.getString("order_state")); //배송상태
					volist.setProduct_no(rset.getString("product_no")); //상품번호
					volist.setBuy_quantity(rset.getInt("buy_quantity")); //구매수량
					volist.setProduct_name(rset.getString("product_name")); //상품명
					volist.setProduct_info_url(rset.getString("product_info_url")); //상품이미지url
					volist.setCoupon_discount(rset.getInt("coupon_discount")); //쿠폰할인
					volist.setAdd_mileage(rset.getInt("add_mileage")); //구매후적립
					volist.setPoint_discount(rset.getInt("point_discount")); //포인트할인
					volist.setDiscount_all(rset.getInt("discount_all")); //할인금액
					volist.setTotal_pay(rset.getInt("total_pay")); //총결제금액
					volist.setPostcode(rset.getString("postcode")); //우편번호
					volist.setBasic_address(rset.getString("basic_address")); //기본주소
					volist.setDetail_address(rset.getString("detail_address")); //상세주소
					volist.setReceiver_name(rset.getString("receiver_name")); //수령인 이름
					volist.setPhone_no(rset.getString("phone_no")); //폰번호
					volist.setOrder_method(rset.getInt("order_method")); 
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
		System.out.println("volist 리턴: "+ volist);
		return volist;
	}
}
