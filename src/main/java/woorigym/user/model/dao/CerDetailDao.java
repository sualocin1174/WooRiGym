package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import woorigym.user.model.vo.CerDetailVo;

public class CerDetailDao {

	public CerDetailDao() {
	}

	 public CerDetailVo CerDetail(Connection conn, String uid, String ono) {
		 String sql = "select claim.*, product_no, buy_quantity, order_total, order_cost, order_method, order_date, arrive_date from claim\r\n" + 
		 		" join orderinfo oinfo on oinfo.order_no = claim.order_no\r\n" + 
		 		" join order_detail odetail on oinfo.order_no = odetail.order_no\r\n" + 
		 		" where user_id = ? and oinfo.order_no=?";
		 
		 PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			CerDetailVo vo = new CerDetailVo();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, ono);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					vo.setOrder_no(rset.getString("order_no"));//주문상세번호
					vo.setClaim_date(rset.getString("claim_date"));//신청일자
					vo.setClaim_kind(rset.getString("claim_kind"));//분류
					vo.setClaim_process(rset.getString("claim_process"));//처리상태
					vo.setDone_date(rset.getString("done_date"));//처리일자
					vo.setProduct_no(rset.getString("product_no"));//상품번호
					vo.setBuy_quantity(rset.getInt("buy_quantity"));//수량
					vo.setOrder_total(rset.getInt("order_total"));//상품금액
					vo.setOrder_cost(rset.getInt("order_cost"));//배송비
					vo.setOrder_method(rset.getInt("order_method"));//결제수단
					vo.setOrder_date(rset.getString("order_date"));//주문일자
					vo.setArrive_date(rset.getString("arrive_date"));//도착일자
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	finally {
				try {
					close(rset);
					close(pstmt);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			return vo;
	 }
}
