package woorigym.user.model.service;

import java.sql.Connection;


import woorigym.common.jdbcTemplate;
import woorigym.user.model.dao.UserDao;
import woorigym.user.model.vo.UserTable;

public class UserService {

	public UserService() {
	}
	public int Login(String user_id, String user_pwd) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().login(conn, user_id, user_pwd);
		jdbcTemplate.close(conn);
		
		return result;
	}
	
	public int userInsert(UserTable user) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().userInsert(conn, user);
		jdbcTemplate.close(conn);
		return result;
	}
	
	public int dupidChk(Connection conn, String user_id) {
		int result = new UserDao().dupidChk(conn, user_id);
		jdbcTemplate.close(conn);
		return result; 
	}
}
