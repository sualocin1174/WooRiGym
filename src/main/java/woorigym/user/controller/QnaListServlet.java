package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import woorigym.admin.model.vo.QnaTable;
import woorigym.user.model.service.QnaListService;
import woorigym.user.model.vo.UserTable;

@WebServlet("/qnalist")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnaListServlet() {
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
		}	
		String uid = loginSS.getUser_id();
		System.out.println("uid: "+uid);
		ArrayList<QnaTable> volist  = new QnaListService().myQnaList(uid);
		System.out.println("myQnaList volist.size(): "+volist.size());
		System.out.println("myQnaList volist: "+volist);
		request.setAttribute("myQnA", volist);
		
		String ViewPage = "/WEB-INF/qnalist.jsp";
		request.getRequestDispatcher(ViewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
