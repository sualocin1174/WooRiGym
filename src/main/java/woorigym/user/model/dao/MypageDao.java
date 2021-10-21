package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;

import woorigym.user.model.vo.MyCoupon;
import woorigym.user.model.vo.MyDeliveryVo;
import woorigym.user.model.vo.UserTable;

public class MypageDao {

	public MypageDao() {}
	
	public MyCoupon mypageCoupon(Connection conn, String user_id) {
		MyCoupon vo = new MyCoupon();
		String sql = "select  max(have_coupon) as have_coupon, max(goodbye_coupon) as goodbye_coupon, max(have_mileage) as have_mileage\r\n" + 
				" from(\r\n" + 
				" select count(*) as have_coupon,0 as goodbye_coupon,0 as have_mileage from coupon where c_expire_date >= sysdate and c_use=0 and user_id=?\r\n" + 
				" union all\r\n" + 
				" select 0 as have_coupon, count(*) as goodbye_coupon, 0 as have_mileage from coupon \r\n" + 
				" where c_expire_date >= sysdate and c_use=0 and user_id=? and c_expire_date <= sysdate+14\r\n" + 
				" union all\r\n" + 
				" select 0 as have_coupon,  0 as goodbye_coupon, sum(add_mileage) as have_mileage from orderinfo where user_id=?\r\n" + 
				" )"; //물음표 3개인게 귀찮으면 user_id를 따로 빼도 된다(대신 오래걸림)
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			pstmt.setString(2,user_id);
			pstmt.setString(3,user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				vo = new MyCoupon();
				vo.setHave_coupon(rset.getInt("have_coupon"));
				vo.setGoodbye_coupon(rset.getInt("goodbye_coupon"));
				vo.setHave_mileage(rset.getInt("have_mileage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	public MyDeliveryVo mydelivery(Connection conn, String user_id)  {
		MyDeliveryVo vo = new MyDeliveryVo();
		String sql ="select sum(order_complete) as order_complete, sum(order_ready) as order_ready, sum(order_ing) as order_ing, sum(order_arrive) as order_arrive from\r\n" + 
				"		(select CASE WHEN order_state='주문완료' then 1 end as order_complete, case when order_state = '배송준비중' then 1 end as order_ready, case when order_state='배송중' then 1 end as order_ing "
				+"  ,case when order_state='배송완료' then 1 end as order_arrive\r\n" + 
				"		from orderinfo where user_id=? )";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				vo.setOrder_complete(rset.getInt("order_complete"));
				vo.setOrder_ready(rset.getInt("order_ready"));
				vo.setOrder_ing(rset.getInt("order_ing"));
				vo.setOrder_arrive(rset.getInt("order_arrive"));
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				close(rset);
				close(pstmt);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}

	public MyCerlistVo mycer(Connection conn, String user_id) {
		MyCerlistVo vo = new MyCerlistVo();
		String sql = "select sum(order_cancel) as order_cancel, sum(order_change) as order_change, sum(order_refund) as order_refund from\r\n" + 
				"	(select case when claim_kind ='취소' then 1 else 0 end as order_cancel, case when claim_kind='교환' then 1 else 0 end as order_change, case when claim_kind='환불' then 1 else 0 end as order_refund\r\n" + 
				"	from claim \r\n" + 
				"	join order_detail odetail on odetail.order_detail_no = claim.order_detail_no\r\n" + 
				"	join orderinfo on orderinfo.order_no = odetail.order_no\r\n" + 
				"	where user_id=?)";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				vo.setOrder_cancel(rset.getInt("order_cancel"));
				vo.setOrder_change(rset.getInt("order_change"));
				vo.setOrder_refund(rset.getInt("order_refund"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	
	// 매개변수로 받은 ID로 DB 접속하여 일치하는 데이터 조회
	public UserTable mypageMain(Connection conn, String user_id) {
		System.out.println(user_id);
		
		UserTable vo = null;
		//마이페이지: 쿠폰, 적립금, 주문배송조회, 취소교환환불 조회, 최근본상품
		String sql = "select * from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id); //첫번째 ?에 user_id값 대입
			rset = pstmt.executeQuery();
			if(rset.next()) {// 첫 열은 head 컬럼이므로 next() 로 실제 컬럼값을 가져온다.
				vo = new UserTable();
				vo.setUser_id(rset.getString("user_id"));// 받아온 ID 컬럼 값을 member변수에 대입
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
}
