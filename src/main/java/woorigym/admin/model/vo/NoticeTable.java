package woorigym.admin.model.vo;
import java.sql.Date;

public class NoticeTable {
	private int notice_no; // 공지사항 번호
	private String n_title; // 제목
	private String n_content; // 내용
	private Date n_date; // 작성일
	
	// notice_no    NUMBER
	// n_title      VARCHAR2(300)
	// n_content    VARCHAR2(4000)
	// n_date       DATE
	
	public NoticeTable() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeTable(int notice_no, String n_title, String n_content, Date n_date) {
		super();
		this.notice_no = notice_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
	}

	@Override
	public String toString() {
		return "NoticeTable [notice_no=" + notice_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date="
				+ n_date + "]";
	}
	
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
}
