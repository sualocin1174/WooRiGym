package woorigym.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import woorigym.admin.model.vo.ProductImgTable;
import woorigym.admin.model.vo.ProductOptionTable;
import woorigym.product.model.service.ProductService;
import woorigym.product.model.vo.ProductTable;

/**
 * Servlet implementation class ProductAddServlet
 */
@WebServlet("/apadd")
public class ProductAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/WEB-INF/adminmain.jsp").forward(request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	
//		PrintWriter out = response.getWriter();
		
		String fileSavePath = "images"; // 파일 저장 경로 (webapp 폴더 아래에 폴더를 생성해 주어야한다.)
		int uploadSizeLimit = 10 * 1024 * 1024; // 파일 크기 10m 제한
		String encType = "UTF-8";
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "file 업로드 실패");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
		}
		
		ServletContext context = getServletContext();
		String uploadPath = context.getRealPath(fileSavePath);
		MultipartRequest multi = new MultipartRequest(request, // request 객체
				uploadPath, // 서버 상 업로드 될 디렉토리
				uploadSizeLimit, // 업로드 파일 크기 제한
				encType, // 인코딩 방법
				new DefaultFileRenamePolicy() // 동일 이름 존재 시 새로운 이름 부여 방식
		);
		
		// 상품 정보
		String productInfoUrl = "images/" + multi.getFilesystemName("productInfoUrl");
		String productNo = multi.getParameter("productNo");
		String productName = multi.getParameter("productName");
		String price = multi.getParameter("price");
		String quantity = multi.getParameter("quantity");
		String productOption_1 = multi.getParameter("productOption");
		String parentCategory = multi.getParameter("parentCategory");
		String childCategory = multi.getParameter("childCategory");
		System.out.println("출력" + productInfoUrl);
		System.out.println(productNo);
		System.out.println(productName);
		System.out.println(productOption_1);
		System.out.println(parentCategory);
		System.out.println(childCategory);
		
		int quantityInt = 0;
		int priceInt = 0;
		
		try {
			quantityInt = Integer.parseInt(quantity);
			priceInt = Integer.parseInt(price);
			System.out.println(priceInt);
			System.out.println(quantityInt);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("양과 가격을 숫자로 변환하지 못했음.");
			request.setAttribute("msg", "양과 가격을 숫자로 변환하지 못했음.");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
			return;
		}
		
		ProductTable productVo = new ProductTable(productNo, productName, parentCategory, childCategory, quantityInt, priceInt, productInfoUrl, productOption_1);
		
		ArrayList<ProductOptionTable> productOption = new ArrayList<ProductOptionTable>();
		String optionContent = null;
		ProductOptionTable optionVo = new ProductOptionTable(optionContent);
		optionVo.setOptionContent(multi.getParameter("optionContent"));
		productOption.add(optionVo);
		
		for(ProductOptionTable vo : productOption) {
			System.out.println(vo.toString());
		}
		
		ArrayList<ProductImgTable> productImg = new ArrayList<ProductImgTable>();
		String stepImg = null;
		
		String stepCount = multi.getParameter("stepCount");
		int stepCnt = 0;
		try {
			stepCnt = Integer.parseInt(stepCount);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("사진의 개수를 숫자로 변환하지 못했음.");
			request.setAttribute("msg", "사진의 개수를 숫자로 변환하지 못했음.");
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
			return;
		}
		
		for(int i=0; i<stepCnt; i++) {
			ProductImgTable imgVo = new ProductImgTable(stepImg);
			imgVo.setImgAddress("images/" + multi.getFilesystemName("uploadStepImg_" + i));
			productImg.add(imgVo);
		}
		for(ProductImgTable vo : productImg) {
			System.out.println(vo.toString());
		}
		
		
		int result = new ProductService().addProduct(productVo, productOption, productImg);
		System.out.println("[[[여기]]] "+result);
		
		if(result > 0) {
//			request.setAttribute("msg", "상품 등록에 성공했습니다.");
//			request.getRequestDispatcher("amain").forward(request, response);
			response.sendRedirect("amain");
		}
		else {
			request.setAttribute("msg", "상품 등록에 실패했습니다.");
//			request.getRequestDispatcher("amain").forward(request, response);
			request.getRequestDispatcher("/WEB-INF/inputDataError.jsp").forward(request, response);
		}
	}

}
