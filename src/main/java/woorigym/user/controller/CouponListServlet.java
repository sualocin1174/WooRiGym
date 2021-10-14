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

import woorigym.user.model.service.CouponService;
import woorigym.user.model.vo.CouponTable;
import woorigym.user.model.vo.UserTable;

@WebServlet("/couponlist")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CouponListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/mypage.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Object loginSS = request.getParameter("loginSS");
		UserTable user = (UserTable)loginSS;// 서블릿 자체 리퀘스트에 담고있어서 화면에 노필요!!
		String user_id = user.getUser_id();
		System.out.println(user_id);
		
		ArrayList<CouponTable> volist = new CouponService().couponListAll(user_id);
		System.out.println(volist);
		
		// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
		response.setContentType("application/json;charset=UTF-8");
		Gson coupon_gob = new GsonBuilder().setPrettyPrinting().create();
		String gobstr = "";
		if (volist != null) {
			System.out.println("(쿠폰리스트 서블릿) 쿠폰 목록 조회 성공");
			gobstr = coupon_gob.toJson(volist);
			System.out.println(volist);
			System.out.println(gobstr);
			out.println(gobstr);
		} else {
			System.out.println("쿠폰 목록 조회 실패");
		}
	}
	
//	public String getJson(String user_id) {
//		if(user_id == null) user_id = "";
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		CouponDao couponDao = new CouponDao();
//		ArrayList<CouponTable> volist = new CouponService().couponListAll(user_id);
//		for(int i = 0; i<volist.size();i++) {
//			result.append("{\"value\": \""+volist.get(i).getUser_id()+"\"},");
//		}
//		result.append("]}");
//		return result.toString();
//	}

}
