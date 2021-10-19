package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.OrderService;
import woorigym.user.model.vo.OrderTable;

/**
 * Servlet implementation class OrderPaymentServlet
 */
@WebServlet("/orderpayment")
public class OrderPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 결제 완료 후 정보를 받아서 주문내역 , 주문상세내역 생성 후 마이페이지로 화면 넘기기
//		private String order_no;  --> sql로 생성 sysdate + 시퀀스
//		private String user_id; 필요
//		private int address_no; 필요 --> 새주소입력 시 새 주소 등록, addressno도 가져오는 걸로 배송지 정보 기능 변경
//		private String order_memo; 필요
//		private int order_total; --> 총상품가격
//		private int order_cost; --> 배송비
//		private int point_discount; --> 적립금사용액
//		private int coupon_discount; --> 쿠폰 사용액
//		private int order_payment; --> 총 결제금액
//		private int order_method; --> 카드결제/무통장입금
//		private String order_date; --> sysdate
//		private String pay_state; --> 결제상태 카드결제 시 결제완료, 무통장입금 시 결제확인 --> admin이 변경 가능
//		private String order_state; --> 배송상태
//		private String arrive_date; --> 배송완료일
//		private int add_mileage; --> 추가되는 적립금
		
		response.setContentType("application/json;charset=UTF-8");
		String user_id = request.getParameter("user_id");
		int address_no = Integer.parseInt(request.getParameter("address_no"));
		String order_memo = request.getParameter("order_memo");
		int order_total = Integer.parseInt(request.getParameter("order_total"));
		int order_cost = Integer.parseInt(request.getParameter("order_cost"));
		int point_discount = Integer.parseInt(request.getParameter("point_discount"));
		int coupon_discount = Integer.parseInt(request.getParameter("coupon_discount"));
		int order_payment = Integer.parseInt(request.getParameter("order_payment"));
		int order_method = Integer.parseInt(request.getParameter("order_method"));
		int add_mileage = Integer.parseInt(request.getParameter("add_mileage"));
		String receiver_name = request.getParameter("receiver_name");
		String phone_no = request.getParameter("phone_no");
		
		
		String pay_state ="";
		if(order_method == 0 ) {
			pay_state = "결제완료";
		} else if(order_method==1) {
			pay_state = "결제대기";
		}
		//System.out.println("orderpayment진입"+order_total);
		int result = -1;
		result = new OrderService().insertOrderinfo(user_id, address_no,order_memo,order_total,order_cost,point_discount,coupon_discount,order_payment,order_method,pay_state, add_mileage,receiver_name,phone_no);
		
		
		PrintWriter out = response.getWriter();
		
		Gson payment_gob = new GsonBuilder().setPrettyPrinting().create();
		String payment_gobStr = "";
		if(result ==1) {
			System.out.println("주문내역 입력 성공");
			payment_gobStr = payment_gob.toJson(result);
			out.println(payment_gobStr);
			//System.out.println(cart_gobStr);
		} else {
			System.out.println("주문내역 입력 실패");
		}
		
		out.flush();
		out.close();
	
	
	}
	

}
