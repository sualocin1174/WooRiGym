package woorigym.user.model.dao;

public class MyCerlistVo {
//	select sum(order_cancel) as order_cancel, sum(order_change) as order_change, sum(order_refund) as order_refund from
//	(select case when claim_kind ='취소' then 1 else 0 end as order_cancel, case when claim_kind='교환' then 1 else 0 end as order_change, case when claim_kind='환불' then 1 else 0 end as order_refund
//	from claim 
//	join order_detail odetail on odetail.order_detail_no = claim.order_detail_no
//	join orderinfo on orderinfo.order_no = odetail.order_no
//	where user_id='gym11');
	public MyCerlistVo() {
	}
	private int order_cancel;
	private int order_change;
	private int order_refund;
	@Override
	public String toString() {
		return "MyCerlistVo [order_cancel=" + order_cancel + ", order_change=" + order_change + ", order_refund="
				+ order_refund + ", getOrder_cancel()=" + getOrder_cancel() + ", getOrder_change()=" + getOrder_change()
				+ ", getOrder_refund()=" + getOrder_refund() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public int getOrder_cancel() {
		return order_cancel;
	}
	public void setOrder_cancel(int order_cancel) {
		this.order_cancel = order_cancel;
	}
	public int getOrder_change() {
		return order_change;
	}
	public void setOrder_change(int order_change) {
		this.order_change = order_change;
	}
	public int getOrder_refund() {
		return order_refund;
	}
	public void setOrder_refund(int order_refund) {
		this.order_refund = order_refund;
	}
}
