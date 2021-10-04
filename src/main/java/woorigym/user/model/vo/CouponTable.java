package woorigym.user.model.vo;



//COUPON_NO     NOT NULL VARCHAR2(50) 
//USER_ID       NOT NULL VARCHAR2(30) 
//C_NAME        NOT NULL VARCHAR2(30) 
//C_DISCOUNT    NOT NULL NUMBER       
//C_ISSUE_DATE  NOT NULL DATE         
//C_EXPIRE_DATE NOT NULL DATE         
//C_USE                  NUMBER      
public class CouponTable {

	private String coupon_no;
	private String user_id;
	private String c_name;
	private int c_discount;
	private String c_issue_date;
	private String c_expire_date;
	private int c_use;
	
	
	public String getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_discount() {
		return c_discount;
	}
	public void setC_discount(int c_discount) {
		this.c_discount = c_discount;
	}
	public String getC_issue_date() {
		return c_issue_date;
	}
	public void setC_issue_date(String c_issue_date) {
		this.c_issue_date = c_issue_date;
	}
	public String getC_expire_date() {
		return c_expire_date;
	}
	public void setC_expire_date(String c_expire_date) {
		this.c_expire_date = c_expire_date;
	}
	public int getC_use() {
		return c_use;
	}
	public void setC_use(int c_use) {
		this.c_use = c_use;
	}
	@Override
	public String toString() {
		return "CouponTable [coupon_no=" + coupon_no + ", user_id=" + user_id + ", c_name=" + c_name + ", c_discount="
				+ c_discount + ", c_issue_date=" + c_issue_date + ", c_expire_date=" + c_expire_date + ", c_use="
				+ c_use + "]";
	}
	
	
	
	

	
}
