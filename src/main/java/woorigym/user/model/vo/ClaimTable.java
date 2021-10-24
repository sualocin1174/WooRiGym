package woorigym.user.model.vo;

public class ClaimTable {
//	ORDER_NO NOT NULL VARCHAR2(50)  
//	CLAIM_DATE      NOT NULL DATE          
//	CLAIM_KIND      NOT NULL VARCHAR2(30)  
//	CLAIM_PROCESS            VARCHAR2(30)  
//	DONE_DATE                DATE          
//	ADDRESS_NO               NUMBER        
//	REQUEST_MEMO             VARCHAR2(100) 
//	RETURN_DATE              DATE   
//	RETURN_COST              NUMBER    
	public ClaimTable() {
	}
	private String order_no;
		private String claim_date;
		private String claim_kind;
		private int address_no;
		private String request_memo;
		private String return_date;
		private int return_cost;
		private String claim_process;
		private String done_date;
		private int why;
		
		public int getWhy() {
			return why;
		}
		public void setWhy(int why) {
			this.why = why;
		}
		@Override
		public String toString() {
			return "ClaimTable [order_no=" + order_no + ", claim_date=" + claim_date + ", claim_kind=" + claim_kind
					+ ", address_no=" + address_no + ", request_memo=" + request_memo + ", return_date=" + return_date
					+ ", return_cost=" + return_cost + ", claim_process=" + claim_process + ", done_date=" + done_date
					+ ", why=" + why + ", getOrder_no()=" + getOrder_no() + ", getClaim_date()=" + getClaim_date()
					+ ", getClaim_kind()=" + getClaim_kind() + ", getAddress_no()=" + getAddress_no()
					+ ", getRequest_memo()=" + getRequest_memo() + ", getReturn_date()=" + getReturn_date()
					+ ", getReturn_cost()=" + getReturn_cost() + ", getClaim_process()=" + getClaim_process()
					+ ", getDone_date()=" + getDone_date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
					+ ", toString()=" + super.toString() + "]";
		}
		public String getOrder_no() {
			return order_no;
		}
		public void setOrder_no(String order_no) {
			this.order_no = order_no;
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
		public int getAddress_no() {
			return address_no;
		}
		public void setAddress_no(int address_no) {
			this.address_no = address_no;
		}
		public String getRequest_memo() {
			return request_memo;
		}
		public void setRequest_memo(String request_memo) {
			this.request_memo = request_memo;
		}
		public String getReturn_date() {
			return return_date;
		}
		public void setReturn_date(String return_date) {
			this.return_date = return_date;
		}
		public int getReturn_cost() {
			return return_cost;
		}
		public void setReturn_cost(int return_cost) {
			this.return_cost = return_cost;
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
