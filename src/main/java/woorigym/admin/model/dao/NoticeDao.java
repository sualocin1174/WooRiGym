package woorigym.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.NoticeTable;
import woorigym.common.jdbcTemplate;

public class NoticeDao {

	public NoticeDao() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<NoticeTable> readNoticeListAll(Connection conn){
		ArrayList<NoticeTable> volist = null;
		String sql = "SELECT * FROM NOTICE";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			System.out.println("notice-1");
			
			if(rset.next()) {
				volist = new ArrayList<NoticeTable>();
				System.out.println("notice-2");
				do {
					NoticeTable vo = new NoticeTable();
					vo.setNotice_no(rset.getInt("notice_no"));
					vo.setN_title(rset.getString("n_title"));
					vo.setN_content(rset.getString("n_content"));
					vo.setN_date(rset.getDate("n_date"));
					volist.add(vo);
					System.out.println("notice-3");
				} while(rset.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("notice-4");
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("notice 리턴은" + volist);
		return volist;
	}
	
	public int addProduct(Connection conn, NoticeTable vo) {
		int result = -1;
		String sqlInsert = "INSERT INTO"
				+ " NOTICE"
				+ " (NOTICE_NO, N_TITLE, N_CONTENT, N_DATE)"
				+ " VALUES (?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setInt(1, vo.getNotice_no());
			pstmt.setString(2, vo.getN_title());
			pstmt.setString(3, vo.getN_content());
			pstmt.setDate(4, vo.getN_date());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateProduct(Connection conn, NoticeTable vo) {
		int result = -1;
		String sqlUpdate = "UPDATE PRODUCT SET (N_TITLE=?, N_CONTENT=?) WHERE NOTICE_NO=?"; 
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, vo.getN_title());
			pstmt.setString(2, vo.getN_content());
			pstmt.setInt(3, vo.getNotice_no());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn, String notice_no) {
		int result = -1;
		String sqlDelete = "DELETE FROM NOTICE WHERE NOTICE_NO=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setString(1, notice_no);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
}
