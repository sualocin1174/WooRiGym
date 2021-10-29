package woorigym.user.model.service;
import static woorigym.common.jdbcTemplate.*;
import java.sql.Connection;

import woorigym.admin.model.vo.QnaTable;
import woorigym.user.model.dao.QnaWriteDao;

public class QnaWriteService {

	public QnaWriteService() {
	}
	public void QnaWrite(String user_id, QnaTable vo) {//vo의 중요성 기억! vo통채로 가져가니까 vo가 수정되어도 상관없다.
		Connection conn =getConnection();
		new QnaWriteDao().QnaWrite(conn, user_id, vo);
		close(conn);
	}

}
