package woorigym.admin.model.vo;

import java.sql.Date;

public class ProductOutTable {
	private int out_no; // 출고 번호
	private String order_detail_no; // 주문 상세 번호
	private int out_quantity; // 출고량
	private Date out_date; // 출고 날짜
	
	// out_no              NUMBER
	// order_detail_no     VARCHAR2(50)
	// out_quantitu        NUMBER
	// out_date            Date
	
	public ProductOutTable() {
		// TODO Auto-generated constructor stub
	}

	public ProductOutTable(int out_no, String order_detail_no, int out_quantity, Date out_date) {
		super();
		this.out_no = out_no;
		this.order_detail_no = order_detail_no;
		this.out_quantity = out_quantity;
		this.out_date = out_date;
	}

	@Override
	public String toString() {
		return "ProductOutTable [out_no=" + out_no + ", order_detail_no=" + order_detail_no + ", out_quantity="
				+ out_quantity + ", out_date=" + out_date + "]";
	}

	public int getOut_no() {
		return out_no;
	}

	public void setOut_no(int out_no) {
		this.out_no = out_no;
	}

	public String getOrder_detail_no() {
		return order_detail_no;
	}

	public void setOrder_detail_no(String order_detail_no) {
		this.order_detail_no = order_detail_no;
	}

	public int getOut_quantity() {
		return out_quantity;
	}

	public void setOut_quantity(int out_quantity) {
		this.out_quantity = out_quantity;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
}
