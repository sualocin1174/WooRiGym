package woorigym.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.admin.model.dao.NoticeDao;
import woorigym.admin.model.vo.NoticeTable;
import woorigym.common.jdbcTemplate;

public class NoticeService {

	public NoticeService() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<NoticeTable> NoticeListAll(){
		ArrayList<NoticeTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		volist = new NoticeDao().NoticeListAll(conn);
		
		jdbcTemplate.close(conn);
		return volist;
	}
	
	public int addNotice(NoticeTable noticeVo) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
	
		result = new NoticeDao().addNotice(conn, noticeVo);
		jdbcTemplate.close(conn);
		
		return result;
	}
	
	public int deleteNotice(int notice_no) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		
		result = new NoticeDao().deleteNotice(conn, notice_no);
		jdbcTemplate.close(conn);
		
		return result;
	}
	
	public int updateNotice(NoticeTable noticeVo) {
		int result = -1;
		Connection conn = jdbcTemplate.getConnection();
		
		result = new NoticeDao().updateNotice(conn, noticeVo);
		jdbcTemplate.close(conn);
		
		return result;
	}
	
	public int checkDuplicatedNotice(int notice_no) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		
		result = new NoticeDao().checkDuplicatedNotice(conn, notice_no);
		jdbcTemplate.close(conn);
		
		return result;
	}
	
	public ArrayList<NoticeTable> selectNotice(int notice_no){
		ArrayList<NoticeTable> noticelist = null;
		Connection conn = jdbcTemplate.getConnection();
		
		noticelist = new NoticeDao().selectNotice(conn, notice_no);
		
		jdbcTemplate.close(conn);
		return noticelist;
	}
	
	public ArrayList<NoticeTable> selectNoticeBoard(int start, int end){
		ArrayList<NoticeTable> volist = null;
		Connection conn = jdbcTemplate.getConnection();

		volist = new NoticeDao().selectNoticeBoard(conn, start, end);
		
		jdbcTemplate.close(conn);
		return volist;
	}
}
