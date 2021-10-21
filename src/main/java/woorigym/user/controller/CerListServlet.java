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

import woorigym.user.model.service.CerListService;
import woorigym.user.model.vo.CerList;
import woorigym.user.model.vo.UserTable;

@WebServlet("/clist")
public class CerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CerListServlet() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS");
		//로그인 안하면 진입 불가
				if(userTableSessionAttr == null) {
					out.append("로그인 상태가 아닙니다!\n로그인 해주세요!");
					String viewPage = "/WEB-INF/loginAlert.jsp";
					out.flush();
					out.close();
					return;
				}
		// 페이징
				final int PAGE_SIZE = 5;   // 한 페이지 당 글수
				final int PAGE_BLOCK = 5;   // 한 화면에 나타날 페이지 링크 수
				int bCount = 0;   // 총 글수
				int pageCount = 0; // 총 페이지수
				int startPage = 1;   // 화면에 나타날 시작페이지
				int endPage = 1;   // 화면에 나타날 마지막페이지
				int currentPage = 1;
				int startRnum = 1;   // 화면에 글
				int endRnum = 1;  // 화면에 글
				
				//사용자가 화면에서 무슨 페이지를 눌렀는지 서블릿에 전달
				String pageNum = request.getParameter("pagenum");
				if(pageNum != null) {   // 눌려진 페이지가 있음.
					currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
				} else {
					currentPage = 1; // 디폴트 페이지는 1
				}
				
				// 총 글수
				bCount = new CerListService().getCerCount(userTableSessionAttr.getUser_id());
				System.out.println("bCount"+bCount);
				// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)
				pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1); // 몫 + 나머지

				startRnum = (currentPage-1) * PAGE_SIZE   + 1;   // 1//6//11/16//21
				endRnum = startRnum + PAGE_SIZE -1; // 4= page_size - 1
				if(endRnum > bCount) endRnum=bCount; //그만큼 글수가 full이 아니라서 bcount에 숫자를 맞춘다.
				if(currentPage % PAGE_BLOCK == 0) { //5(page_Block)의 배수일때는
					startPage = (currentPage / PAGE_BLOCK -1) * PAGE_BLOCK +1;//눈에 보이는 가장 첫번째 페이지
					// -1 +1 => 0 안되게 하려고
				} else {
					startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK +1;
					
				} endPage = startPage + PAGE_BLOCK -1;
				System.out.println("endPage: "+endPage);
				System.out.println("pageCount"+pageCount);
				if(endPage>pageCount) endPage = pageCount;
				
				System.out.println(startRnum);
					System.out.println(endRnum);
				ArrayList<CerList> volist = new CerListService().selectCerList(userTableSessionAttr.getUser_id(),startRnum,endRnum);
				System.out.println("volist.size() 1: "+volist.size());
//				if(volist.size() > 0 ) 
//				{
//					for(OrderList vo : volist) {
//						out.println("<p>"+vo.toString()+"</p>");
//					}
//				}
//				if(startPage>1)
//					out.println("이전  ");
//				for(int i=startPage; i<=endPage; i++) {
//					out.print(i);
//					if(i!=endPage) {
//						out.println(", ");
//					}
//				}
//				if(endPage<pageCount)
//					out.println("  다음");
				
				//data 전달을 위해 request에 셋 -> 여기서 넘겨준걸, jsp에서 쓸수있다.
				request.setAttribute("cervolist", volist);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("pageCount", pageCount);
				
		//Page 이동하면서도 Data도 전달함
				String viewPage = "/WEB-INF/cerlist.jsp";
				request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserTable userTableSessionAttr = (UserTable)request.getSession().getAttribute("loginSS"); // 10/13 수정
		PrintWriter out = response.getWriter();
		String uid = userTableSessionAttr.getUser_id();
		System.out.println("user_id: "+uid);

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		System.out.println(startDate);
		System.out.println(endDate);
		
		ArrayList<CerList> volist = new CerListService().readCerListPeriod(uid, startDate, endDate);

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
