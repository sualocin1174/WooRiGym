package woorigym.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.user.model.service.OrderService;
import woorigym.user.model.vo.UserTable;

/**
 * Servlet implementation class OrderDeleteAddressServlet
 */
@WebServlet("/orderdeleteaddress")
public class OrderDeleteAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		UserTable user = (UserTable)request.getSession().getAttribute("loginSS");
		System.out.println(user.getUser_id());
		String user_id = user.getUser_id();

		String postcode = request.getParameter("postcode");
		String basic_address = request.getParameter("basicaddr");
		String detail_address = request.getParameter("detailaddr");
		int address_no = Integer.parseInt(request.getParameter("addressno"));
		//System.out.println(detail_address);
		
		int result = new OrderService().deleteInsert(user_id, postcode, basic_address, detail_address, address_no);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
