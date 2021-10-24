package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.UserTable;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}
	public UserTable login(Connection conn, String user_id, String user_pwd) {
		String sql ="select * from member where user_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("로그인 dao 진입");
		UserTable vo = null;   // 실패시 null 을 return
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				if(rset.getString("user_pwd").equals(user_pwd)) {
					vo = new UserTable();
					vo.setUser_id(rset.getString("user_id"));
					vo.setUser_pwd(rset.getString("user_pwd"));
					vo.setUser_name(rset.getString("user_name"));
					vo.setEmail(rset.getString("email"));
					vo.setEmail_yn(rset.getInt("email_yn"));
					vo.setPhone(rset.getString("phone"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return vo; 
	}
	public int adminLogin(Connection conn, String admin_id, String admin_pwd) {
		String sql ="select admin_pwd from admin where admin_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		System.out.println("관리자 로그인 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				if(rset.getString("admin_pwd").equals(admin_pwd)) {
					System.out.println("관리자 로그인 성공");
					result = 1;
				} else {
					System.out.println("관리자 로그인 실패");
					result = 0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result; 
	}
	
	public int dupidChk(Connection conn, String user_id) {
		int result = 0;
		String sql = "select count(*) from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("중복체크 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("return result: "+result);
		return result; 
	}
	// 회원가입 dao
	public int userInsert(Connection conn, UserTable user) {
		int result = 0;
		String tempDate = "2021/05/31";
//		String sql ="insert into member values(?, ?, ?, ?, ?, ?, to_date('"+tempDate+"','yyyy/mm/dd'), ?, to_date(? ,'yyyy/mm/dd'), ?, ?)";
		String sql ="insert into member values(?, ?, ?, ?, ?, ?, to_char(sysdate, 'yyyy/mm/dd'), ?, to_date(? ,'yyyy/mm/dd'), ?, ?)";
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
			
			
			result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println("회원가입 성공");
			}
			else {
				System.out.println("회원가입 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result; 
	}
	// 주소지 입력 dao
	public int adressInsert(Connection conn, AddressTable address) {
		int result = 0;
		String sql ="insert into address values(ADDRESS_SEQ.NEXTVAL,?,?,?,?,1)";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		System.out.println("주소지 입력 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address.getUser_id());
			pstmt.setString(2, address.getPostcode());
			pstmt.setString(3, address.getBasic_address());
			pstmt.setString(4, address.getDetail_address());
			
			
			
			result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println("주소지 입력 성공");
			}
			else {
				System.out.println("주소지 입력 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result; 
	}
	// 회원정보 수정
	public int updateUser(Connection conn, UserTable user) {
		String sql ="update member set phone=?, email=?, email_yn=?, user_pwd=? where user_id =?";
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("회원정보수정 dao 진입");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getPhone());
			pstmt.setString(2, user.getEmail());
			pstmt.setInt(3, user.getEmail_yn());
			pstmt.setString(4, user.getUser_pwd());
			pstmt.setString(5, user.getUser_id());
			result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println("회원 정보 수정완료");
			} else {
				System.out.println("회원 정보 수정실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result; 
	}
	// 아이디 찾기
	public String findId(Connection conn, String user_name, String phone) {
		String sql = "select user_id from member where user_name = ? and phone = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String user_id = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, phone);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				user_id = rset.getString("user_id");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return user_id;
	}
	// 비밀번호 찾기
	public String findPwd(Connection conn, String user_id, String email) {
		String sql = "select user_pwd from member where user_id = ? and email = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String user_pwd = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				user_pwd = rset.getString("user_pwd");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return user_pwd;
	}
}
