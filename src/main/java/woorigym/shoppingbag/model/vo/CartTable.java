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
	// 2021.10.13 1차 내용추가시작
	private String productName;
	private String productOption;
	private int price;
	// 2021.10.13 1차 내용추가완료

	public static void main(String[] args) {
	}

	// 2021.10.13 1차 내용수정시작
	@Override
	public String toString() {
		return "CartTable [cartNo=" + cartNo + ", userId=" + userId + ", productNo=" + productNo + ", cartQuantity="
				+ cartQuantity + ", checked=" + checked + ", productName=" + productName + ", productOption="
				+ productOption + ", price=" + price + "]";
	}
	// 2021.10.13 1차 내용수정완료



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

	// 2021.10.13 1차 내용추가시작
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductOption() {
		return productOption;
	}

	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	// 2021.10.13 1차 내용추가완료
}
