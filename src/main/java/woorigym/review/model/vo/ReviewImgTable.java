package woorigym.review.model.vo;

//CREATE TABLE "REVIEW_IMG" (
//		"R_NO"	NUMBER		NOT NULL,
//		"R_IMG"	VARCHAR2(100)		NULL
//	);

public class ReviewImgTable {
	private int rNo;
	private String rImg;

	public static void main(String[] args) {
	}

	@Override
	public String toString() {
		return "ReviewImgTable [rNo=" + rNo + ", rImg=" + rImg + "]";
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrImg() {
		return rImg;
	}

	public void setrImg(String rImg) {
		this.rImg = rImg;
	}

}
