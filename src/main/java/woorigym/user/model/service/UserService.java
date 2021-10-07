package woorigym.user.model.service;

import java.sql.Connection;

import woorigym.common.jdbcTemplate;
import woorigym.user.model.dao.UserDao;

public class UserService {

	public UserService() {
		// TODO Auto-generated constructor stub
	}
	public int Login(String user_id, String user_pwd) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().login(conn, user_id, user_pwd);
		jdbcTemplate.close(conn);
		
		return result;
		
	}

}
