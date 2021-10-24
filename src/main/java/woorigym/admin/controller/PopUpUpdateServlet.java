package woorigym.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().create();

		String n_title = request.getParameter("notice_title");
		String n_content = request.getParameter("notice_content");
		String notice_no = request.getParameter("notice_no2");
		
		int notice_noInt = 0;
		notice_noInt = Integer.parseInt(notice_no);
		
		out.print(n_title);
		out.print(n_content);
		out.print(notice_noInt);
		
		NoticeTable noticeVo = new NoticeTable(notice_noInt, n_title, n_content);
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setNotice_no(notice_noInt);
		System.out.println(noticeVo);
		
		int result = new NoticeService().updateNotice(noticeVo);
		String jsonListVo = gson.toJson(result);
		
		out.print(jsonListVo);
		out.flush();
		out.close();
	}
}
