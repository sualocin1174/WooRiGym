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
	public OrderDetailTable() {	}
	
	
	@Override
	public String toString() {
		return "OrderDetailTable [order_detail_no=" + order_detail_no + ", order_no=" + order_no + ", product_no="
				+ product_no + ", buy_quantity=" + buy_quantity + "]";
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
	public int getBuy_quantity() {
		return buy_quantity;
	}
	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

}
