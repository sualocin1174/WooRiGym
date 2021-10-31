package woorigym.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.review.model.dao.ReviewListDao;
import woorigym.review.model.service.ReviewListService;
import woorigym.review.model.vo.ReviewListVo;
import woorigym.user.model.vo.UserTable;


@WebServlet("/rlist")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		//로그인 안하면 진입 불가
				if(loginSS == null) {
					System.out.println("loginSS~~~~~~~~~");//확인
					request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
					return;
			}	String uid = loginSS.getUser_id();
			System.out.println("uid: "+uid);
			
			ArrayList<ReviewListVo> volist = new ReviewListService().myReviewList(uid);
			System.out.println("myReviewList volist.size(): "+volist.size());
			System.out.println("myReviewList volist: "+volist);
			request.setAttribute("myReview", volist);
			
			String viewPage = "/WEB-INF/reviewlist.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
