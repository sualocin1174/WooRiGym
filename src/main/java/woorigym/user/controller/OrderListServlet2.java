package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.OrderListService;
import woorigym.user.model.vo.OrderList;
import woorigym.user.model.vo.OrderTable;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class OrderListServlet
 */
//참고용
@WebServlet("/orderlist2")   //  get : forward
public class OrderListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet2() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		PrintWriter out = response.getWriter();
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS");
		if(userTableSessionAttr == null) {
			 out.append("<script>alert('로그인 상태가 아닙니다.!\n'로그인 해주세요!');</script>");
			 return;
		}
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("LoginInfo: "+uid);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -2);
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		String startDate = df.format(cal.getTime());
		System.out.println(startDate);//오늘 기준 한달 전
		
		String endDate = "2021/10/01";
		ArrayList<OrderList> volist = new OrderListService().readOrderListPeriod(uid, startDate, endDate);
		if(volist!=null) {
			request.setAttribute("orderList", volist);
			System.out.println("주문목록 조회 성공");
			System.out.println(volist);
			
		} else {
			System.out.println("주문목록 조회 실패");
			request.setAttribute("orderList", null);
			return;
		}
		String viewPage = "/WEB-INF/orderlist2.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}

}
