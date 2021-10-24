package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.CerList;


public class CerListDao {

	public CerListDao() {
	}
	public ArrayList<CerList> readCerListPeriod(Connection conn, String uid, String startDate ,String endDate){
		System.out.println("uid : "+uid);
		System.out.println("startDate: "+startDate);
		System.out.println("endDate: "+endDate);
		ArrayList<CerList> volist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT oinfo.order_no,order_total,order_cost,order_date,claim_process, ";
		query += " odetail.product_no, buy_quantity, ";
		query += " product.product_name, product.PRODUCT_INFO_URL";
		query += " from ORDERINFO oinfo";
		//inner join: 데이터가 있을 때만 조인됨.
		query += " join order_detail odetail on oinfo.order_no = odetail.order_no";
		query += " join product product on odetail.PRODUCT_NO = product.PRODUCT_NO";
		query += " join claim claim on oinfo.order_no = claim.order_no";
		query += " WHERE ";
		query += " USER_ID = ?";
		query += " and order_date between to_date(?, 'yyyy-mm-dd') and to_date(?, 'yyyy-mm-dd')";
//		private String order_no;
//		private int order_total;
//		private int order_cost;
//		private String order_date;
//		private String product_no;
//		private int buy_quantity;
//		private String product_name;
//		private String product_info_url;
//		private String claim_process;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rset = pstmt.executeQuery();
			volist = new ArrayList<CerList>();
			if(rset.next()) {
				do {
					CerList vo = new CerList();
					vo.setOrder_no(rset.getString("order_no")); //주문번호
					vo.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					vo.setOrder_cost(rset.getInt("order_cost")); //배송비
					vo.setOrder_date(rset.getString("order_date")); //주문일자
					vo.setProduct_no(rset.getString("product_no")); //상품번호
					vo.setBuy_quantity(rset.getInt("buy_quantity")); //구매수량
					vo.setProduct_name(rset.getString("product_name")); //상품명
					vo.setProduct_info_url(rset.getString("product_info_url")); //상품이미지url
					vo.setClaim_process(rset.getString("claim_process")); //처리상태
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
		System.out.println("volist 리턴: "+ volist);
		return volist;
	}
	public int getCerCount(Connection conn, String uid) { //페이징
		int result = 0;
		//TODO: 쿼리문 수정
		String sql = "select count(order_no) from orderinfo where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid); //보낼 값
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				result = rset.getInt(1);//1=인덱스 (별칭 필요X)
				System.out.println("2: "+result);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("1: "+result);
		return result;
	}
	
	public ArrayList<CerList> selectCerList(Connection conn, String uid, int start, int end) {
		String sql = "select *	from (select ROWNUM r, t1.* " + 
				" FROM (" + 
				"SELECT oinfo.order_no,order_total,order_cost,to_char(order_date, 'yyyy-mm-dd hh:mm') order_date,claim_process," + 
				"    odetail.product_no, buy_quantity, " + 
				"    product.product_name, product.PRODUCT_INFO_URL " + 
				" FROM ORDERINFO oinfo " + 
				"    join order_detail odetail on oinfo.order_no = odetail.order_no" + 
				"    join claim claim on oinfo.order_no = claim.order_no" +
				"    join product product on odetail.PRODUCT_NO = product.PRODUCT_NO" + 
				" WHERE " + 
				"    USER_ID = ? order by order_date desc )" + 
				" t1) t2 " + 
				" where r between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		////ArrayList<OrderList> volist = null;
System.out.println(start);
System.out.println(end);
ArrayList<CerList> volist = new ArrayList<CerList>();
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				do {
					CerList vo = new CerList();
					vo.setOrder_no(rset.getString("order_no")); //주문번호
					vo.setOrder_total(rset.getInt("order_total")); //가격(할인전)
					vo.setOrder_cost(rset.getInt("order_cost")); //배송비
					vo.setOrder_date(rset.getString("order_date")); //주문일자
					vo.setProduct_no(rset.getString("product_no")); //상품번호
					vo.setBuy_quantity(rset.getInt("buy_quantity")); //구매수량
					vo.setProduct_name(rset.getString("product_name")); //상품명
					vo.setProduct_info_url(rset.getString("product_info_url")); //상품이미지url
					vo.setClaim_process(rset.getString("claim_process")); //처리상태
					System.out.println(vo.getClaim_process());
					volist.add(vo);
				} while(rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		System.out.println("페이징 volist 리턴: "+ volist);
		return volist;
	}
}
