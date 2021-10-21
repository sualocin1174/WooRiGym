package woorigym.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			request.getRequestDispatcher("/WEB-INF/cer_request.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
