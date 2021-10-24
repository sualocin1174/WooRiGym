package woorigym.product.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

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
			Map<String,List<String>> temp2 = new HashMap();
			
			Properties prop = new Properties();
			List<String> imagePathList = new ArrayList();
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
				// 접속을 확인한다.
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

					// FTP연결 성공 : 폴더로 진입이 가능
					// 반복
//					for (ProductTable vo : volist) {
//						String infoUrl = vo.getProductInfoUrl(); // 예: CARDIO-RN-0001-001
//						if (infoUrl != null && !infoUrl.equals("")) { //null이나 공백이 아니면
//							infoUrl = infoUrl.substring(0, infoUrl.length() - 4);//오라클에 저장된 뒤에 옵션 4자리(ex: -001)문자열 자르기(시작인덱스, 종료인덱스 전까지)
//							// lists files and directories in the current working directory
//							FTPFile[] files = ftpClient.listFiles("/html/product" + "/" + infoUrl);//닷홈의 폴더경로: html/product
//							for (FTPFile file : files) {
//								String details = file.getName();
//								imagesFilePath
//										.add(prop.getProperty("url") + "/product" + "/" + infoUrl + "/" + details);
//								
//								System.out.println("details:" + details);
//							}
//							System.out.println("imagesFilePath:" + imagesFilePath + ": "+ infoUrl);
//							vo.setImagesFilePath(imagesFilePath);
//						}
//					} // 반복 끝
					//List<ProductTable> distinctProductList = new ArrayList();
					Map<String,List<String>> temp1 = new HashMap();
					for(ProductTable vo: volist) {
						String key=vo.getProductInfoUrl().substring(0,vo.getProductInfoUrl().length() - 4);//상품이미지 가져오기
						List<String> productName_productCost = new ArrayList(); //상품명, 가격 가져오기
						productName_productCost.add(vo.getProductName());
						productName_productCost.add(String.valueOf(vo.getPrice()));
						temp1.put(key,productName_productCost);
					}
					Iterator<String> temp1_keys = temp1.keySet().iterator();
					
					
					while(temp1_keys.hasNext()) {
						String infoUrl = temp1_keys.next();
						FTPFile[] files = ftpClient.listFiles("/html/product" + "/" + infoUrl);//닷홈의 폴더경로: html/product
						
						if(files!=null && files.length>0){ //상품별 대표이미지만 출력
						String details = files[0].getName();
						System.out.println("details:" + details);
						imagePathList.add(prop.getProperty("url") + "/product" + "/" + infoUrl + "/" + details);
						
						temp2.put(prop.getProperty("url") + "/product" + "/" + infoUrl + "/" + details,temp1.get(infoUrl));
						}/*for (FTPFile file : files) { //이건 전체 이미지 모두 출력
							String details = file.getName();
							System.out.println("details:" + details);
							imagePathList.add(prop.getProperty("url") + "/product" + "/" + infoUrl + "/" + details);
						}*/
						
						System.out.println("imagesFilePath:" + imagesFilePath + ": "+ infoUrl);
						
					}
					
					// FTP 끊기
					ftpClient.logout();
					ftpClient.disconnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
			System.out.println("imagePathList: "+imagePathList);
			System.out.println("temp2: "+temp2);
			request.setAttribute("productvolist", volist);
			request.setAttribute("product_img", imagePathList);
			request.setAttribute("productinfo", temp2 );
			String ViewPage = "/WEB-INF/productlist.jsp";
			request.getRequestDispatcher(ViewPage).forward(request, response);
			//cloudServer.properties 내용 ▼
//			server=woorigym.dothome.co.kr
//					port=21
//					user=woorigym
//					pass=gym2021!
//					url=http://woorigym.dothome.co.kr
//					cloud_name=chsh9410@gmail.com
//					api_key=248355888283262
//					api_secret=6MzXp7Z0dJL-DLzN1Y5JAXKtnwg
			
//			 "https://"+api_key+":"+api_secret+"@api.cloudinary.com/v1_1/"+cloud_name+"/resources/image/upload?prefix=sample&max_results=500&next_cursor=1"
//			 https://api.cloudinary.com/v1_1/<your_gitcloud_name>/folders/<subfolder>
//			 https://api.cloudinary.com/v1_1/my_cloud_name/folders?api_key=1234&timestamp=1529697857&signature=4b569a0f8322b3a285296b3b8c2908c2a1cb1937
//			 https://api.cloudinary.com/v1_1/"+cloud_name+"/folders?api_key="+api_key+"&signature=4b569a0f8322b3a285296b3b8c2908c2a1cb1937
//			https://res.cloudinary.com/dgyk0qhqc/image/upload/v1634640976/woorigym/CARDIO-RN-0001/65%EB%B2%88_tv2d9u.jpg
//예시..참고
//			cloudinary.uploader().upload(new File("예시..https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg"),
//					  ObjectUtils.asMap("public_id", "olympic_flag"));
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
