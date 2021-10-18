package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.vo.OrderDetailTable;
import woorigym.user.model.vo.UserTable;

@WebServlet("/orderDetailTable")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailServlet() {
        super();
    }
    
    //화면 뜰때 바로 가져오는건 get방식, 화면 이미 불러왔는데 바꿔야하면 post방식
//oderdetial.jsp 가기 전에 -> 서블릿 들러서 setAttribute에서 설정한 값을 ->jsp에서 사용가능
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// 로그인이 안되면 진입불가
				UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
				//(url에 있는)쿼리스트링을 가져오려면 getParameter!
				String order_no = request.getParameter("order_no");
				System.out.println(order_no);
				
				//order_no를 받아서 주문상세조회
				OrderDetailTable volist = new OrderDetailService().OrderDetailList(order_no);
				request.setAttribute("orderdetailvolist", volist);
				request.setAttribute("order_no", order_no);
				
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
				}
				
				System.out.println("loginSS~~555555555~~~");
				String ViewPage = "/WEB-INF/orderdetail.jsp";
				request.getRequestDispatcher(ViewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
