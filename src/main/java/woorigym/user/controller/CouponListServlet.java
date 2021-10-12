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

/**
 * Servlet implementation class CouponListServlet
 */
@WebServlet("/couponlist")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/template_mypage_aside.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO: 쿠폰 조건 만료일 오늘 이후
				PrintWriter out = response.getWriter();
				String uid = request.getParameter("user_id");
				System.out.println("uid: "+uid);

				ArrayList<CouponTable> volist = new CouponService().couponListAll(uid);
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

}
