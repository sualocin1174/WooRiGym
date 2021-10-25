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
         <li><a href="<%=request.getContextPath()%>/clist">취소/교환/반품</a></li>
         <li><a href="#">상품 후기</a></li>
         <li><a href="#" id="btncoupon" class="btnC">쿠폰 관리</a></li>
         <li><a href="<%=request.getContextPath()%>/qnalist">상품 문의(Q&A)</a></li>
     </ul>
     <!-- 쿠폰 Modal Box -->
            <div class="modal">
              <div class="modal-content">
                    <span class="close">&times;</span> <!-- 닫기 -->
                     <h3>보유쿠폰 리스트</h3>
                     <br>
                     <table class="modal-coupon">
                        <!-- 쿠폰리스트 -->
                     </table>
              </div>
          </div>
 </div>
</aside>
<script>
        $("#btncoupon").click(function(){
           $(".modal").show(); 
	console.log("ajax 시작show");
	ajaxC1(); //이벤트함수 호출
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
  //마이페이지.jsp에 넣으면 함수 인식이 안되서 여기에 붙임.
window.onload = pageLoadedHandler;
function pageLoadedHandler(){
	console.log($("#btncoupon"));
}

function ajaxC1(){// 쿠폰관리 버튼 클릭 시
	// TODO: 유효성검사 (선택사항)
	console.log("ajax 시작");
	console.log("<%=session.getAttribute("loginSS")%>");
	var loginSS = "<%=session.getAttribute("loginSS")%>";
//레스트API CRUD 관점에서 해석
//get 단순조회 , post 인서트할때, put 업데이트
	$.ajax({
		type: "post", //서블릿은 post
		//데이터를 전송할 URL
		url : "<%=request.getContextPath()%>/couponlist" ,
		data: {loginSS : loginSS},
		dataType: "json",
		//ajax 통신에 성공했을 때 호출될 이벤트 핸들러
		success : function(data){
			//확인용
			console.log(data);
			console.log(data.length);
			
			if(data!=null){
				var couponlist = "";
				for(var i=0; i<data.length;i++){
					console.log(data[i]);
					couponlist += "<tr><td colspan='2'>["+data[i].c_name+"]</td></tr>"
						+"<tr><td>할인금액</td><td>"+data[i].c_discount+"원</td></tr>"
						+"<tr><td>발급일</td><td>"+data[i].c_issue_date+"</td></tr>"
						+"<tr><td>만료일</td><td>"+data[i].c_expire_date+"</td></tr>";
				}
				$(".modal-coupon").html(couponlist);
			} else {
				var empty = "<li>보유한 쿠폰이 없습니다</li>";
				$(".modal-coupon").html(empty);
			}
		},
		error : function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
			"\n"+"error:"+error);
			}
		});
	}
</script>