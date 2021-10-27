package woorigym.user.model.service;
import static woorigym.common.jdbcTemplate.*;
import java.sql.Connection;

import woorigym.admin.model.vo.QnaTable;
import woorigym.user.model.dao.QnaWriteDao;

public class QnaWriteService {

	public QnaWriteService() {
	}
	public void QnaWrite(String user_id, QnaTable vo) {
		Connection conn =getConnection();
		new QnaWriteDao().QnaWrite(conn, user_id, vo);
		close(conn);
	}

}
