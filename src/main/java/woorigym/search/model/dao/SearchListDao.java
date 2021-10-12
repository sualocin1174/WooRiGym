package woorigym.search.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.common.jdbcTemplate;
import woorigym.product.model.vo.ProductTable;

public class SearchListDao {
	// 2021.10.12 1차 추가시작
	public ProductTable getProductNo(Connection conn, String productNo) {
		System.out.println("getProductNo 1");
		ProductTable vo = null;
		String sql = "select productNo"
				+ " from product where productNo = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("getProductNo executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productNo);
			rset = pstmt.executeQuery();
			System.out.println("getProductNo executeQuery 2");
			if (rset.next()) {
				vo = new ProductTable();
				vo.setProductNo(rset.getString("product_No"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return vo;
	}
	
	public ArrayList<ProductTable> searchProductList(Connection conn, int start, int end) {
		System.out.println("searchProductList 1");
		ArrayList<ProductTable> productlist = null;
		String sql = "select *"
				+ " from (select rownum r, t1.*"
				+ "      from(select *"
				+ "           from Product"
				+ "           )"
				+ "      t1) t2"
				+ " where r between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			System.out.println("searchProductList executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			System.out.println("searchProductList executeQuery 2");
			if (rset.next()) {
				System.out.println("searchProductList executeQuery over 1");
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rset.getString("product_info_url"));
					vo.setProductName(rset.getString("product_name"));
					vo.setProductOption(rset.getString("product_option"));
					vo.setPrice(rset.getInt("price"));
					productlist.add(vo);			
					System.out.println("searchProductList executeQuery over 2");
				} while (rset.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("searchProductList 2" + productlist);
		return productlist;
	}
	// 2021.10.12 1차 추가완료
	
	// 2021.10.11 추가시작
	public int getProductListCount(Connection conn) {
		int result = 0;
		String sql = "select count(product_no) from product";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rset);
			jdbcTemplate.close(pstmt);
		}
		return result;
	}
	// 2021.10.11 추가완료	

