package woorigym.user.model.vo;

public class MyCoupon {

	public MyCoupon() {
	}
	//다음에는 쿠폰, 마일리지 따로 생성하자
//	select  max(have_coupon) as have_coupon, max(goodbye_coupon) as goodbye_coupon, max(have_mileage) as have_mileage
//	from(
//	select count(*) as have_coupon,0 as goodbye_coupon,0 as have_mileage from coupon where c_expire_date >= sysdate and c_use=0 and user_id='gym11'
//	union all
//	select 0 as have_coupon, count(*) as goodbye_coupon, 0 as have_mileage from coupon 
//	where c_expire_date >= sysdate and c_use=0 and user_id='gym11'and c_expire_date <= sysdate+14
//	union all
//	select 0 as have_coupon,  0 as goodbye_coupon, sum(add_mileage) as have_mileage from orderinfo where user_id='gym11'
//	);
	
	
	private int have_coupon;
	private int goodbye_coupon;
	private int have_mileage;
	
	
	@Override
	public String toString() {
		return "MyCoupon [have_coupon=" + have_coupon + ", goodbye_coupon=" + goodbye_coupon + ", have_mileage="
				+ have_mileage + ", getHave_coupon()=" + getHave_coupon() + ", getGoodbye_coupon()="
				+ getGoodbye_coupon() + ", getHave_mileage()=" + getHave_mileage() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public int getHave_coupon() {
		return have_coupon;
	}
	public void setHave_coupon(int have_coupon) {
		this.have_coupon = have_coupon;
	}
	public int getGoodbye_coupon() {
		return goodbye_coupon;
	}
	public void setGoodbye_coupon(int goodbye_coupon) {
		this.goodbye_coupon = goodbye_coupon;
	}
	public int getHave_mileage() {
		return have_mileage;
	}
	public void setHave_mileage(int have_mileage) {
		this.have_mileage = have_mileage;
	}
	
}
