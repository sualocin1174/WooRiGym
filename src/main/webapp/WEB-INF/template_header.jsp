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
        <a href="<%=ctxPath %>/ppage" class="parent_category" id="근력기구">전체</a>
        <a href="<%=ctxPath %>/productsjpage" class="child_category" id="SJ">스미스짐</a>
        <a href="<%=ctxPath %>/productmjpage" class="child_category" id="MJ">멀티짐</a>
        <a href="<%=ctxPath %>/productmlpage" class="child_category" id="ML">멀티랙</a>
        <a href="<%=ctxPath %>/productbcpage" class="child_category" id="BC">벤치</a>
        <a href="<%=ctxPath %>/productbppage" class="child_category" id="BP">벤치프레스</a>
        <a href="<%=ctxPath %>/productcmpage" class="child_category" id="CM">클럽용머신</a>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">유산소기구 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="<%=ctxPath %>/productotpage" class="parent_category" id="유산소기구">전체</a>
        <a href="<%=ctxPath %>/productrnpage" class="child_category" id="RN">런닝머신</a>
        <a href="<%=ctxPath %>/productccpage" class="child_category" id="CC">사이클</a>
        <a href="<%=ctxPath %>/productrwpage" class="child_category" id="RW">로잉머신</a>
        <a href="<%=ctxPath %>/productetpage" class="child_category" id="ET">일립티컬</a><!-- 10/21 샌드백 삭제 SH -->
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">웨이브리프팅 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="<%=ctxPath %>/productwlpage" class="parent_category" id="웨이브리프팅">전체</a>
        <a href="<%=ctxPath %>/productdbpage" class="child_category" id="DB">덤벨</a>
        <a href="<%=ctxPath %>/productcbpage" class="child_category" id="CB">케틀벨</a>
        <a href="<%=ctxPath %>/productbbpage" class="child_category" id="BB">바벨</a>
        <a href="<%=ctxPath %>/productplpage" class="child_category" id="PL">플레이트(원판)</a>
        <a href="<%=ctxPath %>/productorpage" class="child_category" id="OR">정리대</a>
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn">어시스트 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="<%=ctxPath %>/productasstpage" class="parent_category" id="어시스트">전체</a>
        <a href="<%=ctxPath %>/productaspage" class="child_category" id="AS">트레이닝보조</a>
        <a href="<%=ctxPath %>/productsppage" class="child_category" id="SP">스트랩&패드</a>
        <a href="<%=ctxPath %>/productmtpage" class="child_category" id="MT">매트</a>
        <a href="<%=ctxPath %>/producttbpage" class="child_category" id="TB">튜빙밴드</a>
        <a href="<%=ctxPath %>/productmgpage" class="child_category" id="MG">마사지</a> <!-- 10/21 삭제: 거꾸리, 케이블손잡이, 부속품 SH-->
    </div>
  </div>
  <div class="subnav">
    <button class="subnavbtn" class="parent_category" id="전시상품">전시상품 </i></button>
    </div>
  <div class="subnav">
    <button class="subnavbtn">게시판 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
        <a href="#">회사소개</a>
        <a href="#">설치사례</a>
       <!--   <a href="#">이벤트</a> -->
        <a href="NoticeBoarderServlet">공지사항</a>
       <!--  <a href="#">사용후기</a> --> 
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
		<!--  <td><input type="text" name="keyword" class="keyword_input" id="keyword_input_var" placeholder="상품명 입력"></td> -->
		<td><a href="<%=ctxPath %>/searchpage" class="button" id="searchBtn_var"><img src='./images/검색_돋보기.png' alt="검색" width="20px"/></a></td>
</tr>
</table>
</form>
</div>
    </header>