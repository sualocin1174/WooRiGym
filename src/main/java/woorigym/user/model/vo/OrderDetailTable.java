package woorigym.user.model.vo;

//주문상세내역 order_detail
//--------------- -------- ------------ 
//ORDER_DETAIL_NO NOT NULL VARCHAR2(50) 
//ORDER_NO        NOT NULL VARCHAR2(50) 
//PRODUCT_NO      NOT NULL VARCHAR2(30) 
//BUY_QUANTITY             NUMBER       

public class OrderDetailTable { 
	private String order_detail_no;
	private String order_no;
	private String product_no;
	private int buy_quantity;
	
	// 10/18 추가: 주문상세보기 화면에 필요한 내용(product, address테이블과 조인)
//	SELECT oinfo.order_no,order_total,order_cost, to_char(order_date, 'yyyy-mm-dd hh:mm') order_date,pay_state,order_state, 
//    odetail.product_no, buy_quantity
//		,  product.product_name, product.PRODUCT_INFO_URL,
//       coupon_discount, add_mileage, point_discount, (coupon_discount+point_discount) discount_all, (order_total-(coupon_discount+point_discount)+order_cost) total_pay
//   ,postcode, basic_address, detail_address
//	 FROM ORDERINFO oinfo
//	join order_detail odetail on oinfo.order_no = odetail.order_no
//		join product product on odetail.PRODUCT_NO = product.PRODUCT_NO
//       join address on oinfo.address_no = address.address_no
//		 WHERE 
//	 oinfo.order_no = 'GYM2021090101';
	private int order_total;
	private int order_cost;
	private String order_date;
	private String pay_state;
	private String order_state;
	private String product_name;
	private String product_info_url;
	private int coupon_discount;
	private int add_mileage;
	private int point_discount;
	private int discount_all;
	private int total_pay;
	private String postcode;
	private String basic_address;
	private String detail_address;
	private String receiver_name; //10/18 추가
	private String phone_no;
	
	public OrderDetailTable() {	}

	@Override
	public String toString() {
		return "OrderDetailTable [order_detail_no=" + order_detail_no + ", order_no=" + order_no + ", product_no="
				+ product_no + ", buy_quantity=" + buy_quantity + ", order_total=" + order_total + ", order_cost="
				+ order_cost + ", order_date=" + order_date + ", pay_state=" + pay_state + ", order_state="
				+ order_state + ", product_name=" + product_name + ", product_info_url=" + product_info_url
				+ ", coupon_discount=" + coupon_discount + ", add_mileage=" + add_mileage + ", point_discount="
				+ point_discount + ", discount_all=" + discount_all + ", total_pay=" + total_pay + ", postcode="
				+ postcode + ", basic_address=" + basic_address + ", detail_address=" + detail_address
				+ ", receiver_name=" + receiver_name + ", phone_no=" + phone_no + ", getOrder_detail_no()="
				+ getOrder_detail_no() + ", getOrder_no()=" + getOrder_no() + ", getProduct_no()=" + getProduct_no()
				+ ", getOrder_total()=" + getOrder_total() + ", getOrder_cost()=" + getOrder_cost()
				+ ", getOrder_date()=" + getOrder_date() + ", getPay_state()=" + getPay_state() + ", getOrder_state()="
				+ getOrder_state() + ", getBuy_quantity()=" + getBuy_quantity() + ", getProduct_name()="
				+ getProduct_name() + ", getProduct_info_url()=" + getProduct_info_url() + ", getCoupon_discount()="
				+ getCoupon_discount() + ", getAdd_mileage()=" + getAdd_mileage() + ", getPoint_discount()="
				+ getPoint_discount() + ", getDiscount_all()=" + getDiscount_all() + ", getTotal_pay()="
				+ getTotal_pay() + ", getPostcode()=" + getPostcode() + ", getBasic_address()=" + getBasic_address()
				+ ", getDetail_address()=" + getDetail_address() + ", getReceiver_name()=" + getReceiver_name()
				+ ", getPhone_no()=" + getPhone_no() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}



	public String getOrder_detail_no() {
		return order_detail_no;
	}
	public void setOrder_detail_no(String order_detail_no) {
		this.order_detail_no = order_detail_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
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
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public int getAdd_mileage() {
		return add_mileage;
	}
	public void setAdd_mileage(int add_mileage) {
		this.add_mileage = add_mileage;
	}
	public int getPoint_discount() {
		return point_discount;
	}
	public void setPoint_discount(int point_discount) {
		this.point_discount = point_discount;
	}
	public int getDiscount_all() {
		return discount_all;
	}
	public void setDiscount_all(int discount_all) {
		this.discount_all = discount_all;
	}
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getBasic_address() {
		return basic_address;
	}
	public void setBasic_address(String basic_address) {
		this.basic_address = basic_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}


	public String getReceiver_name() {
		return receiver_name;
	}


	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}


	public String getPhone_no() {
		return phone_no;
	}


	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
}
