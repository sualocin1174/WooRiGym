package woorigym.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.admin.model.service.NoticeService;

/**
 * Servlet implementation class PopUpDeleteServlet
 */
@WebServlet("/apudelete")
public class PopUpDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopUpDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_no = request.getParameter("notice_no2");
		
		System.out.println("출력" + notice_no);
		int notice_noInt = 0;
		try {
			notice_noInt = Integer.parseInt(notice_no);
			System.out.println(notice_noInt);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공지사항 번호를 숫자로 변환하지 못했음.");
			request.setAttribute("msg", "공지사항 번호를 숫자로 변환하지 못했음.");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
			return;
		}
		
		//NoticeTable noticeVo = new NoticeTable(notice_noInt);
		
		int result = new NoticeService().deleteNotice(notice_noInt);
		if(result > 0 ) {
			request.setAttribute("msg", "공지사항이 삭제되었습니다.");
			response.sendRedirect("apupage");
		}
		else {
			request.setAttribute("msg", "공지사항이 삭제되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
		}
	}

}
