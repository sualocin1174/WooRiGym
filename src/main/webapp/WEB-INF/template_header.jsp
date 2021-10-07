<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% String ctxPath = request.getContextPath(); %>
    <%@page import = "woorigym.user.model.vo.UserTable" %>
    <%
    UserTable u = (UserTable)session.getAttribute("user_id");
  %>
  <!-- 헤더 CSS -->
     <link rel="stylesheet" type="text/css" href="css/template_header.css"/>
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
				 var text = " <li><a href="#">"+data.user_name+"님</a></li>"
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
        <div class="container" id="nav">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">패키지
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">스미스짐 패키지</a></li>
                    <li><a href="#">멀티짐 패키지</a></li>
                    <li><a href="#">멀티랙 패키지</a></li>
                    <li><a href="#">벤치 패키지</a></li>
                    <li><a href="#">벤치프레스 패키지</a></li>
                    <li><a href="#">웨이트리프팅 패키지</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">근력기구
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">스미스짐</a></li>
                    <li><a href="#">멀티짐</a></li>
                    <li><a href="#">멀티랙</a></li>
                    <li><a href="#">벤치</a></li>
                    <li><a href="#">벤치프레스</a></li>
                    <li><a href="#">클럽용머신</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">유산소기구
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">런닝머신</a></li>
                    <li><a href="#">사이클</a></li>
                    <li><a href="#">로잉머신</a></li>
                    <li><a href="#">일립티컬</a></li>
                    <li><a href="#">샌드백</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">웨이브리프팅
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">덤벨</a></li>
                    <li><a href="#">케틀벨</a></li>
                    <li><a href="#">바벨</a></li>
                    <li><a href="#">플레이트(원판)</a></li>
                    <li><a href="#">정리대</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">어시스트
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">전체</a></li>
                    <li><a href="#">거꾸리</a></li>
                    <li><a href="#">트레이닝보조</a></li>
                    <li><a href="#">스트랩&패드</a></li>
                    <li><a href="#">매트</a></li>
                    <li><a href="#">튜빙밴드</a></li>
                    <li><a href="#">마사지</a></li>
                    <li><a href="#">케이블손잡이</a></li>
                    <li><a href="#">부속품</a></li>
                </ul>
              </div>
              <div class="dropdown">
              <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">전시상품
                  <!-- <span class="caret"></span> -->
                </button>
                  </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">세일
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">신상품</a></li>
                    <li><a href="#">프로모션</a></li>
                    <li><a href="#">예약주문</a></li>
                    <li><a href="#">라이프스타일</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">게시판
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">설치사례</a></li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">사용후기</a></li>
                    <li><a href="#">Q & A</a></li>
                    <li><a href="#">1:1문의</a></li>
                    <li><a href="#">개인결제창</a></li>
                </ul>
              </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">회원가입
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">주문</a></li>
                    <li><a href="#">나의페이지</a></li>
                </ul>
              </div>
        </div>
    </header>