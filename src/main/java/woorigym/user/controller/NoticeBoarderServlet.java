package woorigym.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.admin.model.service.NoticeService;
import woorigym.admin.model.vo.NoticeTable;

/**
 * Servlet implementation class NoticeBoarderServlet
 */
@WebServlet("/NoticeBoarderServlet")
public class NoticeBoarderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoarderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		final int PAGE_SIZE = 5; // 한 페이지 당 글 수
		final int PAGE_BLOCK = 3; // 한 화면에 나타날 페이지 링크 수
		int nCount = 0;
		int pageCount = 0; // 총 페이지 수
		int startPage = 1; //화면에 나타날 시작 페이지
		int endPage = 5; //화면에 나타날 마지막 페이지
		int currentPage = 1;
		int startRnum = 1; //화면에 글
		int endRnum = 1; // 화면에 글
		
		String pageNum = request.getParameter("pagenum");
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		nCount = new NoticeService().getNoticeCount();
		
		pageCount = (nCount/PAGE_SIZE) + (nCount%PAGE_SIZE == 0 ? 0:1);
		
		startRnum = (currentPage-1) * PAGE_SIZE + 1;
		endRnum = startRnum + PAGE_SIZE - 1;
		if(endRnum > nCount) {
			endRnum = nCount;
		}
		
		if(currentPage % PAGE_BLOCK == 0) {
			startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
		} else {
			startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
		}
		endPage = startPage + PAGE_BLOCK - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		ArrayList<NoticeTable> volist = new NoticeService().selectNoticeBoard(startRnum, endRnum);
		
		request.setAttribute("noticelist", volist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		String viewPage = "/WEB-INF/noticeboard.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
		
//		for(NoticeTable vo : volist) {
//				out.println("<p>" + vo.toString() + "</p>");
//			}
//		
//		if(startPage>1) {
//			out.println("이전");
//		}
//		for(int i=startPage; i<=endPage; i++) {
//			out.println(i);
//			if(i!=endPage) {
//				out.println(", ");
//			}
//		}
//		if(endPage<pageCount) {
//			out.println("다음");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
