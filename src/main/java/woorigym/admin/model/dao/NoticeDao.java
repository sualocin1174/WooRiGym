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

	public ArrayList<NoticeTable> NoticeListAll(Connection conn){
		ArrayList<NoticeTable> volist = null;
		String sql = "SELECT * FROM NOTICE ORDER BY NOTICE_NO ASC";
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
					NoticeTable noticeVo = new NoticeTable();
					noticeVo.setNotice_no(rset.getInt("notice_no"));
					noticeVo.setN_title(rset.getString("n_title"));
					noticeVo.setN_content(rset.getString("n_content"));
					noticeVo.setN_date(rset.getString("n_date"));
					volist.add(noticeVo);
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
	
	public int addNotice(Connection conn, NoticeTable noticeVo) {
		int result = -1;
		String sqlInsert = "INSERT INTO"
				+ " NOTICE"
				+ " VALUES (?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setInt(1, noticeVo.getNotice_no());
			pstmt.setString(2, noticeVo.getN_title());
			pstmt.setString(3, noticeVo.getN_content());
			pstmt.setString(4, noticeVo.getN_date());
			
			result = pstmt.executeUpdate();
			System.out.println("DB 등록이 성공되었습니다.");
		} catch(Exception e) {
			e.printStackTrace();
			//System.out.println("DB 등록이 되지않았습니다.");
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection conn, NoticeTable noticeVo) {
		int result = -1;
		String sqlUpdate = "UPDATE NOTICE SET (N_TITLE=?, N_CONTENT=?) WHERE NOTICE_NO=?"; 
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, noticeVo.getN_title());
			pstmt.setString(2, noticeVo.getN_content());
			pstmt.setInt(3, noticeVo.getNotice_no());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn, int notice_no) {
		int result = -1;
		String sqlDelete = "DELETE FROM NOTICE WHERE NOTICE_NO=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setInt(1, notice_no);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	
	public int checkDuplicatedNotice(Connection conn, NoticeTable noticeVo) {
		int result =-1;
		String sql = "select NOTICE_NO from NOTICE where NOTICE_NO=?";
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeVo.getNotice_no());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;  //  기존 상품이 있으면
			} else {
				result = 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류 발생");
			// 여기 -1
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
}
