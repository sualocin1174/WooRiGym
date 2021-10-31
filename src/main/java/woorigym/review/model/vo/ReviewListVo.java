package woorigym.review.model.vo;

public class ReviewListVo {

	private int rNo;
	private String orderDetailNo;
	private String rContent;
	private String rWritedate;
	private int score;
	private String rImg;
	private String product_name;
	private String order_no;


	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	

	@Override
	public String toString() {
		return "ReviewListVo [rNo=" + rNo + ", orderDetailNo=" + orderDetailNo + ", rContent=" + rContent
				+ ", rWritedate=" + rWritedate + ", score=" + score + ", rImg=" + rImg + ", product_name="
				+ product_name + ", order_no=" + order_no + ", getProduct_name()=" + getProduct_name()
				+ ", getOrder_no()=" + getOrder_no() + ", getrNo()=" + getrNo() + ", getOrderDetailNo()="
				+ getOrderDetailNo() + ", getrContent()=" + getrContent() + ", getrWritedate()=" + getrWritedate()
				+ ", getScore()=" + getScore() + ", getrImg()=" + getrImg() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
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
	
	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}


}
