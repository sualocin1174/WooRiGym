package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import woorigym.common.*;
import woorigym.user.model.vo.UserTable;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}
	public int login(Connection conn, String user_id, String user_pwd) {
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
					System.out.println("로그인 성공");
					return 1; // 로그인 성공
				}
				else {
					System.out.println("비밀번호 불일치");
					return 0; //비밀번호 불일치
				}
			}
			System.out.println("아이디가 존재하지 않습니다");
			return -1; //아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return -2; //데이터 베이스 에러
	}
	
	public int userInsert(Connection conn, UserTable user) {
		int result = 0;
//TODO
		String tempDate = "2021/05/31";
		String sql ="insert into member values(?, ?, ?, ?, ?, ?, to_date('"+tempDate+"','yyyy/mm/dd'), ?, to_date(? ,'yyyy/mm/dd'), ?, ?)";
//		String sql ="insert into user values(?, ?, ?, ?, ?, ?, sysdate, ?, to_date(? ,'yyyy/mm/dd'), ?, ?)";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("회원가입 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pwd());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getEmail());
			pstmt.setInt(5, user.getEmail_yn());
			pstmt.setString(6, user.getPhone());
			pstmt.setInt(7, user.getMileage());
			pstmt.setString(8, user.getBirthday());
			pstmt.setString(9, user.getIdentity_number());
			pstmt.setInt(10, user.getGender());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("데이터 베이스 오류");
		return result; // 데이터베이스 오류
	}

}
