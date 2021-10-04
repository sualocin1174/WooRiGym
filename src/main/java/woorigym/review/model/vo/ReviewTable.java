package woorigym.review.model.vo;

//CREATE TABLE "REVIEW" (
//		"R_NO"	NUMBER		NOT NULL,
//		"ORDER_DETAIL_NO"	VARCHAR2(50)		NOT NULL,
//		"R_CONTENT"	VARCHAR2(500)		NULL,
//		"R_WRITEDATE"	DATE		NULL,
//		"SCORE"	NUMBER		NULL
//	);

public class ReviewTable {
	private int rNo;
	private String orderDetailNo;
	private String rContent;
	private String rWritedate;
	private int score;

	public static void main(String[] args) {
	}

	@Override
	public String toString() {
		return "ReviewTable [rNo=" + rNo + ", orderDetailNo=" + orderDetailNo + ", rContent=" + rContent
				+ ", rWritedate=" + rWritedate + ", score=" + score + "]";
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(String orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrWritedate() {
		return rWritedate;
	}

	public void setrWritedate(String rWritedate) {
		this.rWritedate = rWritedate;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	

}
