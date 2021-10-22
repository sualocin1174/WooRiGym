package woorigym.user.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.product.controller.ProductListServlet;
import woorigym.product.model.vo.ProductTable;

/**
 * Servlet implementation class OrderProductImgServelt
 */
@WebServlet("/orderproductimg")
public class OrderProductImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProductImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String pnoList = request.getParameter("pnoList");
		System.out.println(pnoList);
		
		PrintWriter out = response.getWriter();
		
		StringTokenizer st = new StringTokenizer(pnoList, ",");
		int length = st.countTokens();
		String[] plist = new String[length];
		for(int i = 0 ; i < length ; i++) {
			plist[i] = st.nextToken();
			System.out.println(plist[i]);
		}
		
		if (plist != null) {
			List<String> imagesFilePath = new ArrayList<String>();
			
			Properties prop = new Properties();
			
			/* 방법 1 dothome은 용량이 작음. 속도 느림 */
			if(true) {
			try {
				String currentPath = OrderProductImgServlet.class.getResource("./").getPath();
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
						System.out.println("닷홈 Login Error!");
						return;
					} else {
						System.out.println("닷홈 Login 성공");
					}

					// FTP연결 성공
					
					// 반복
					for (int i = 0 ; i < plist.length ; i++) {
						String infoUrl = plist[i];
						if (infoUrl != null && !infoUrl.equals("")) {
							infoUrl = infoUrl.substring(0, infoUrl.length() - 4);
							System.out.println("infoUrl :"+infoUrl);
							// lists files and directories in the current working directory
							FTPFile[] files = ftpClient.listFiles("/html/images" + "/" + infoUrl+"/1.jpg");
							/*for (FTPFile file : files) {
								String details = file.getName();
								imagesFilePath.add(prop.getProperty("url") + "/images" + "/" + infoUrl + "/" + details);
								System.out.println("details:" + details);
							}
							*/
							imagesFilePath.add(prop.getProperty("url") + "/images" + "/" + infoUrl +"/1.jpg");
							
							

						}
					} // 반복 끝
					Gson plist_gob = new GsonBuilder().setPrettyPrinting().create();
					String plist_gobStr = "";
					if (imagesFilePath != null) {
						plist_gobStr = plist_gob.toJson(imagesFilePath);
						out.println(plist_gobStr);
						System.out.println("상품 이미지 파일 주소 전송 성공");
					} 
//					else{
//						System.out.println("상품 이미지 파일 주소 전송 실패");
//					}
					
					// FTP 끊기
					ftpClient.logout();
					ftpClient.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
//			 "https://"+api_key+":"+api_secret+"@api.cloudinary.com/v1_1/"+cloud_name+"/resources/image/upload?prefix=sample&max_results=500&next_cursor=1"
//			 https://api.cloudinary.com/v1_1/<your_gitcloud_name>/folders/<subfolder>
//			 https://api.cloudinary.com/v1_1/my_cloud_name/folders?api_key=1234&timestamp=1529697857&signature=4b569a0f8322b3a285296b3b8c2908c2a1cb1937
//			 https://api.cloudinary.com/v1_1/"+cloud_name+"/folders?api_key="+api_key+"&signature=4b569a0f8322b3a285296b3b8c2908c2a1cb1937
//			https://res.cloudinary.com/dgyk0qhqc/image/upload/v1634640976/woorigym/CARDIO-RN-0001/65%EB%B2%88_tv2d9u.jpg
//예시..참고
//			cloudinary.uploader().upload(new File("예시..https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg"),
//					  ObjectUtils.asMap("public_id", "olympic_flag"));
	}
		
		
		
		
		out.flush();
		out.close();
		
	}

}
