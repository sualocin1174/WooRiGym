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
 * Servlet implementation class PopUpAddServlet
 */
@WebServlet("/apuadd")
public class PopUpAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopUpAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		
		System.out.println(n_title);
		System.out.println(n_content);
		
		
		NoticeTable noticeVo = new NoticeTable(n_title, n_content);
		
		int result = new NoticeService().addNotice(noticeVo);
		System.out.println(result);
		if(result == 1 ) {
			request.setAttribute("msg", "공지사항이 등록되었습니다.");
			response.sendRedirect("apupage");
		}
		else {
			request.setAttribute("msg", "공지사항이 등록되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
		}
	}
}
