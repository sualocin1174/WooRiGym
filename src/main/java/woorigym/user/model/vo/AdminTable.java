package woorigym.user.model.vo;

public class AdminTable {
	private String admin_id;
	private String admin_pwd;
	public AdminTable() {
		// TODO Auto-generated constructor stub
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	@Override
	public String toString() {
		return "AdminTable [admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + "]";
	}

}
