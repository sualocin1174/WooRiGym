package woorigym.admin.controller;

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

import woorigym.admin.model.service.NoticeService;
import woorigym.admin.model.vo.NoticeTable;

/**
 * Servlet implementation class SelectNoticeServlet
 */
@WebServlet("/SelectNotice")
public class SelectNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeServlet() {
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
		PrintWriter out = response.getWriter();
		String notice_no = request.getParameter("notice_no1");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		
		int notice_noInt = 0;
		notice_noInt = Integer.parseInt(notice_no);
		System.out.println("출력" + notice_noInt);
		int result = new NoticeService().checkDuplicatedNotice(notice_noInt);
		
		if(result >0) {
			System.out.println("공지사항이 존재합니다 : " + result);
			NoticeTable noticeVo = new NoticeTable();
			noticeVo.setN_title(n_title);
			noticeVo.setN_content(n_content);
			ArrayList<NoticeTable> noticelist = new NoticeService().selectNotice(notice_noInt);
			System.out.println("noticelist 값: " + noticelist);
			request.setAttribute("noticelist", noticeVo);
			Gson gson = new GsonBuilder().create();
			String jsonListVo = gson.toJson(noticelist);
			out.print(jsonListVo);
			out.flush();
			out.close();
		}	
		else if(result == 0) {
			if(notice_no == "") {
				result = 2;
				System.out.println("공지사항이 존재하지 않습니다.");
			}
			else {
				System.out.println("오류 :" + result);
			}
		}
		out.print(result);
		out.flush();
		out.close();
	}
}
