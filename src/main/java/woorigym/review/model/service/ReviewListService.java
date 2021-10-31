package woorigym.review.model.service;

import static woorigym.common.jdbcTemplate.close;
import static woorigym.common.jdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.review.model.dao.ReviewListDao;
import woorigym.review.model.vo.ReviewListVo;

public class ReviewListService {

	public ReviewListService() {
	}
	
	public ArrayList<ReviewListVo> myReviewList(String uid){
		Connection conn = getConnection();
		ArrayList<ReviewListVo> volist = new ReviewListDao().myReviewList(conn, uid);
		close(conn);
		return volist;
	}
}
