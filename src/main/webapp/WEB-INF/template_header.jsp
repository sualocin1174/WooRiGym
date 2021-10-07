<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 header가 아닌 메인페이지에 삽입 -->
    <% String ctxPath = request.getContextPath(); %>
    <%@page import = "woorigym.user.model.vo.UserTable" %>
    <%
    UserTable u = (UserTable)session.getAttribute("user_id");
  %>
    <!-- 공통헤더 템플릿입니다. css 작성금지 -->
<header>
u : <%=u %>
        <div id="logo">
            <a href="http://woorigym.dothome.co.kr/">
                <img src='./images/logo_simple_w 180x98.png' alt="로고"/><br>
            </a>
        </div>
  <%if (u == null){ %> <!-- 로그인 여부 확인 -->
        <span id="main_tnb1" class="tnb">
        <ul>
                <li><a href="<%=ctxPath %>/login" id="btnLogin">로그인</a></li>
                <li><a href="#">최근본상품</a></li>
            </ul>
        </span>
        <% } else { %> 
        <div id="main_tnb2" class="tnb">
        <ul>
            <li><%= u.getUser_name() %>님</li>
            <li><a href="<%=ctxPath %>/LogoutTemplate">로그아웃</a></li>
            <li><a href="<%=ctxPath %>/mypage" onclick="" id="btnmy">마이페이지</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">최근본상품</a></li>
        </ul>
    </div> <% } %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">

	<!-- 로그인 상태+마이페이지 버튼 클릭=마이페이지 접근가능 -->
  $("#btnmy").on('click',function(){
	
	 $.ajax({
		 type :"POST",
		 url : "mypage",
		 data : {
			 id : $("#").val()
		 },
		 dataType : "json",
		 success: function(data){
			 if(data.result = "ok"){
				 var text = " <li><a href='#'>"+data.user_name+"님</a></li>"
			 } else{
				 alert("로그인 상태가 아닙니다. 로그인 해주세요!"); 
			 };
		 },
		 error : function(request,status,error) { 
				alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error); 
	        } 
	 });
  });
  </script>
  
        <div id="search_icon">
            <a href="#">
                <img src='./images/검색_돋보기.png' alt="검색" width="18px"/><br>
            </a>
        </div>
 <div class="navbar">
  <div class="subnav">
    <button class="subnavbtn">패키지 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
      <a href="#">전체</a>
      <a href="#">스미스짐 패키지</a>
      <a href="#">멀티짐 패키지</a>
      <a href="#">멀티랙 패키지</a>
      <a href="#">벤치 패키지</a>
      <a href="#">벤치프레스 패키지</a>
      <a href="#">웨이트리프팅 패키지</a>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">근력기구 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">전체</a>
        <a href="#">스미스짐</a>
        <a href="#">멀티짐</a>
        <a href="#">멀티랙</a>
        <a href="#">벤치</a>
        <a href="#">벤치프레스</a>
        <a href="#">클럽용머신</a>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">유산소기구 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">전체</a>
        <a href="#">런닝머신</a>
        <a href="#">사이클</a>
        <a href="#">로잉머신</a>
        <a href="#">일립티컬</a>
        <a href="#">샌드백</a>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">웨이브리프팅 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">전체</a>
        <a href="#">덤벨</a>
        <a href="#">케틀벨</a>
        <a href="#">바벨</a>
        <a href="#">플레이트(원판)</a>
        <a href="#">정리대</a>
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">어시스트 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">전체</a>
        <a href="#">거꾸리</a>
        <a href="#">트레이닝보조</a>
        <a href="#">스트랩&패드</a>
        <a href="#">매트</a>
        <a href="#">튜빙밴드</a>
        <a href="#">마사지</a>
        <a href="#">케이블손잡이</a>
        <a href="#">부속품</a>
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">전시상품 </i></button>
    </div>
  <div class="subnav">
    <button class="subnavbtn">세일 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">신상품</a>
        <a href="#">프로모션</a>
        <a href="#">예약주문</a>
        <a href="#">라이프스타일</a>
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">게시판 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">회사소개</a>
        <a href="#">설치사례</a>
        <a href="#">이벤트</a>
        <a href="#">공지사항</a>
        <a href="#">사용후기</a>
        <a href="#">Q & A</a>
        <a href="#">1:1문의</a>
        <a href="#">개인결제창</a>
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">회원가입 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
        <a href="#">주문</a>
        <a href="#">나의페이지</a>
    </div>
  </div>
</div>
    </header>