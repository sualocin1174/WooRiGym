package woorigym.review.model.service;

import java.sql.Connection;
import static woorigym.common.jdbcTemplate.*;

import woorigym.review.model.dao.ReviewWriteDao;
import woorigym.review.model.vo.ReviewListVo;

public class ReviewWriteService {

	public ReviewWriteService() {
	}
	public void reviewWrite(ReviewListVo vo) {
		Connection conn =getConnection();
		new ReviewWriteDao().reviewWrite(conn,vo);
		close(conn);
	}
}
