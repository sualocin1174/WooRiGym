package woorigym.user.model.vo;

public class OrderList { // 10/10 추가 - 실제테이블 추가가 아닌 결과화면을 위한 vo 추가생성!
//	SELECT oinfo.order_no,order_total,order_cost,order_date,pay_state,order_state, 
//    odetail.product_no, buy_quantity, 
//    product.product_name, product.PRODUCT_INFO_URL
//FROM ORDERINFO oinfo 
//    join order_detail odetail on oinfo.order_no = odetail.order_no
//    join product product on odetail.PRODUCT_NO = product.PRODUCT_NO
//WHERE 
//    USER_ID = 'gym11' 
//    and order_date between to_date('2021/08/01', 'yyyy/mm/dd') and sysdate;
	private String order_no;
	private int order_total;
	private int order_cost;
	private String order_date;
	private String pay_state; //10/19 추가
	private String order_state;
	private String product_no;
	private int buy_quantity;
	private String product_name;
	private String product_info_url;
	
	public OrderList() {
	}

	@Override
	public String toString() {
		return "OrderList [order_no=" + order_no + ", order_total=" + order_total + ", order_cost=" + order_cost
				+ ", order_date=" + order_date + ", pay_state=" + pay_state + ", order_state=" + order_state
				+ ", product_no=" + product_no + ", buy_quantity=" + buy_quantity + ", product_name=" + product_name
				+ ", product_info_url=" + product_info_url + ", getOrder_no()=" + getOrder_no() + ", getOrder_total()="
				+ getOrder_total() + ", getOrder_cost()=" + getOrder_cost() + ", getOrder_date()=" + getOrder_date()
				+ ", getPay_state()=" + getPay_state() + ", getOrder_state()=" + getOrder_state() + ", getProduct_no()="
				+ getProduct_no() + ", getBuy_quantity()=" + getBuy_quantity() + ", getProduct_name()="
				+ getProduct_name() + ", getProduct_info_url()=" + getProduct_info_url() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
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

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
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
 
}
