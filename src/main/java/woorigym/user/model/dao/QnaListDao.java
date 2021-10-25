package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.admin.model.vo.QnaTable;
public class QnaListDao {
//	private String q_no;
//	private String user_id;
//	private String q_category;
//	private String q_title;
//	private String q_content;
//	private String q_ask_date;
//	private String q_answer;
//	private String q_answer_date;
	public QnaListDao() {
	}
	public ArrayList<QnaTable> myQnaList(Connection conn, String uid){
		System.out.println("uid : "+uid);
		ArrayList<QnaTable> volist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select q_no, q_category, user_id, q_title, q_content, ";
		sql += " q_ask_date, q_answer, q_answer_date from qna where user_id= ?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rset = pstmt.executeQuery();
			volist =  new ArrayList<QnaTable>();
			if(rset.next()) {
				do {
					QnaTable vo =  new QnaTable();
					vo.setQ_no(rset.getString("q_no"));//문의번호
					vo.setUser_id(uid);
					vo.setQ_category(rset.getString("q_category"));
					vo.setQ_title(rset.getString("q_title"));//문의제목
					vo.setQ_content(rset.getString("q_content"));//문의내용
					vo.setQ_ask_date(rset.getString("q_ask_date"));//문의일자
					vo.setQ_answer(rset.getString("q_answer"));//문의답변
					vo.setQ_answer_date(rset.getString("q_answer_date"));//답변일자
					volist.add(vo);
				}while(rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		System.out.println("volist 리턴: "+ volist);
		return volist;
	}
}
