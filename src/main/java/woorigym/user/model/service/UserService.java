package woorigym.user.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	// 아이디중복체크
	public int dupidChk(String user_id) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().dupidChk(conn, user_id);
		jdbcTemplate.close(conn);
		return result; 
	}
	
	// 아이디 찾기 기능
	public String findId(String user_name, String phone) {
		Connection conn = jdbcTemplate.getConnection();
		String user_id = new UserDao().findId(conn, user_name, phone);
		jdbcTemplate.close(conn);
		return user_id;
	}
	
	// 비밀번호 찾기 기능
	public String findPwd(String user_id, String email) {
		Connection conn = jdbcTemplate.getConnection();
		String user_pwd = new UserDao().findId(conn, user_id, email);
		jdbcTemplate.close(conn);
		return user_pwd;
	}
}
