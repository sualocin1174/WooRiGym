package woorigym.user.model.service;

import java.sql.Connection;

import static woorigym.common.jdbcTemplate.*;
import woorigym.user.model.dao.MypageDao;
import woorigym.user.model.vo.UserTable;

public class MypageService {

	public MypageService() {}
	
	//UserTable 객체를 받아오는 메소드
	public UserTable mypageMain(String user_id){
		UserTable u = null;
		Connection conn = getConnection();
		u = new MypageDao().mypageMain(conn, user_id);
		close(conn);
		return u;
	}

}
