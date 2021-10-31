package woorigym.review.model.dao;

import static woorigym.common.jdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.QnaTable;
import woorigym.review.model.vo.ReviewListVo;

public class ReviewListDao {

	public ReviewListDao() {
	}
	
	public ArrayList<ReviewListVo> myReviewList(Connection conn, String uid){
		System.out.println("uid : "+uid);
		 ArrayList<ReviewListVo> volist = null;
		 PreparedStatement pstmt = null;
		 ResultSet rset = null; //TODO: 쿼리문 수정
			String sql = "select review.r_no, oinfo.order_no, review.order_detail_no, product_name, user_id, r_content, \r\n" + 
					"	 r_writedate, score, r_img " + 
					"     from review " + 
					"     join order_detail odetail on review.order_detail_no = odetail.order_detail_no " + 
					"     join orderinfo oinfo on odetail.order_no = oinfo.order_no " + 
					"     join review_img on review_img.r_no = review.r_no " + 
					"     join product on product.product_no = odetail.product_no " + 
					"     where user_id=?";
					try { 
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, uid);
						rset = pstmt.executeQuery();
						volist =  new ArrayList<ReviewListVo>();
						if(rset.next()) {
							do {
								ReviewListVo vo =  new ReviewListVo();
								vo.setrNo(rset.getInt("r_no"));
								vo.setOrder_no(rset.getString("order_no"));
								vo.setOrderDetailNo(rset.getString("order_detail_no"));
								vo.setProduct_name(rset.getString("product_name"));
								vo.setrContent(rset.getString("r_content"));
								vo.setrWritedate(rset.getString("r_writedate"));
								vo.setScore(rset.getInt("score"));
								vo.setrImg(rset.getString("r_img"));
								volist.add(vo);
							}while(rset.next());
						}} catch (Exception e) {
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
