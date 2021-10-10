 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 aside가 아닌 메인페이지에 삽입 -->

    <!-- 마이페이지 공통사이드 템플릿입니다. css 작성금지 -->
    <aside>
 <div id="side-menu">
     <ul>
         <li>마이페이지</li>
         <li><a href="<%=request.getContextPath()%>/orderlist" id="btnList">주문/배송조회</a></li>
         <li><a href="#">취소/교환/반품</a></li>
         <li><a href="#">상품 후기</a></li>
         <li><a href="#">쿠폰 관리</a></li>
         <li><a href="#">상품 문의(Q&A)</a></li>
     </ul>
 </div>
 
</aside>