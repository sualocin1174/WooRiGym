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
		 String sql = "select claim.*, product_no, buy_quantity, order_total, order_cost, order_date, arrive_date from claim\r\n" + 
		 		" join order_detail odetail on odetail.order_detail_no = claim.order_detail_no\r\n" + 
		 		" join orderinfo on orderinfo.order_no = odetail.order_no\r\n" + 
		 		" where user_id = ? and orderinfo.order_no=?";
		 
		 PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			CerDetailVo vo = new CerDetailVo();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, ono);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					vo.setOrder_detail_no(rset.getString("order_detail_no"));
					vo.setClaim_date(rset.getString("claim_date"));
					vo.setClaim_kind(rset.getString("claim_kind"));
					vo.setClaim_process(rset.getString("claim_process"));
					vo.setDone_date(rset.getString("done_date"));
					vo.setProduct_no(rset.getString("product_no"));
					vo.setBuy_quantity(rset.getInt("buy_quantity"));
					vo.setOrder_total(rset.getInt("order_total"));
					vo.setOrder_cost(rset.getInt("order_cost"));
					vo.setOrder_date(rset.getString("order_date"));
					vo.setArrive_date(rset.getString("arrive_date"));
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
