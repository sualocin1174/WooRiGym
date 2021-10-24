package woorigym.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
@WebServlet("/SelectNoticeAjax")
public class SelectNoticeServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeServletAjax() {
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
		Gson gson = new GsonBuilder().create();
		String jsonListVo ="";
		System.out.println("SelectNotice");
		
		String notice_no = request.getParameter("notice_no1");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_date = request.getParameter("n_date");
		
		int notice_noInt = 0;
		notice_noInt = Integer.parseInt(notice_no);
		System.out.println("출력" + notice_noInt);
		int result = new NoticeService().checkDuplicatedNotice(notice_noInt);
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		if(result >0) {
			System.out.println("공지사항이 존재합니다 : " + result);
			NoticeTable noticeVo = new NoticeTable();
			noticeVo.setN_title(n_title);
			noticeVo.setN_content(n_content);
			noticeVo.setN_date(n_date);
			
			ArrayList<NoticeTable> noticelist = new NoticeService().selectNotice(notice_noInt);
			System.out.println("noticelist 값: " + noticelist);
			
			map1.put("noticelist", noticelist);
			map1.put("result", result);
			
			jsonListVo = gson.toJson(map1);
		}	
		else if(result == 0) {
			if(notice_no == "") {
				result = -1;
				System.out.println("공지사항 번호를 입력해주세요.");
			}
			else {
				System.out.println("공지사항이 존재하지 않습니다.");
			}
			map1.put("result", result);
			jsonListVo = gson.toJson(map1);
		}
		System.out.println("SelectNotice jsonListVo " + jsonListVo);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
}
