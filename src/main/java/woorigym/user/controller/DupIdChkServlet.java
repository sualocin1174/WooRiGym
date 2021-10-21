package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import woorigym.user.model.service.UserService;

/**
 * Servlet implementation class DupIdChkServlet
 */
@WebServlet("/DupIdChkServlet")
public class DupIdChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DupIdChkServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
		String uid = request.getParameter("user_id");
		System.out.println("uid: "+uid);
		int result = new UserService().dupidChk(uid);
		
		if (result > 0) {
			//아이디 중복
			System.out.println("아이디 중복: " + result);
		} else if(result == 0){
			if(uid == "") {
				result = 2; //입력받은 아이디가 존재x
				System.out.println("아이디가 존재하지 않습니다");
			} else { // 사용가능
				System.out.println("사용 가능: " + result);
			}
		}
		out.print(result);
		out.flush();
		out.close();
	}

}
