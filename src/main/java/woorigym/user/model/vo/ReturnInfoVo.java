package woorigym.user.model.vo;

public class ReturnInfoVo {

	public ReturnInfoVo() {
	}
 private String request_memo;
 private String return_date;
 private String address_no;
 private String postcode;
	private String basic_address;
	private String detail_address;
	@Override
	public String toString() {
		return "ReturnInfoVo [request_memo=" + request_memo + ", return_date=" + return_date + ", address_no="
				+ address_no + ", postcode=" + postcode + ", basic_address=" + basic_address + ", detail_address="
				+ detail_address + ", getRequest_memo()=" + getRequest_memo() + ", getReturn_date()=" + getReturn_date()
				+ ", getAddress_no()=" + getAddress_no() + ", getPostcode()=" + getPostcode() + ", getBasic_address()="
				+ getBasic_address() + ", getDetail_address()=" + getDetail_address() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public String getRequest_memo() {
		return request_memo;
	}
	public void setRequest_memo(String request_memo) {
		this.request_memo = request_memo;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public String getAddress_no() {
		return address_no;
	}
	public void setAddress_no(String address_no) {
		this.address_no = address_no;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getBasic_address() {
		return basic_address;
	}
	public void setBasic_address(String basic_address) {
		this.basic_address = basic_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
 
}
