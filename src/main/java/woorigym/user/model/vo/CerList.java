package woorigym.user.model.vo;

public class CerList {// 10/20 추가 - 실제테이블 추가가 아닌 결과화면을 위한 vo 추가생성!
//	SELECT oinfo.order_no,order_total,order_cost,order_date,claim_process, 
//	  odetail.product_no, buy_quantity, 
//	  product.product_name, product.PRODUCT_INFO_URL
//	FROM ORDERINFO oinfo 
//	  join order_detail odetail on oinfo.order_no = odetail.order_no
//	  join product product on odetail.PRODUCT_NO = product.PRODUCT_NO
//	  join claim claim on odetail.order_detail_no = claim.order_detail_no
//	WHERE 
//	  USER_ID = 'gym11' 
//	  and order_date between to_date('2021/08/01', 'yyyy/mm/dd') and sysdate;
	private String order_no;
	private int order_total;
	private int order_cost;
	private String order_date;
	//private String pay_state; 
	//private String order_state;
	private String product_no;
	private int buy_quantity;
	private String product_name;
	private String product_info_url;
	
	//ClaimTable
	//private String order_detail_no;
	//private String claim_date;
	//private String claim_kind;
	private String claim_process;
	//private String done_date;
	
	public CerList() {
	}

	@Override
	public String toString() {
		return "CerList [order_no=" + order_no + ", order_total=" + order_total + ", order_cost=" + order_cost
				+ ", order_date=" + order_date + ", product_no=" + product_no + ", buy_quantity=" + buy_quantity
				+ ", product_name=" + product_name + ", product_info_url=" + product_info_url + ", claim_process="
				+ claim_process + ", getOrder_no()=" + getOrder_no() + ", getOrder_total()=" + getOrder_total()
				+ ", getOrder_cost()=" + getOrder_cost() + ", getOrder_date()=" + getOrder_date() + ", getProduct_no()="
				+ getProduct_no() + ", getBuy_quantity()=" + getBuy_quantity() + ", getProduct_name()="
				+ getProduct_name() + ", getProduct_info_url()=" + getProduct_info_url() + ", getClaim_process()="
				+ getClaim_process() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}



	public String getOrder_no() {
		return order_no;
	}



	public void setOrder_no(String order_no) {
		this.order_no = order_no;
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



	public String getProduct_name() {
		return product_name;
	}



	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	public String getProduct_info_url() {
		return product_info_url;
	}



	public void setProduct_info_url(String product_info_url) {
		this.product_info_url = product_info_url;
	}



	public String getClaim_process() {
		return claim_process;
	}



	public void setClaim_process(String claim_process) {
		this.claim_process = claim_process;
	}

}
