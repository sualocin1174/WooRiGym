package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.user.model.dao.MypageDao;
import woorigym.user.model.vo.UserTable;

public class MypageService {

	public MypageService() {}
	
	public ArrayList<UserTable> mypageMain(String user_id){
		ArrayList<UserTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
//		volist = new MypageDao().mypageMain(conn);
		jdbcTemplate.close(conn);
		return volist;
	}

}
