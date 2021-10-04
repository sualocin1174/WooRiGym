package woorigym.admin.model.vo;

import java.sql.Date;

public class ProductInTable {
	private int in_no; // 입고 번호
	private String product_no; // 상품 번호
	private int in_quantity; // 입고량
	private Date in_date; // 입고 날짜
	
	// in_no         NUMBER
	// product_no    VARCHAR2(30)
	// in_quantity   NUMBER
	// in_date       DATE
	
	public ProductInTable() {
		// TODO Auto-generated constructor stub
	}

	public ProductInTable(int in_no, String product_no, int in_quantity, Date in_date) {
		super();
		this.in_no = in_no;
		this.product_no = product_no;
		this.in_quantity = in_quantity;
		this.in_date = in_date;
	}
	
	@Override
	public String toString() {
		return "ProductInTable [in_no=" + in_no + ", product_no=" + product_no + ", in_quantity=" + in_quantity
				+ ", in_date=" + in_date + "]";
	}	
	
	public int getIn_no() {
		return in_no;
	}

	public void setIn_no(int in_no) {
		this.in_no = in_no;
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public int getIn_quantity() {
		return in_quantity;
	}

	public void setIn_quantity(int in_quantity) {
		this.in_quantity = in_quantity;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
}
