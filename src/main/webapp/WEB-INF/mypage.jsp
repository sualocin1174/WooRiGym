<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 마이페이지 메인</title>
    <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        /* 폰트 */
        /* @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap'); */
        @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap');
    </style>
    <style>
        /* reset */
        * {
            margin: 0;
            padding: 0;
        }

        /* header */
        header {
            width: 1200px;
            /* margin: 0 auto; */
            /* margin-right: 0;; */
            height: 160px;
            position: relative;
            padding: 30px;
        }

        a {
            color: #BDBDBD;
            text-decoration: none;
        }

        a:link {
            text-decoration: none;
        }

        a:hover {
            color: #333;
            text-decoration: none;
        }

        ul {
            list-style-type: none;
            position: relative;
        }

        #nav.container {
            text-align: center;
            padding: 15px;
            width: 1200px;
            height: 62px;
        }

        #nav li {
            display: inline-block;
            padding: 0px 15px;
        }

        /* 마우스 오버 시 하위메뉴 노출 */
        #nav .dropdown:hover .dropdown-menu {
            display: inline-block;
            /* margin: 0; */
            /* width: 100%; */
        }


        /* 상단바 가로 정렬 */
        .dropdown {
            display: inline-block;
            position: relative;
            /* top: 10px; */
        }

        /* 상단바 테두리 없애기 */
        .btn {
            border: 0px;
            padding: 10;
        }
         /* 로그인 전 후 화면 다름 시작 */
        #main_tnb {
            position: absolute;
            top: 10px;
            bottom: 10px;
            right: 35px;
            margin: 10px;
            overflow: hidden;
            width: 400px;
            height: 100px;
        }

        #main_tnb>ul>li {
            display: inline-block;
            padding: 5px;
            /* border: 1px solid black; */
        }

        /* OOO님 | 로그아웃 | 장바구니 | 최근본상품 */
        #main_tnb li::after {
            padding-left: 15px;
            content: "|";
        }
        #main_tnb li:last-child::after {
            padding-left: 15px;
            content: "";
        }
         /* 로그인 전 후 화면 다름  끝*/

        #search_icon a {
            position: absolute;
            top: 10px;
            right: 50px;
            margin: 15px;
            width: 25px;
            height: 25px;
        }
    </style>
    <style>
        /* content */
        section {
            width: 900px;
            padding: 30px 0 30px 0;
            position: relative;
            bottom: 150px;
            left: 300px;
        }
        aside {
            padding: 30px 0 0 30px;
        }
    </style>
</head>

<body>
<header>
    <div id="logo">
        <a href="http://woorigym.dothome.co.kr/">
            <img src='./images/logo_simple_w 180x98.png' alt="로고"/><br>
        </a>
    </div>
    <div id="main_tnb">
        <ul>
            <li><a href="#">OOO님</a></li>
            <li><a href="#">로그아웃</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">최근본상품</a></li>
        </ul>
    </div>
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
                <!-- <li class="dropdown-header">Dropdown header 1</li> -->
                <li><a href="#">전체</a></li>
                <li><a href="#">스미스짐 패키지</a></li>
                <li><a href="#">멀티짐 패키지</a></li>
                <li><a href="#">멀티랙 패키지</a></li>
                <li><a href="#">벤치 패키지</a></li>
                <li><a href="#">벤치프레스 패키지</a></li>
                <li><a href="#">웨이트리프팅 패키지</a></li>
                <!-- <li class="divider"></li> -->
                <!-- <li class="dropdown-header">Dropdown header 2</li> -->
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
<aside>
    <div>
        <ul>
            <li><a href="#">마이페이지</a></li>
            <li><a href="#">주문/배송조회</a></li>
            <li><a href="#">취소/교환/반품</a></li>
            <li><a href="#">상품 후기</a></li>
            <li><a href="#">쿠폰 관리</a></li>
            <li><a href="#">상품 문의(Q&A)</a></li>
        </ul>
    </div>
</aside>
<section>
    <h1>ooo님 즐거운 쇼핑 되세요!</h1>
    <a href="#">회원정보 수정 ></a><hr>
<table>
    <tr>
        <td colspan="2">쿠폰</td>
        <td colspan="2">적립금</td>
    </tr>
    <tr>
        <td>보유 쿠폰</td>
        <td>0장</td>
        <td>보유 적립금</td>
        <td>0P</td>
    </tr>
    <tr>
        <td>소멸 예정 쿠폰</td>
        <td>0장</td>
        <td>소멸 예정 적립금</td>
        <td>0P</td>
    </tr>
</table>
</section>

<footer>

</footer>
</body>

</html>