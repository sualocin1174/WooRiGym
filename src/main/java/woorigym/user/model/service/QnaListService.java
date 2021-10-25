package woorigym.user.model.service;
import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.vo.QnaTable;
import woorigym.user.model.dao.QnaListDao;
public class QnaListService {

	public QnaListService() {
	}
	
	public ArrayList<QnaTable> myQnaList(String uid){
		Connection conn = getConnection();
		ArrayList<QnaTable> volist  = new QnaListDao().myQnaList(conn, uid);
		close(conn);
		return volist;
	}
}
