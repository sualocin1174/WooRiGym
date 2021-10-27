package woorigym.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import woorigym.admin.model.vo.QnaTable;
import woorigym.common.jdbcTemplate;
import static woorigym.common.jdbcTemplate.*;

public class QnaWriteDao {

	public QnaWriteDao() {
	}
	public void QnaWrite(Connection conn, String user_id, QnaTable vo) {//테이블에 넣을 값
		PreparedStatement pstmt = null;
		String sql ="insert into qna (q_no,user_id,q_category,q_title,q_content,q_ask_date) "
				+ " values (qna_seq.nextval, ?,?, ?,?, sysdate)\r\n" ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			pstmt.setString(2, vo.getQ_category());
			pstmt.setString(3, vo.getQ_title());
			pstmt.setString(4, vo.getQ_content());
			pstmt.execute(); //executeUpdate도 가능(몇건 성공했는지 알려줌). 
			//excute는 boolean값으로 성공여부를 알려줌
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	}
}
