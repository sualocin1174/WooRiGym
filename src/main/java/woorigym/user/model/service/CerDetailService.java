package woorigym.user.model.service;
import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;

import woorigym.user.model.dao.CerDetailDao;
import woorigym.user.model.vo.CerDetailVo;

public class CerDetailService {

	public CerDetailService() {
	}
	 public CerDetailVo CerDetail(String uid, String ono) {
		 CerDetailVo u = null;
		 Connection conn = getConnection();
			u = new CerDetailDao().CerDetail(conn, uid , ono);
			close(conn);
			return u;
	 }
	
}
