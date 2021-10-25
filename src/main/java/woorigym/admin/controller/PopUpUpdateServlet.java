package woorigym.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.admin.model.service.NoticeService;
import woorigym.admin.model.vo.NoticeTable;

/**
 * Servlet implementation class PopUpUpdateServlet
 */
@WebServlet("/apuupdate")
public class PopUpUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopUpUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		Gson gson = new GsonBuilder().create();

		String n_title = request.getParameter("notice_title");
		String n_content = request.getParameter("notice_content");
		String notice_no = request.getParameter("notice_no111");
		String n_date = request.getParameter("notice_date");
		
		int notice_noInt = 0;
		notice_noInt = Integer.parseInt(notice_no);
		
		NoticeTable noticeVo = new NoticeTable(n_title, n_content, n_date, notice_noInt);
		
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setNotice_no(notice_noInt);
		System.out.println(noticeVo);
		
		int result = new NoticeService().updateNotice(noticeVo);
		
		if(result == 1) {
			request.setAttribute("msg", "공지사항이 등록되었습니다.");
			response.sendRedirect("apupage");
		}
		else {
			request.setAttribute("msh",  "공지사항이 등록되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request,  response);
		}
		
//		if(result == 1) {
//			
//		}
	}
}
