package woorigym.admin.model.vo;

//import java.sql.Date;

// 취소/교환/환불 CLAIM
//	--------------- -------- ------------ 
//	ORDER_DETAIL_NO NOT NULL VARCHAR2(50) 
//	CLAIM_DATE      NOT NULL DATE         
//	CLAIM_KIND      NOT NULL VARCHAR2(30) 
//	CLAIM_PROCESS            VARCHAR2(30) 
//	DONE_DATE                DATE         
	
public class ClaimTable {
	
	private String order_detail_no;
	private String claim_date;
	private String claim_kind;
	private String claim_process;
	private String done_date;
	
	
	public ClaimTable() {	}


	@Override
	public String toString() {
		return "ClaimTable [order_detail_no=" + order_detail_no + ", claim_date=" + claim_date + ", claim_kind="
				+ claim_kind + ", claim_process=" + claim_process + ", done_date=" + done_date + "]";
	}


	public String getOrder_detail_no() {
		return order_detail_no;
	}


	public void setOrder_detail_no(String order_detail_no) {
		this.order_detail_no = order_detail_no;
	}


	public String getClaim_date() {
		return claim_date;
	}


	public void setClaim_date(String claim_date) {
		this.claim_date = claim_date;
	}


	public String getClaim_kind() {
		return claim_kind;
	}


	public void setClaim_kind(String claim_kind) {
		this.claim_kind = claim_kind;
	}


	public String getClaim_process() {
		return claim_process;
	}


	public void setClaim_process(String claim_process) {
		this.claim_process = claim_process;
	}


	public String getDone_date() {
		return done_date;
	}


	public void setDone_date(String done_date) {
		this.done_date = done_date;
	}


	
	

}