	// 2021.10.07 추가
	public ArrayList<ProductTable> productSearch(Connection conn, ProductTable searchKeyVo) {
		System.out.println("productSearch 1");
		System.out.println(searchKeyVo);

		ArrayList<ProductTable> productlist = null;
		// 2021.10.11 1차 내용수정 시작
		String sql = "select p.product_info_url, p.product_name, p.product_option, p.price, p.product_no, count(o.buy_quantity), sum(r.score)"
				+ " from product p"
				+ " inner join order_detail o on p.product_no = o.product_no"
				+ " inner join review r on o.order_detail_no = r.order_detail_no";
		// 2021.10.11 1차 내용수정 완료
		
		String productName = searchKeyVo.getProductName();
		String parentCategory = searchKeyVo.getParentCategory();
		String selectRank = searchKeyVo.getSelectRank(); // 2021.10.11 1차 내용추가
		String childCategory = searchKeyVo.getChildCategory();	
		int minPrice = searchKeyVo.getMinPrice();
		int maxPrice = searchKeyVo.getMaxPrice();
		boolean flag = false;

		// 2021.10.11 1차 내용수정 시작
		if (productName != null && !productName.equals("")) {
			if (!flag) {
				sql += " where ";
				flag = true;
			} else {
				sql += " and ";
			}
			sql += " p.product_name like '%" + productName + "%'";
		}
		if (parentCategory != null && !parentCategory.equals("")) {
			if (!flag) {
				sql += " where ";
				flag = true;
			} else {
				sql += " and ";
			}
			sql += " p.parent_category like '%" + parentCategory + "%'";
		}
		if (childCategory != null && !childCategory.equals("")) {
			if (!flag) {
				sql += " where ";
				flag = true;
			} else {
				sql += " and ";
			}
			sql += " p.child_category like '%" + childCategory + "%'";
		}
		if (minPrice >= 0 || maxPrice >= 0) {
			if (!flag) {
				sql += " where ";
				flag = true;
			} else {
				sql += " and ";
			}
			sql += " p.price between " + minPrice + " and " + maxPrice;
		}
		if (selectRank != null && selectRank.equals("인기순")) {
				sql += " group by p.product_info_url, p.product_name, p.product_option, p.price, p.product_no"
						+ " order by count(o.buy_quantity) desc";
		}
		else if (selectRank != null && selectRank.equals("평점순")) {
				sql += " group by p.product_info_url, p.product_name, p.product_option, p.price, p.product_no"
						+ " order by sum(r.score) desc";
		}
		// 2021.10.11 1차 내용수정 완료
		System.out.println(sql);

		//
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			System.out.println("productSearch executeQuery 1");
			pstmt = conn.prepareStatement(sql);
			rest = pstmt.executeQuery();
			System.out.println("productSearch executeQuery 2");
			if (rest.next()) {
				System.out.println("productSearch executeQuery over 1");
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rest.getString("product_info_url"));
					vo.setProductName(rest.getString("product_name"));
					vo.setProductOption(rest.getString("product_option"));
					vo.setPrice(rest.getInt("price"));
					productlist.add(vo);
					System.out.println("productSearch executeQuery over 1++");
				} while (rest.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rest);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("productlist 2" + productlist);
		return productlist;
	}
	// 2021.10.07 추가완료

	// TODO
	// 상품명검색 메소드
	public ArrayList<ProductTable> productSearch(Connection conn, String productName) {
		ArrayList<ProductTable> productlist = null;
		String sql = "select product_info_url, product_name, product_option, price"
				+ " from product where product_name like '% ? %'";
		// ?는 searchpage.jsp에서 텍스트를 입력받아와야함
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rest.getString("product_info_url"));
					vo.setProductName(rest.getString("product_name"));
					vo.setProductOption(rest.getString("product_option"));
					vo.setPrice(rest.getInt("price"));
					productlist.add(vo);
				} while(rest.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rest);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("productlist 리턴은 " + productlist);
		return productlist;
	}

	// 2021-10-07 추가
	// 가격 범위 검색 메소드
	public ArrayList<ProductTable> priceSearch(Connection conn, int minprice, int maxprice) {
		ArrayList<ProductTable> productlist = null;
		String sql = "select product_info_url, product_name, product_option, price"
				+ " from product where price between ? and ?";
		// ?는 searchpage.jsp에서 숫자를 입력받아와야함(첫번째는 최소금액 두번째는 최대금액 숫자로 입력한걸 받아와야함)
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, minprice);
			pstmt.setInt(1, maxprice);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rest.getString("product_info_url"));
					vo.setProductName(rest.getString("product_name"));
					vo.setProductOption(rest.getString("product_option"));
					vo.setPrice(rest.getInt("price"));
					productlist.add(vo);
				} while(rest.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rest);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("productlist 리턴은 " + productlist);
		return productlist;
	}
	
	// 인기(주문)순위별 검색 메소드
	public ArrayList<ProductTable> buyRankSearch(Connection conn) {
		ArrayList<ProductTable> productlist = null;
		String sql = "select p.product_info_url, p.product_name, p.product_option, p.price, p.product_no, count(o.buy_quantity)"
				+ " from product p join order_detail o"
				+ " on p.product_no = o.product_no"
				+ " group by p.product_info_url, p.product_name, p.product_option, p.price, p.product_no"
				+ " order by count(o.buy_quantity) desc";
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rest = pstmt.executeQuery();
			if(rest.next()) {
				productlist = new ArrayList<ProductTable>();
				do {
					ProductTable vo = new ProductTable();
					vo.setProductInfoUrl(rest.getString("product_info_url"));
					vo.setProductName(rest.getString("product_name"));
					vo.setProductOption(rest.getString("product_option"));
					vo.setPrice(rest.getInt("price"));
					productlist.add(vo);
				} while(rest.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcTemplate.close(rest);
			jdbcTemplate.close(pstmt);
		}
		System.out.println("productlist 리턴은 " + productlist);
		return productlist;
	}
	
	// 평점순위별 검색 메소드
			public ArrayList<ProductTable> scoreRankSearch(Connection conn) {
				ArrayList<ProductTable> productlist = null;
				String sql = "select p.product_info_url, p.product_name, p.product_option, p.price, p.product_no, sum(r.score)"
						+ " from product p inner join order_detail o"
						+ " on p.product_no = o.product_no"
						+ " inner join review r"
						+ " on o.order_detail_no = r.order_detail_no"
						+ " group by p.product_info_url, p.product_name, p.product_option, p.price, p.product_no"
						+ " order by sum(r.score) desc";
				PreparedStatement pstmt = null;
				ResultSet rest = null;
				try {
					pstmt = conn.prepareStatement(sql);
					rest = pstmt.executeQuery();
					if(rest.next()) {
						productlist = new ArrayList<ProductTable>();
						do {
							ProductTable vo = new ProductTable();
							vo.setProductInfoUrl(rest.getString("product_info_url"));
							vo.setProductName(rest.getString("product_name"));
							vo.setProductOption(rest.getString("product_option"));
							vo.setPrice(rest.getInt("price"));
							productlist.add(vo);
						} while(rest.next());
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					jdbcTemplate.close(rest);
					jdbcTemplate.close(pstmt);
				}
				System.out.println("productlist 리턴은 " + productlist);
				return productlist;
			}
	
	// 카테고리별 검색 메소드
		public ArrayList<ProductTable> categorySearch(Connection conn) {
			ArrayList<ProductTable> productlist = null;
			String sql = "select product_info_url, product_name, product_option, price"
					+ " from product"
					+ " where parent_category like ' ? '";
			// ?는 searchpage.jsp에서 선택된 옵션값을 받아와야함
			PreparedStatement pstmt = null;
			ResultSet rest = null;
			try {
				pstmt = conn.prepareStatement(sql);
				rest = pstmt.executeQuery();
				if(rest.next()) {
					productlist = new ArrayList<ProductTable>();
					do {
						ProductTable vo = new ProductTable();
						vo.setProductInfoUrl(rest.getString("product_info_url"));
						vo.setProductName(rest.getString("product_name"));
						vo.setProductOption(rest.getString("product_option"));
						vo.setPrice(rest.getInt("price"));
						productlist.add(vo);
					} while(rest.next());
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				jdbcTemplate.close(rest);
				jdbcTemplate.close(pstmt);
			}
			System.out.println("productlist 리턴은 " + productlist);
			return productlist;
		}
	// 2021-10-07 추가완료
	
}