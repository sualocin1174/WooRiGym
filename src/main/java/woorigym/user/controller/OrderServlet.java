package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.product.model.vo.ProductTable;
import woorigym.shoppingbag.model.vo.CartTable;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.UserTable;
import woorigym.user.model.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , NullPointerException{
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//doPost로 바꾸기
		
		PrintWriter out = response.getWriter();
		
		//받아온 정보
		//1. 로그인된 유저 아이디
//		String userid = "gym11"; //일단 임의로 정함
		UserTable user = (UserTable)request.getSession().getAttribute("user_id");
	
		try {
			String userid = user.getUser_id();
			System.out.println(user.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//장바구니 정보 가져오기
		
		request.getRequestDispatcher("/WEB-INF/order.jsp").forward(request, response);   
		
//		ArrayList<CartTable> volistCart = new OrderService().getCart(userid);
//		System.out.println(volistCart);
//		Gson cart_gob = new GsonBuilder().setPrettyPrinting().create();
//		String cart_gobStr = "";
//		if(volistCart !=null) {
//			System.out.println("장바구니 불러오기 성공");
//			cart_gobStr = cart_gob.toJson(volistCart);
//			out.println(cart_gobStr);
//			System.out.println(cart_gobStr);
//		}
		
		
		
		//상품 정보
		//TODO 리스트 형태로 장바구니 정보 가져오기
		
		
		
		//MEMBER 테이블에서 바로 가져올 정보
		//getUserInfo();
//		String name ="";
//		String phone ="";
//		int mileage = 0;
		
		
		
		//배송지 정보 중 자동입력주소 1로 되어 있는 주소
//		String postcode= "";
//		String basicAddress = "";
//		String detailAddress = "";
		
		//결제정보에서 유저 정보에서 가져 올 것들
		
		//장바구니에서 물건 수량 가져오기
		
//		ArrayList<CartTable> volistCart = new OrderService().getCart(userid);
		
		//상품테이블에서 장바구니에 있는 상품 정보 불러오기-이름, 가격, ?이미지? 
		
//		ArrayList<ProductTable> volistProduct = new OrderService().getProductinfo(userid);
		
		
		
		
		
		
		// 리스트 형태로 쿠폰 목록 받아오기
		//TODO
		
		//주문자 정보 받아오기
//		ArrayList<UserTable> volistUser = new OrderService().getUserInfo(userid);
//		for (UserTable vo : volistUser) {
//			name = vo.getUser_name();
//			phone = vo.getPhone();
//			mileage = vo.getMileage();
//		}
		//사용자의 기본배송지 주소 가져오기
//		ArrayList<AddressTable> volistAddress = new OrderService().getAddress(userid);
//		
//		for(AddressTable vo : volistAddress) {
//			postcode = vo.getPostcode();
//			basicAddress = vo.getBasic_address();
//			detailAddress = vo.getDetail_address();
//		}
//		
//		request.setAttribute("name", name);
//		request.setAttribute("phone", phone);
//		request.setAttribute("mileage", mileage);
//		request.setAttribute("postcode", postcode);
//		request.setAttribute("basicAddress", basicAddress);
//		request.setAttribute("detailAddress", detailAddress);
//		request.setAttribute("volistCart", volistCart);
//		request.setAttribute("volistProduct", volistProduct);
//		//값을 하나하나 보내지말고 리스트로 보내서 jsp 에서 처리하기
//		ServletContext context =getServletContext();
//		
//		RequestDispatcher dispatcher = context.getRequestDispatcher("/WEB-INF/order.jsp");
//		dispatcher.forward(request, response);
//		
		
		
		// 결제페이지로 값 넘기기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("oder dopost 진입");
		
		// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
		response.setContentType("application/json;charset=UTF-8");
		String userid = request.getParameter("user_id");
		
		PrintWriter out = response.getWriter();
		
		ArrayList<CartTable> volistCart = new OrderService().getCart(userid);
		System.out.println(volistCart);
		Gson cart_gob = new GsonBuilder().setPrettyPrinting().create();
		String cart_gobStr = "";
		if(volistCart !=null) {
			System.out.println("장바구니 불러오기 성공");
			cart_gobStr = cart_gob.toJson(volistCart);
			out.println(cart_gobStr);
			System.out.println(cart_gobStr);
		} else {
			System.out.println("장바구니 정보 불러오기 실패");
		}
		
		
		
		
		
		
		out.flush();
		out.close();
		
		
	}

}
