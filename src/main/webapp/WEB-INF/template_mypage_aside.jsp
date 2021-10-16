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
     <!-- 쿠폰 Modal Box -->
            <div class="modal">
              <div class="modal-content">
                    <span class="close">&times;</span> <!-- 닫기 -->
                     <p>보유쿠폰 목록</p>
                     <ul>
                          <li id="c_name"></li>
                          <li id="c_discount"></li>
                          <li id="c_issue_date"></li>
                          <li id="c_expire_date"></li>
                     </ul>
              </div>
          </div>
 </div>
</aside>
<script>
        $("#btncoupon").click(function(){
           $(".modal").show(); 
        });
        $(".close").click(function(){
           $(".modal").hide(); 
        });
        $(window).on("click",function(e){
            console.log(e.target); 
            //방법 1
            //if(e.target == document.getElementById("modal-01")){};
            //방법 2
            if(e.target == $(".modal").get(0)){
                $(".modal").hide();
            }
        });
    </script>