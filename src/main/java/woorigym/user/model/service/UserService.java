package woorigym.user.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.user.model.dao.UserDao;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.UserTable;

public class UserService {

	public UserService() {
	}
	// 로그인
	public UserTable Login(String user_id, String user_pwd) {
		Connection conn = jdbcTemplate.getConnection();
		UserTable vo = new UserDao().login(conn, user_id, user_pwd);
		jdbcTemplate.close(conn);
		return vo;
	}
	// 회원가입
	public int userInsert(UserTable user) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().userInsert(conn, user);
		jdbcTemplate.close(conn);
		return result;
	}
	// 주소지 입력
	public int adressInsert(AddressTable address) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().adressInsert(conn, address);
		jdbcTemplate.close(conn);
		return result;
	}
	
	// 아이디 중복
	public int dupidChk(String user_id) {
		Connection conn = jdbcTemplate.getConnection();
		int result = new UserDao().dupidChk(conn, user_id);
		jdbcTemplate.close(conn);
		return result; 
	}
	
	// 아이디 찾기
	public String findId(String user_name, String phone) {
		Connection conn = jdbcTemplate.getConnection();
		String user_id = new UserDao().findId(conn, user_name, phone);
		jdbcTemplate.close(conn);
		return user_id;
	}
	
	// 비밀번호 찾기
	public String findPwd(String user_id, String email) {
		Connection conn = jdbcTemplate.getConnection();
		String user_pwd = new UserDao().findPwd(conn, user_id, email);
		jdbcTemplate.close(conn);
		return user_pwd;
	}
	
//	public int userInfo(String user_id) {
//		Connection conn = jdbcTemplate.getConnection();
//		int result = new UserDao().userInfo(conn, user_id);
//		return result; //데이터 베이스 에러
//	}
	
//	public ArrayList<UserTable> userInfo(String user_id) {
//		Connection conn = jdbcTemplate.getConnection();
//		ArrayList<UserTable> volist = new UserDao().userInfo(conn, user_id);
//		
//		 return volist;
//	}
	
}
