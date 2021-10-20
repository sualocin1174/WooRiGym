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
		
		if(volist != null) {
	         List<String> imagesFilePath= new ArrayList<String>();
	         for(ProductTable vo : volist) {
	            String infoUrl = vo.getProductInfoUrl();
	            if (infoUrl !=null && !infoUrl.equals("")) {
//	               File directory = new File("https://res.cloudinary.com/dgyk0qhqc/image/upload/v1634637136/woorigym/"+infoUrl);
//	               File directory = new File("https://umarine.dothome.co.kr/images");
//	               File directory = new File("https://cloudinary.com/console/c-7df1c4573ad22a712f4a8abe8c2eb9/media_library/folders/be4c1981d90944b7b5907e31e3b391e145");
//	               File directory = new File("C:\\Users\\user1\\Pictures\\데이터베이스구현\\20210810");
	               File directory = new File(getServletContext().getRealPath("product")+"/"+infoUrl);
	               File[] flist = directory.listFiles();
	               if(flist !=null) {
	                  for (File file: flist) {
	                     imagesFilePath.add("product"+"/"+infoUrl+"/"+file.getName());
	                     if(file.isDirectory()) {
	                        System.out.println("isDirectory?? 왜 체크하지?");
	                     }
	                  }
	                  vo.setImagesFilePath(imagesFilePath);
	               }//CARDIO-RN-0001-001
	            }
	         }
	      }
		request.setAttribute("productvolist", volist);
		String ViewPage = "/WEB-INF/productlist.jsp";
		request.getRequestDispatcher(ViewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
