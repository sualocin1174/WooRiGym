package woorigym.user.model.vo;

public class MyDeliveryVo {
//	select sum(order_complete) as order_complete, sum(order_ready) as order_ready, sum(order_ing) as order_ing from
//	(select CASE WHEN order_state='주문완료' then 1 end as order_complete, case when order_state = '배송준비중' then 1 end as order_ready, case when order_state='배송중' then 1 end as order_ing 
//	from orderinfo where user_id=? );
	public MyDeliveryVo() {
	}
	private int order_complete;
	 private int order_ready;
	 private int order_ing;
	 private int order_arrive;
	public int getOrder_complete() {
		return order_complete;
	}
	public void setOrder_complete(int order_complete) {
		this.order_complete = order_complete;
	}
	public int getOrder_ready() {
		return order_ready;
	}
	public void setOrder_ready(int order_ready) {
		this.order_ready = order_ready;
	}
	public int getOrder_ing() {
		return order_ing;
	}
	public void setOrder_ing(int order_ing) {
		this.order_ing = order_ing;
	}
	public int getOrder_arrive() {
		return order_arrive;
	}
	public void setOrder_arrive(int order_arrive) {
		this.order_arrive = order_arrive;
	}
	@Override
	public String toString() {
		return "MyDeliveryVo [order_complete=" + order_complete + ", order_ready=" + order_ready + ", order_ing="
				+ order_ing + ", order_arrive=" + order_arrive + ", getOrder_complete()=" + getOrder_complete()
				+ ", getOrder_ready()=" + getOrder_ready() + ", getOrder_ing()=" + getOrder_ing()
				+ ", getOrder_arrive()=" + getOrder_arrive() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	 

	

}
