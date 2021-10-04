package woorigym.shoppingbag.model.vo;

//CREATE TABLE "CART" (
//		"CART_NO"	NUMBER		NOT NULL,
//		"USER_ID"	VARCHAR2(30)		NOT NULL,
//		"PRODUCT_NO"	VARCHAR2(30)		NOT NULL,
//		"CART_QUANTITY"	NUMBER		NOT NULL,
//		"CHECKED"	NUMBER		NOT NULL
//	);

public class CartTable {
	private int cartNo;
	private String userId;
	private String productNo;
	private int cartQuantity;
	private int checked;

	public static void main(String[] args) {
	}

	@Override
	public String toString() {
		return "CartTable [cartNo=" + cartNo + ", userId=" + userId + ", productNo=" + productNo + ", cartQuantity="
				+ cartQuantity + ", checked=" + checked + "]";
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	

}
