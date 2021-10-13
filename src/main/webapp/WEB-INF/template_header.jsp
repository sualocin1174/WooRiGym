<%@page import="woorigym.user.model.vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 header가 아닌 메인페이지에 삽입 -->
    <% String ctxPath = request.getContextPath(); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    UserTable loginSS = (UserTable)session.getAttribute("loginSS");
    %>
    <!-- 공통헤더 템플릿입니다. css 작성금지 -->
<header>
        <div id="logo">
            <a href="<%=ctxPath %>/main"> <!-- 10/13 수정: 로고 클릭시 main으로 이동 -->
                <img src='./images/logo_simple_w 180x98.png' alt="로고"/><br>
            </a>
        </div>
        <c:if test="${loginSS == null}"> <!-- 10/13 수정: 로그인 여부 확인   --> 
        <span id="main_tnb1" class="tnb">
        <ul>
                <li><a href="<%=ctxPath %>/login" id="btnLogin">로그인</a></li>
                <li><a href="#">최근본상품</a></li>
            </ul>
        </span>
        </c:if>
   <c:if test="${loginSS != null}"><!-- 10/13 수정: 로그인 여부 확인   --> 
        <div id="main_tnb2" class="tnb"> 
        <ul>
            <li>${loginSS.user_name}님</li> <!-- 10월 13일  수정. -->
            <li><a href="<%=ctxPath %>/logout">로그아웃</a></li>
            <li><a href="<%=ctxPath %>/mypage" id="btnmy">마이페이지</a></li> 
            <li><a href="<%=ctxPath %>/sblist">장바구니</a></li>
            <li><a href="#">최근본상품</a></li>
        </ul>
    </div> 
    </c:if>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">

	<!-- 로그인 상태+마이페이지 버튼 클릭=마이페이지 접근가능 -->
  $("#btnmy").on('click',function(){
	  var a = "${loginSS}"; //"필수"
	  console.log(a);
	  if (a == ""){
		  alert("로그인 상태가 아닙니다.\n로그인 해주세요.");
		  //TODO: 로그인 페이지로 이동
		  location.href = "login";
	  } else{
		  // 해당 user_id의 마이페이지로 이동
		  location.href = "mypage";
	  }

  });
  </script>
        <div id="search_icon">
            <a href="<%=ctxPath %>/slist"> <!-- 2021.10.12 1차 내용수정 // /slist.ajax에서 /slist로 수정 -->
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
        <a href="login">로그인</a>
        <a href="#">회원가입</a>
        <a href="#">주문</a>
        <a href="#">나의페이지</a>
    </div>
  </div>
</div>
    </header>