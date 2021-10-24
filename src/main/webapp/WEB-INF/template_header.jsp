<%@page import="woorigym.user.model.vo.UserTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl은 header가 아닌 메인페이지에 삽입 -->
    <% String ctxPath = request.getContextPath(); %>
    <!-- 공통헤더 템플릿입니다. css 작성금지 -->
<header>
        <div id="logo">
            <a href="<%=ctxPath %>/main"> <!-- 10/13 수정: 로고 클릭시 main으로 이동 -->
                <img src='./images/logo_simple_w 200x109.png' alt="로고"/><br><!-- 10/24 로고 크기 확대 -->
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
    </c:if> <!-- 21.10.23 검색버튼 네비게이션바로 이동 SH -->
 <div class="navbar"> <!-- 10/21 삭제: 패키지, 세일 -->
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
        <a href="#">일립티컬</a><!-- 10/21 샌드백 삭제 SH -->
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
        <a href="#">트레이닝보조</a>
        <a href="#">스트랩&패드</a>
        <a href="#">매트</a>
        <a href="#">튜빙밴드</a>
        <a href="#">마사지</a> <!-- 10/21 삭제: 거꾸리, 케이블손잡이, 부속품 SH-->
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">전시상품 </i></button>
    </div>
  <div class="subnav">
    <button class="subnavbtn">게시판 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">회사소개</a>
        <a href="#">설치사례</a>
        <a href="#">이벤트</a>
        <a href="#">공지사항</a>
        <a href="#">사용후기</a>
        <a href="#">Q & A</a> <!--  10/21 삭제: 1:1 문의, 개인결제창 SH -->
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">회원가입 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="<%=ctxPath %>/login">로그인</a> <!-- 10/15 수정: 현재경로를 뜻하는 ctxPath 추가 -->
        <a href="<%=ctxPath %>/join">회원가입</a>
        <a href="<%=ctxPath %>/orderlist">주문</a>
        <a href="<%=ctxPath %>/mypage">마이페이지</a>
    </div>
  </div>
  <form>
  <table>
  <tr> <!-- 21.10.23 추가 SH -->
		<td><input type="text" name="keyword" class="keyword_input" id="keyword_input_var" placeholder="상품명 입력"></td>
		<td><a href="<%=ctxPath %>/searchpage" class="button" id="searchBtn_var"><img src='./images/검색_돋보기.png' alt="검색" width="20px"/></a></td>
</tr>
</table>
</form>
</div>
    </header>