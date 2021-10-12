package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.CouponTable;

public class CouponDao {

	public CouponDao() {
	}
	public ArrayList<CouponTable> couponListAll(Connection conn, String uid){
		System.out.println("uid: "+uid);
		ArrayList<CouponTable> volist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "Select c_name, c_discount, c_issue_date, c_expire_date"; 
				sql += " from coupon";
				sql += " where user_id=? and c_use = 0";
				//TODO: and c_expire_date가 오늘 이후(오늘 포함)날짜
				
//				private String coupon_no;
//				private String user_id;
//				private String c_name;
//				private int c_discount;
//				private String c_issue_date;
//				private String c_expire_date;
//				private int c_use;
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, uid);
					rset = pstmt.executeQuery();
					volist = new ArrayList<CouponTable>();
					if(rset.next()) {
						do {
							CouponTable vo = new CouponTable();
							vo.setC_name(rset.getString("c_name"));//쿠폰이름
							vo.setC_discount(rset.getInt("c_discount"));//쿠폰금액
							vo.setC_issue_date(rset.getString("c_issue_date"));//쿠폰발행일
							vo.setC_expire_date(rset.getString("c_expire_date"));//쿠폰만료일
							volist.add(vo);
						} while (rset.next());
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally  {
					try {
						close(rset);
						close(pstmt);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				System.out.println("(쿠폰 DAO)volist 리턴");
				return volist;
	}
}
