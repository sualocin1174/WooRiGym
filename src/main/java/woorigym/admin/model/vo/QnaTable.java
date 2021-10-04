package woorigym.admin.model.vo;

public class QnaTable {
	private String q_no;
	private String user_id;
	private String q_category;
	private String q_title;
	private String q_content;
	private String q_ask_date;
	private String q_answer;
	private String q_answer_date;
	
	public QnaTable() {
		// TODO Auto-generated constructor stub
	}

	public String getQ_no() {
		return q_no;
	}

	public void setQ_no(String q_no) {
		this.q_no = q_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_ask_date() {
		return q_ask_date;
	}

	public void setQ_ask_date(String q_ask_date) {
		this.q_ask_date = q_ask_date;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public String getQ_answer_date() {
		return q_answer_date;
	}

	public void setQ_answer_date(String q_answer_date) {
		this.q_answer_date = q_answer_date;
	}

	@Override
	public String toString() {
		return "QnaTable [q_no=" + q_no + ", user_id=" + user_id + ", q_category=" + q_category + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", q_ask_date=" + q_ask_date + ", q_answer=" + q_answer
				+ ", q_answer_date=" + q_answer_date + "]";
	}

}