package woorigym.admin.model.vo;

public class ProductImgTable {
	private int imgNo;
	private String productNo;
	private String imgAddress;
	// IMG_NO NUMBER NOT NULL
	// PRODUCT_NO VARCHAR2(30) NOT NULL
	// IMG_ADDRESS VARCHAR2(300) NOT NULL
	
	public ProductImgTable() {
		
	}

	public ProductImgTable(String imgAddress) {
		super();
		this.imgAddress = imgAddress;
	}
	
	@Override
	public String toString() {
		return "ProductImgTable [imgNo=" + imgNo + ", productNo=" + productNo + ", imgAddress=" + imgAddress
				+ "]";
	}
	
	public int getImgNo() {
		return imgNo;
	}

	public void setImg_no(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getImgAddress() {
		return imgAddress;
	}

	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
}
