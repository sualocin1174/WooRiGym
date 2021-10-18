package woorigym.admin.model.vo;

//CREATE TABLE "PRODUCTOPTION"(
	//		"OPTION_NO"			NUMBER			NOT NULL,
	//		"PRODUCT_NO"		VARCHAR2(30)	NOT NULL,
	//		"OPTION_CONTENT"	VARCHAR2(300)	NOT NULL
	//);

public class ProductOptionTable {
	private int optionNo;
	private String productNo;
	private String optionContent;
	
	public ProductOptionTable(String optionContent) {
		super();
		this.optionContent = optionContent;
	}
	
	@Override
	public String toString() {
		return "ProductOptionTable [optionNo=" + optionNo + ", productNo=" + productNo + ", optionContent="
				+ optionContent + "]";
	}
	
	public ProductOptionTable() {
		
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getOptionContent() {
		return optionContent;
	}

	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
}
