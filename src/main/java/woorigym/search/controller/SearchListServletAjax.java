package woorigym.search.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import woorigym.common.Command;
import woorigym.product.controller.ProductListServlet;
import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;
import woorigym.search.model.service.SearchListService;

/**
 * Servlet implementation class SearchListServlet
 */
@WebServlet("/slist.ajax")
public class SearchListServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchListServletAjax() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json; charset=utf-8"); 
		// 2021-10-07 수정
		PrintWriter out = response.getWriter();
		Map<String, Object> map1 = new HashMap<String, Object>();
		String jsonResultMap = "";
		
		// 검색 조건들 읽어오기
		String productName = request.getParameter("productName");
		String parentCategory = request.getParameter("parentCategory");
		String childCategory = request.getParameter("childCategory");
		String minPriceStr = request.getParameter("minPrice");
		String maxPriceStr = request.getParameter("maxPrice");
		String selectRank = request.getParameter("selectRank"); // 2021.10.11 1차 내용추가
		int minPrice = -1;
		int maxPrice = -1;
		System.out.println(minPrice);
		System.out.println(maxPrice);
		try {
			minPrice = Integer.parseInt(minPriceStr);
			maxPrice = Integer.parseInt(maxPriceStr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		ProductTable searchKeyVo = new ProductTable();
		if(productName != null && !productName.equals(""))	searchKeyVo.setProductName(productName);
		if(parentCategory != null && !parentCategory.equals(""))   searchKeyVo.setParentCategory(parentCategory);
		if(selectRank != null && !selectRank.equals(""))   searchKeyVo.setSelectRank(selectRank); // 2021.10.11 1차 내용추가
		if(childCategory != null && !childCategory.equals(""))   searchKeyVo.setChildCategory(childCategory);
		searchKeyVo.setMinPrice(minPrice);
		searchKeyVo.setMaxPrice(maxPrice);
		
		System.out.println("searchKeyVo 전달받은:"+ searchKeyVo);
		

		// 2021.10.13 1차 수정시작
		final int PAGE_SIZE = 20; // 한 페이지 당 글수
		final int PAGE_BLOCK = 5; // 한 화면에 나타날 페이지 링크 수
		// 페이지당 글 수랑 화면에 나타낼 페이지 수 변경
		// 2021.10.13 1차 수정완료
		int bCount = 0; // 총 글수
		int pageCount = 0; // 총 페이지수
		int startPage = 1; // 화면에 나타날 시작페이지
		int endPage = 1; // 화면에 나타날 마지막페이지
		int currentPage = 1;
		int startRnum = 1; // 화면에 글
		int endRnum = 1; // 화면에 글
		
		String pageNum = request.getParameter("pagenum");
		if (pageNum != null) { // 눌려진 페이지가 있음.
			currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
		}
		// 총 글수
		bCount = new SearchListService().getProductListCount(searchKeyVo);
		// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)
		pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
		// rownum 조건 계산
		startRnum = (currentPage - 1) * PAGE_SIZE + 1; // 1//6//11/16//21
		endRnum = startRnum + PAGE_SIZE - 1;
		if (endRnum > bCount) {
			endRnum = bCount;
		}

		if (currentPage % PAGE_BLOCK == 0) {
			startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
		} else {
			startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
		}
		endPage = startPage + PAGE_BLOCK - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("bCount:"+bCount);
		System.out.println("startRnum:"+startRnum);
		System.out.println("endRnum:"+endRnum);
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		System.out.println("pageCount:"+pageCount);
		System.out.println("currentPage:"+currentPage);
			
		
		
		
		
//		ArrayList<ProductTable> productlist = new SearchListService().productSearch(searchKeyVo);
		ArrayList<ProductTable> productlist = new SearchListService().searchProductList(searchKeyVo, startRnum, endRnum);
		System.out.println("productlist :"+productlist);

		// vo 관련 데이터 채우기
		map1.put("productlist", productlist);
		// search 관련 데이터 채우기
		map1.put("searchKeyVo", searchKeyVo);
		// page 관련 데이터 채우기
		map1.put("startPage", startPage);
		map1.put("endPage", endPage);
		map1.put("pageCount", pageCount);
		map1.put("currentPage", currentPage);
		
		
//		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		Gson gson = new GsonBuilder().create();
		jsonResultMap = gson.toJson(map1);
		System.out.println("jsonListVo"+jsonResultMap);
		out.print(jsonResultMap);
		out.flush();
		out.close();
	// 2021-10-07 수정완료
	
		if (productlist != null) {
			List<String> imagesFilePath = new ArrayList<String>();
			Map<String,List<String>> temp2 = new HashMap();
			
			Properties prop = new Properties();
			List<String> imagePathList = new ArrayList();
			/* 방법 1 dothome은 용량이 작음. 속도 느림 */
			if(true) {
				try {
					String currentPath = ProductListServlet.class.getResource("./").getPath();
					//String currentPath = SearchListServletAjax.class.getResource("./").getPath();
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
	
						Map<String,List<String>> temp1 = new HashMap();
						for(ProductTable vo: productlist) {
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
			//request.setAttribute("productvolist", volist);
			request.setAttribute("product_img", imagePathList);
			request.setAttribute("productinfo", temp2 );
		}
	}
}
