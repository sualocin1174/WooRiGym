package woorigym.user.model.vo;

public class AddressTable {
	private String address_no;
	private String user_id;
	private String postcode;
	private String basic_address;
	private String detail_address;
	private int fixed_address;
	public AddressTable() {
		// TODO Auto-generated constructor stub
	}
	public String getAddress_no() {
		return address_no;
	}
	public void setAddress_no(String address_no) {
		this.address_no = address_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getFixed_address() {
		return fixed_address;
	}
	public void setFixed_address(int fixed_address) {
		this.fixed_address = fixed_address;
	}
	@Override
	public String toString() {
		return "AddressTable [address_no=" + address_no + ", user_id=" + user_id + ", postcode=" + postcode
				+ ", basic_address=" + basic_address + ", detail_address=" + detail_address + ", fixed_address="
				+ fixed_address + "]";
	}

}