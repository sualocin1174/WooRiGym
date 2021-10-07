package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;
import woorigym.user.model.vo.UserTable;

public class MypageDao {

	public MypageDao() {}
	
	public UserTable mypageMain(Connection conn, String user_id, String user_name) {
		UserTable vo = null;
		String sql = "select user_name from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				vo.setUser_id(rset.getString(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
}
