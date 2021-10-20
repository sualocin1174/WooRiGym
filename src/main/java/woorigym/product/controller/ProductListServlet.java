package woorigym.product.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;

@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productNo = request.getParameter("productNo");
		ArrayList<ProductTable> volist = new ProductService().readProductList();

		if (volist != null) {
			List<String> imagesFilePath = new ArrayList<String>();
			
			Properties prop = new Properties();
			
			/* 방법 1 dothome은 용량이 작음. 속도 느림 */
			if(true) {
			try {
				String currentPath = ProductListServlet.class.getResource("./").getPath();
				prop.load(new BufferedReader(new FileReader(currentPath + "cloudServer.properties")));
				String server = prop.getProperty("server");
				int port = Integer.parseInt(prop.getProperty("port"));
				String user = prop.getProperty("user");
				String pass = prop.getProperty("pass");

				// FTP연결
				FTPClient ftpClient = new FTPClient();
				// connection 환경에서 UTF-8의 인코딩 타입을 사용한다.
				ftpClient.setControlEncoding("UTF-8");
				// ftp://localhost에 접속한다.
				ftpClient.connect(server, 21);
				// 접속을 확읺나다.
				int resultCode = ftpClient.getReplyCode();
				// 접속시 에러가 나오면 콘솔에 에러 메시지를 표시하고 프로그램을 종료한다.
				if (!FTPReply.isPositiveCompletion(resultCode)) {
					System.out.println("FTP server refused connection.!");
					return;
				} else {
					// 파일 전송간 접속 딜레이 설정 (1ms 단위기 때문에 1000이면 1초)
					ftpClient.setSoTimeout(1000);
					// 로그인을 한다.
					if (!ftpClient.login(user, pass)) {
						// 로그인을 실패하면 프로그램을 종료한다.
						System.out.println("Login Error!");
						return;
					}

					// FTP연결 성공
					
					// 반복
					for (ProductTable vo : volist) {
						String infoUrl = vo.getProductInfoUrl();
						if (infoUrl != null && !infoUrl.equals("")) {
							infoUrl = infoUrl.substring(0, infoUrl.length() - 4);
							// lists files and directories in the current working directory
							FTPFile[] files = ftpClient.listFiles("/html/images" + "/" + infoUrl);
							for (FTPFile file : files) {
								String details = file.getName();
								imagesFilePath
										.add(prop.getProperty("url") + "/images" + "/" + infoUrl + "/" + details);
								System.out.println("details:" + details);
							}
							System.out.println("imagesFilePath:" + imagesFilePath + ": "+ infoUrl);
							vo.setImagesFilePath(imagesFilePath);
						}
					} // 반복 끝
					
					// FTP 끊기
					ftpClient.logout();
					ftpClient.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		request.setAttribute("productvolist", volist);
		String ViewPage = "/WEB-INF/productlist.jsp";
		request.getRequestDispatcher(ViewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
