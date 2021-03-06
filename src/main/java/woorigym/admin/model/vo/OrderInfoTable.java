package woorigym.admin.model.vo;

public class OrderInfoTable {
	private String order_no;
	private String user_id;
	private int address_no;
	private String order_memo;
	private int order_total;
	private int order_cost;
	private int point_discount;
	private int coupon_discount;
	private int order_payment;
	private int order_method;
	private String order_date;
	private String pay_state;
	private String order_state;
	private String arrive_date;
	private int add_mileage;
	private String receiver_name;
	private String phone_no;
	
//			"ORDER_NO"	VARCHAR2(50)		NOT NULL,
//			"USER_ID"	VARCHAR2(30)		NOT NULL,
//			"ADDRESS_NO"	NUMBER		NOT NULL,
//			"ORDER_MEMO"	VARCHAR2(100)		NULL,
//			"ORDER_TOTAL"	NUMBER		NOT NULL,
//			"ORDER_COST"	NUMBER		NULL,
//			"POINT_DISCOUNT"	NUMBER		NULL,
//			"COUPON_DISCOUNT"	NUMBER		NULL,
//			"ORDER_PAYMENT"	NUMBER		NOT NULL,
//			"ORDER_METHOD"	NUMBER		NOT NULL,
//			"ORDER_DATE"	DATE		NOT NULL,
//			"PAY_STATE"	VARCHAR2(30)		NOT NULL,
//			"ORDER_STATE"	VARCHAR2(30)		NOT NULL,
//			"ARRIVE_DATE"	DATE		NULL,
//			"ADD_MILEAGE"	NUMBER		NULL,
//			"RECEIVER_NAME"      VARCHAR2(100)      NULL,
//			"PHONE_NO"	VARCHAR2(20)      NULL

	public OrderInfoTable() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "OrderInfoTable [order_no=" + order_no + ", user_id=" + user_id + ", address_no=" + address_no
				+ ", order_memo=" + order_memo + ", order_total=" + order_total + ", order_cost=" + order_cost
				+ ", point_discount=" + point_discount + ", coupon_discount=" + coupon_discount + ", order_payment="
				+ order_payment + ", order_method=" + order_method + ", order_date=" + order_date + ", pay_state="
				+ pay_state + ", order_state=" + order_state + ", arrive_date=" + arrive_date + ", add_mileage="
				+ add_mileage + ", receiver_name=" + receiver_name + ", phone_no=" + phone_no + "]";
	}
	
	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getAddress_no() {
		return address_no;
	}

	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
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

	public int getPoint_discount() {
		return point_discount;
	}

	public void setPoint_discount(int point_discount) {
		this.point_discount = point_discount;
	}

	public int getCoupon_discount() {
		return coupon_discount;
	}

	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}

	public int getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(int order_payment) {
		this.order_payment = order_payment;
	}

	public int getOrder_method() {
		return order_method;
	}

	public void setOrder_method(int order_method) {
		this.order_method = order_method;
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

	public String getArrive_date() {
		return arrive_date;
	}

	public void setArrive_date(String arrive_date) {
		this.arrive_date = arrive_date;
	}

	public int getAdd_mileage() {
		return add_mileage;
	}

	public void setAdd_mileage(int add_mileage) {
		this.add_mileage = add_mileage;
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
