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

import woorigym.user.model.service.CerRequestService;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.UserTable;

@WebServlet("/cinsert")
public class CerRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CerRequestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인이 안되면 진입불가
			UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
			if(loginSS == null) {
				System.out.println("loginSS~~~~~~~~~");//확인
				request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
				return;
		}	
			String order_no = request.getParameter("order_no");
			String product_name = request.getParameter("product_name");
			String order_total = request.getParameter("order_total");
			String order_cost = request.getParameter("order_cost");
			request.setAttribute("order_no", order_no);
			request.setAttribute("product_name", product_name);
			request.setAttribute("order_total", order_total);
			request.setAttribute("order_cost", order_cost);
			request.getRequestDispatcher("/WEB-INF/cer_request.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		if(loginSS == null) {
			System.out.println("loginSS~~~~~~~~~");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
	}	String uid = loginSS.getUser_id();
	System.out.println("uid: "+uid);
	//여기까지 디폴트
	ArrayList<AddressTable> volist = new CerRequestService().selectAddressService(uid);
		System.out.println("volist: "+volist);
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
