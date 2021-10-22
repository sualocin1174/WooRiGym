package woorigym.product.model.vo;

import java.util.List;

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
	
	// 2021-10-07 추가
	// for Search을 위한 추가로 eclipse에서는 사용하는 변수로 oracle DB에는 추가할 필요 없음(2021-10-08 1차 내용추가)
	private int minPrice;
	private int maxPrice;
	private String selectRank; // 2021.10.11 1차 내용추가
	// 2021.10.07 추가완료
	
	
	// TODO 주석
	private List<String> imagesFilePath;
	
	// 2021.10.13 추가
	public ProductTable() {
		
	}
	// 2021.10.13 추가 완료
	
	// 2021.10.13 추가
	public ProductTable(String productNo, String productName, String parentCategory, String childCategory, int quantity, int price, String productInfoUrl, String productOption) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.parentCategory = parentCategory;
		this.childCategory = childCategory;
		this.quantity = quantity;
		this.price = price;
		this.productInfoUrl = productInfoUrl;
		this.productOption = productOption;
	}
	// 2021.10.13 추가완료
		
	// 2021.10.07 수정시작	
	// 2021.10.11 1차 수정시작	
	@Override
	public String toString() {
		return "ProductTable [productNo=" + productNo + ", productName=" + productName + ", parentCategory="
				+ parentCategory + ", childCategory=" + childCategory + ", quantity=" + quantity + ", price=" + price
				+ ", productInfoUrl=" + productInfoUrl + ", productOption=" + productOption + ", minPrice=" + minPrice
				+ ", maxPrice=" + maxPrice + ", selectRank=" + selectRank + "]";
	}
	// 2021.10.11 1차 수정완료
	// 2021.10.07 수정완료
	
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

	
	// 2021-10-07 추가
	public int getMinPrice() {
		return minPrice;
	}



	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}



	public int getMaxPrice() {
		return maxPrice;
	}



	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	// 2021.10.07 추가완료


	// 2021.10.11 1차 추가시작
	public String getSelectRank() {
		return selectRank;
	}


	public void setSelectRank(String selectRank) {
		this.selectRank = selectRank;
	}
	// 2021.10.11 1차 추가완료

	public List<String> getImagesFilePath() {
		return imagesFilePath;
	}

	public void setImagesFilePath(List<String> imagesFilePath) {
		this.imagesFilePath = imagesFilePath;
	}
}
