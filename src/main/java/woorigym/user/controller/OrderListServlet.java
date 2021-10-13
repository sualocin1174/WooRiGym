package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.OrderListService;
import woorigym.user.model.vo.OrderList;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class OrderListView
 */
@WebServlet("/orderlist")   // get방식: viewpage forward로 열기, post는 ajax
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/orderlist.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//매개변수와 동일한 객체 속성값 불러오는 메소드
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS"); // 10/11 user_id -> LoginInfo로 수정
		if(userTableSessionAttr == null) {
			out.append("로그인 상태가 아닙니다!\n로그인 해주세요!");
			 out.flush();
			 out.close();
			 return;
		}
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("LoginInfo: "+uid);// 10/11 user_id -> LoginInfo로 수정

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		System.out.println(startDate);
		System.out.println(endDate);
		
		ArrayList<OrderList> volist = new OrderListService().readOrderListPeriod(uid, startDate, endDate);

		// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
		response.setContentType("application/json;charset=UTF-8");
		Gson order_gob = new GsonBuilder().setPrettyPrinting().create();
		String gobStr ="";
		gobStr = order_gob.toJson(volist);
		System.out.println(gobStr);
		out.println(gobStr);
		out.flush(); //현재 버퍼에 출력된 내용들을 클라이언트로 전송
		out.close();
	}

}
