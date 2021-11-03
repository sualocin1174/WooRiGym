package woorigym.review.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import woorigym.review.model.vo.ReviewListVo;

public class ReviewWriteDao {

	public ReviewWriteDao() {
	}
	public void reviewWrite(Connection conn, ReviewListVo vo) {
		System.out.println("vo : "+vo);
		 PreparedStatement pstmt1 = null;
		 PreparedStatement pstmt2= null;
		 String sql = " insert into review (r_no,order_detail_no,r_content, r_writedate, score)"
		 		+ " values(review_seq.nextval,?, ?, sysdate, ?) ";
		 
		 String query = " insert into review_img (r_no, r_img) values (review_seq.currval, ?)";
		 
		 try {
			 pstmt1 = conn.prepareStatement(sql);
			 pstmt1.setString(1, vo.getOrderDetailNo());
			 pstmt1.setString(2, vo.getrContent());
			 pstmt1.setInt(3,vo.getScore());
			 pstmt1.execute();
		 } catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					close(pstmt1);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		 
		 
		 try {
			 pstmt2 = conn.prepareStatement(query);
			 pstmt2.setString(1,vo.getrImg());
			 pstmt2.execute();
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 try {
				 close(pstmt2);
			 }catch(Exception e){
				 e.printStackTrace();
			 }
		 }
	}
}
