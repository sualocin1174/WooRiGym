 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 aside가 아닌 메인페이지에 삽입 -->

    <!-- 마이페이지 공통사이드 템플릿입니다. css 작성금지 -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    <script>
    
    window.onload = pageLoadedHandler;
    function pageLoadedHandler(){
    	couponFunction();
    	$("#btncoupon").on("click", ajaxC1);
    	ajaxC1();
    }
    
    function ajaxC1(){// 쿠폰관리 버튼 클릭 시
    	// TODO: 유효성검사 (선택사항)
    	console.log("ajax 시작");
    	var c_name = $("#c_name").val();
    	var c_discount = $("#c_discount").val();
    	var c_issue_date = $("#c_issue_date").val();
    	var c_expire_date = $("#c_expire_date").val();
    	$.ajax({
    		type: "post",
    		//데이터를 전송할 URL
    		url : "<%=request.getContextPath()%>/couponlist" ,
			//서버에 전송할 데이터, key:value
			data : {
				c_name: c_name,
				c_discount:   c_discount,
				c_issue_date:  c_issue_date ,
				c_expire_date:   c_expire_date
			} ,
			//서버가 리턴하는 데이터 타입
			dataType : "json",
			//ajax 통신에 성공했을 때 호출될 이벤트 핸들러
			success : function(data){
				//확인용
				console.log(data);
    			console.log(data.length);
    			
				if(data!=null){
					var couponlist = "";
					for(var i=0; i<data.length;i++){
						console.log(data[i]);
					}
				} else {
					
				}
			},
			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
				}
			});
		}
    
    var request = new XMLHttpRequest();
    function couponFunction(){
    	request.open("Post","./CouponListServlet?user_id="+encodeURIComponent(document.getElementById("user_id").value),true);
    	request.onreadystatechange = couponProcess;
    	request.send(null);
    }
    
    function couponProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		//통신 성공여부 확인
		if(request.readyState == 4 && request.status == 200){
			var object = eval('('+request.responseText+')'); //Json
			var result = object.result; //쿠폰서블릿의 result라는 변수
			for(var i=0;i<result[i].length;i++){
				//현재 테이블에 행 추가
				var row = table.insertRow(0);
				//각각의 행에 해당 유저의 쿠폰정보 추가
				for(var j=0;j<result[i].length;j++){
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
					
				}
			}
		}
	}
    
    // 쿠폰 모달창
    var popup = document.querySelectorAll('.gallery img'),
    lightbox = document.querySelector('#')
    </script>
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