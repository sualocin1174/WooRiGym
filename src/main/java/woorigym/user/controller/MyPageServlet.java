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

import woorigym.user.model.dao.MyCerlistVo;
import woorigym.user.model.service.MypageService;
import woorigym.user.model.service.OrderListService;
import woorigym.user.model.vo.MyCoupon;
import woorigym.user.model.vo.MyDeliveryVo;
import woorigym.user.model.vo.OrderList;
import woorigym.user.model.vo.UserTable;

@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageServlet() {super();  }
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인이 안되면 진입불가
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		if(loginSS == null) {
			System.out.println("loginSS~~~~~~~~~");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
		}
		System.out.println("loginSS~~555555555~~~");//확인
		
		String uid = loginSS.getUser_id();
		
		MyCoupon mc = new MypageService().mypageCoupon(uid);
		MyDeliveryVo md = new MypageService().mydelivery(uid);
		MyCerlistVo mcv = new MypageService().mycer(uid);
		
		request.setAttribute("myCoupon", mc);
		request.setAttribute("MyDeliveryVo", md);
		request.setAttribute("MyCerlistVo", mcv);
		
		
		System.out.println("mc: "+mc);
		System.out.println("md: "+md);
		System.out.println("mcv: "+mcv);
		
		String ViewPage = "/WEB-INF/mypage.jsp";
		request.getRequestDispatcher(ViewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//매개변수와 동일한 객체 속성값 불러오는 메소드
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS"); // 10/15 추가
		if(userTableSessionAttr == null) {
			out.append("로그인 상태가 아닙니다!\n로그인 해주세요!");
			 out.flush();
			 out.close();
			 return;
		}
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("user_id: "+uid);

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
		out.print(gobStr);
		out.flush(); //현재 버퍼에 출력된 내용들을 클라이언트로 전송
		out.close();
	}
	}


