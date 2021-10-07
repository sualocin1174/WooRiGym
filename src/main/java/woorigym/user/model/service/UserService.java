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
		System.out.println("회원가입 성공");
		return result;
	}
}
