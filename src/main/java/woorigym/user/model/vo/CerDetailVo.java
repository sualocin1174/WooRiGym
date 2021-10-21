package woorigym.user.model.vo;

public class CerDetailVo {
//	select claim.*, product_no, buy_quantity, order_total, order_cost, order_date, arrive_date from claim
//	join order_detail odetail on odetail.order_detail_no = claim.order_detail_no
//	join orderinfo on orderinfo.order_no = odetail.order_no
//	where user_id='gym11';
	public CerDetailVo() {
	}
		private String order_detail_no;
		private String claim_date;
		private String claim_kind;
		private String claim_process;
		private String done_date;
		private String product_no;
		private int buy_quantity;
		private int order_total;
		private int order_cost;
		private String order_date;
		private String arrive_date;
		
		@Override
		public String toString() {
			return "CerDetailVo [order_detail_no=" + order_detail_no + ", claim_date=" + claim_date + ", claim_kind="
					+ claim_kind + ", claim_process=" + claim_process + ", done_date=" + done_date + ", product_no="
					+ product_no + ", buy_quantity=" + buy_quantity + ", order_total=" + order_total + ", order_cost="
					+ order_cost + ", order_date=" + order_date + ", arrive_date=" + arrive_date
					+ ", getOrder_detail_no()=" + getOrder_detail_no() + ", getClaim_date()=" + getClaim_date()
					+ ", getClaim_kind()=" + getClaim_kind() + ", getClaim_process()=" + getClaim_process()
					+ ", getDone_date()=" + getDone_date() + ", getProduct_no()=" + getProduct_no()
					+ ", getBuy_quantity()=" + getBuy_quantity() + ", getOrder_total()=" + getOrder_total()
					+ ", getOrder_cost()=" + getOrder_cost() + ", getOrder_date()=" + getOrder_date()
					+ ", getArrive_date()=" + getArrive_date() + ", getClass()=" + getClass() + ", hashCode()="
					+ hashCode() + ", toString()=" + super.toString() + "]";
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
		public String getProduct_no() {
			return product_no;
		}
		public void setProduct_no(String product_no) {
			this.product_no = product_no;
		}
		public int getBuy_quantity() {
			return buy_quantity;
		}
		public void setBuy_quantity(int buy_quantity) {
			this.buy_quantity = buy_quantity;
		}
		public int getOrder_total() {
			return order_total;
		}
		public void setOrder_total(int order_total) {
			this.order_total = order_total;
		}
		public int getOrder_cost() {
			return order_cost;
		}
		public void setOrder_cost(int order_cost) {
			this.order_cost = order_cost;
		}
		public String getOrder_date() {
			return order_date;
		}
		public void setOrder_date(String order_date) {
			this.order_date = order_date;
		}
		public String getArrive_date() {
			return arrive_date;
		}
		public void setArrive_date(String arrive_date) {
			this.arrive_date = arrive_date;
		}
		
}
