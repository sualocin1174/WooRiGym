package woorigym.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.service.CerDetailService;
import woorigym.user.model.vo.CerDetailVo;
import woorigym.user.model.vo.UserTable;


	@WebServlet("/cerDetail")
	public class CerDetailServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    public CerDetailServlet() { super(); }
	    
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
	    	
	    	String order_no = request.getParameter("order_no");
	    	CerDetailVo vo = new CerDetailService().CerDetail(uid, order_no);
	    	System.out.println(vo);
	    	request.setAttribute("cerdetail", vo);
			request.setAttribute("order_no", order_no);
			
			request.getRequestDispatcher("/WEB-INF/cerdetail.jsp").forward(request, response);
	    }

}