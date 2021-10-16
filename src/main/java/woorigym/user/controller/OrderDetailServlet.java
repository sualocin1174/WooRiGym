package woorigym.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/orderDetailTable")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인이 안되면 진입불가
				UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
				//(url에 있는)쿼리스트링을 가져오려면 getParameter!
				String order_no = request.getParameter("order_no");
				System.out.println(order_no);
				//TODO: 서비스, Dao 만들기
				
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
				}
				System.out.println("loginSS~~555555555~~~");
				String ViewPage = "/WEB-INF/orderdetail.jsp";
				request.getRequestDispatcher(ViewPage).forward(request, response);
				
				//order_no를 받아서 주문상세조회
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
