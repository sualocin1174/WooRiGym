package woorigym.product.model.vo;

//CREATE TABLE "PRODUCT" (
//		"PRODUCT_NO"	VARCHAR2(30)		NOT NULL,
//		"PRODUCT_NAME"	VARCHAR2(300)		NOT NULL,
//		"PARENT_CATEGORY"	VARCHAR2(50)		NOT NULL,
//		"CHILD_CATEGORY"	VARCHAR2(50)		NULL,
//		"QUANTITY"	NUMBER		NULL,
//		"PRICE"	NUMBER		NULL,
//		"PRODUCT_INFO_URL"	VARCHAR2(500)		NULL,
//		"PRODUCT_OPTION"	VARCHAR2(100)		NULL
//	);

public class ProductTable {
	private String productNo;
	private String productName;
	private String parentCategory;
	private String childCategory;
	private int quantity;
	private int price;
	private String productInfoUrl;
	private String productOption;
	
	

	public String getProductNo() {
		return productNo;
	}



	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getParentCategory() {
		return parentCategory;
	}



	public void setParentCategory(String parentCategory) {
		this.parentCategory = parentCategory;
	}



	public String getChildCategory() {
		return childCategory;
	}



	public void setChildCategory(String childCategory) {
		this.childCategory = childCategory;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getProductInfoUrl() {
		return productInfoUrl;
	}



	public void setProductInfoUrl(String productInfoUrl) {
		this.productInfoUrl = productInfoUrl;
	}



	public String getProductOption() {
		return productOption;
	}



	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}



	@Override
	public String toString() {
		return "ProductTable [productNo=" + productNo + ", productName=" + productName + ", parentCategory="
				+ parentCategory + ", childCategory=" + childCategory + ", quantity=" + quantity + ", price=" + price
				+ ", productInfoUrl=" + productInfoUrl + ", productOption=" + productOption + "]";
	}



	public static void main(String[] args) {
	}

}
