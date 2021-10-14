 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 aside가 아닌 메인페이지에 삽입 -->

    <!-- 마이페이지 공통사이드 템플릿입니다. css 작성금지 -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    
    <aside>
 <div id="side-menu">
     <ul>
         <li>마이페이지</li>
         <li><a href="<%=request.getContextPath()%>/orderlist" id="btnList">주문/배송조회</a></li>
         <li><a href="#">취소/교환/반품</a></li>
         <li><a href="#">상품 후기</a></li>
         <li><a href="#" id="btncoupon" class="btnC">쿠폰 관리</a></li>
         <li><a href="#">상품 문의(Q&A)</a></li>
     </ul>
       </div>
      <div id="ajaxTable">
            <!-- <div class="popup" id="pop1"> --> 
             <div class="popup" id="lightbox-overlay">
               <a href="#">닫기</a>
               <p>보유 쿠폰 목록</p>
               <ul>
                <li id="c_name"></li>
                <li id="c_discount"></li>
                <li id="c_issue_date"></li>
                <li id="c_expire_date"></li>
               </ul>
            </div>
            <!--모달창 어두운 배경 레이어-->
            <!-- <div class="dim"></div> -->
 </div>

</aside>