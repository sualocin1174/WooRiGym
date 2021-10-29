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

import woorigym.user.model.service.OrderCancelService;
import woorigym.user.model.service.OrderListService;
import woorigym.user.model.vo.UserTable;

@WebServlet("/ocancel")
public class OrderCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderCancelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		//로그인 안하면 진입 불가
		if(loginSS == null) {
			System.out.println("loginSS~~~~~~~~~");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
	}	String uid = loginSS.getUser_id();
	String order_no = (String)request.getParameter("order_no");
		int result = new OrderListService().updateOrderCancel(uid, order_no);
		if(result > 1) {
			out.append("주문이 취소되었습니다.");
		} else {
			out.append("주문취소에 실패했습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS"); // 10/13 수정
		PrintWriter out = response.getWriter();
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("user_id: "+uid);
		String order_no = (String)request.getParameter("order_no");
		
		
		
		new OrderCancelService().cancelOrder(uid, order_no);
		// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
				response.setContentType("application/json;charset=UTF-8");
				Gson order_gob = new GsonBuilder().setPrettyPrinting().create();
				String gobStr ="";
				gobStr = order_gob.toJson("");
				System.out.println(gobStr);
				out.print(gobStr);
				out.flush(); //현재 버퍼에 출력된 내용들을 클라이언트로 전송
				out.close();
	}

}
