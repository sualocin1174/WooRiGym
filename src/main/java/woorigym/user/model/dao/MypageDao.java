package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static woorigym.common.jdbcTemplate.*;
import woorigym.user.model.vo.UserTable;

public class MypageDao {

	public MypageDao() {}
	// 매개변수로 받은 ID로 DB 접속하여 일치하는 데이터 조회
	public UserTable mypageMain(Connection conn, String user_id) {
		System.out.println(user_id);
		
		UserTable vo = null;
		//마이페이지: 쿠폰, 적립금, 주문배송조회, 취소교환환불 조회, 최근본상품
		String sql = "select * from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id); //첫번째 ?에 user_id값 대입
			rset = pstmt.executeQuery();
			if(rset.next()) {// 첫 열은 head 컬럼이므로 next() 로 실제 컬럼값을 가져온다.
				vo = new UserTable();
				vo.setUser_id(rset.getString("user_id"));// 받아온 ID 컬럼 값을 member변수에 대입
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
