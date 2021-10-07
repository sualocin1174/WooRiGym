package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import woorigym.common.*;
import woorigym.user.model.vo.UserTable;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}
	public int login(Connection conn, String user_id, String user_pwd) {
		int result = 0; // 로그인 실패 : 0
		String sql ="select user_pwd from member where user_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("로그인 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				if(rset.getString(1).equals(user_pwd)) {
					System.out.println("성공");
					return 1; // 로그인 성공
				}
				else {
					System.out.println("비밀번호 불일치");
					return 0; //비밀번호 불일치
				}
			}
			System.out.println("아이디 없음");
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return -2; //데이터 베이스 오류
	}
	
	public int userInsert(Connection conn, UserTable user) {
		int result = 0;
		String sql ="insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		return result;
	}

}
