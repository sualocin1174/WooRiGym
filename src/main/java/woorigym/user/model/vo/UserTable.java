package woorigym.user.model.vo;

public class UserTable {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String email;
	private int email_yn;
	private String phone;
	private String join_date;
	private int mileage;
	private String birthday;
	private String identity_number;
	private int gender;
	
	public UserTable() {
	}
	
	public UserTable(String user_id, String user_pwd, String user_name) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
	}
	
	@Override
	public String toString() {
		return "UserTable [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", email="
				+ email + ", email_yn=" + email_yn + ", phone=" + phone + ", join_date=" + join_date + ", mileage="
				+ mileage + ", birthday=" + birthday + ", identity_number=" + identity_number + ", gender=" + gender
				+ "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEmail_yn() {
		return email_yn;
	}

	public void setEmail_yn(int email_yn) {
		this.email_yn = email_yn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIdentity_number() {
		return identity_number;
	}

	public void setIdentity_number(String identity_number) {
		this.identity_number = identity_number;
	}
	
}