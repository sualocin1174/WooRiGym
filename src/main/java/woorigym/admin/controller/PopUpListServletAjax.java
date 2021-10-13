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
 * Servlet implementation class PopUpAddServlet
 */
@WebServlet("/apulist.ajax")
public class PopUpListServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopUpListServletAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String notice_no = request.getParameter("notice_no");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_date = request.getParameter("n_date");
		
		int notice_noInt=0;
		
		try {
			notice_noInt = Integer.parseInt(notice_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("숫자로 변환하지 못했음");
			
			out.println("오류 발생");
			out.flush();
			out.close();
			return;
		}
		NoticeTable noticeVo = new NoticeTable();
		noticeVo.setNotice_no(notice_noInt);
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setN_date(n_date);
		
		ArrayList<NoticeTable> noticelist = new NoticeService().NoticeListAll();
		request.setAttribute("noticelist", noticeVo);
		Gson gson = new GsonBuilder().create();
		String jsonListVo = gson.toJson(noticelist);
		out.print(jsonListVo);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
