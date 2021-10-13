package woorigym.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.dao.NoticeDao;
import woorigym.admin.model.vo.NoticeTable;
import woorigym.common.jdbcTemplate;

public class NoticeService {

	public NoticeService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<NoticeTable> NoticeListAll(){
		ArrayList<NoticeTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		volist = new NoticeDao().NoticeListAll(conn);
		
		jdbcTemplate.close(conn);
		return volist;
	}
}
