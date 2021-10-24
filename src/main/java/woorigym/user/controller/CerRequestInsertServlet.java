package woorigym.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.user.model.service.CerRequestService;
import woorigym.user.model.vo.ClaimTable;
import woorigym.user.model.vo.ReturnInfoVo;
import woorigym.user.model.vo.UserTable;

@WebServlet("/crequest")
public class CerRequestInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CerRequestInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable loginSS = (UserTable)request.getSession().getAttribute("loginSS");
		if(loginSS == null) {
			System.out.println("loginSS~~~~~~~~~");//확인
			request.getRequestDispatcher("/WEB-INF/loginAlert.jsp").forward(request, response);
			return;
	}	String uid = loginSS.getUser_id();
	//ajax으로 data 가져오는 것! data: {이름} / getAttribute(이름) 이름 맞춰주기
	String why = (String)request.getParameter("why");
	String choice = (String)request.getParameter("choice");
	String delivery = (String)request.getParameter("delivery");
	String request_memo = (String)request.getParameter("request_memo");
	String order_no = (String)request.getParameter("order_no");
	System.out.println("와이 초이스 리퀘스트메모: "+why+choice+delivery+request_memo+order_no);
	ClaimTable input = new ClaimTable();
	input.setWhy(Integer.parseInt(why));
	input.setClaim_kind(choice);
	input.setOrder_no(order_no);
	input.setAddress_no(Integer.parseInt(delivery));
	input.setRequest_memo(request_memo);
	 new CerRequestService().insertClaimService(input,uid);
	 
	 ReturnInfoVo vo = new CerRequestService().selectReturnInfoService(order_no,uid);
	 //방법1: 조회하는 service 추가 2: 화면에 이미 있는 정보 가져가기
//	 new CerRequestService().insertClaimService(input,delivery,uid);
	 
	// 사용자의 정보를 JSON 형식으로 전달하기 위해 ContentType 변경
				response.setContentType("application/json;charset=UTF-8");
				Gson order_gob = new GsonBuilder().setPrettyPrinting().create();
				String gobStr ="";
				gobStr = order_gob.toJson(vo);
				System.out.println(gobStr);
				out.print(gobStr);
				out.flush(); //현재 버퍼에 출력된 내용들을 클라이언트로 전송
				out.close();
				
	
	}

}
