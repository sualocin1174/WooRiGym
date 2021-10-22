 <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환/반품 신청폼</title>
<style>
 section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
       /* 교환/반품 신청 */
      section > h2 {
          margin: 20px;
          text-align: center;
      }
      .form_header {
          text-align: center;
          margin-bottom: 30px;
      }
      .form_header h3 {
      display: inline-block;
      margin: 10px 50px 0 0;
      }
      /* 신청서 작성 테이블 */
      	.step1 {
		  width: 850px;
          margin-bottom: 30px;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
        }
      	.step1 th{
      	padding: 10px;
      	}
        .step1 td {
        padding: 16px;
      	}
      	/* 다음 단계 버튼 */
      	#btngroup{
          text-align: center;
          margin-bottom: 20px;
      }
      	.nextbtn{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 25px 10px;
        transition-duration: 0.2s;
        cursor: pointer;
      	background: #006572;
      	color: white;
        border-radius: 5px;
        }

        .nextbtn:hover {
            background: #FEA500;
            color: white;
        }
   /* 상품 선택 */
        /*the container must be positioned relative:*/
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
 /* background-color: DodgerBlue;*/
 background: #FEA500;
}

/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/*선택 상자가 열려 있을 때 화살표를 위쪽으로*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}

/*style items (options):*/
.select-items {
  position: absolute;
 /* background-color: DodgerBlue;*/
  background-color: #FEA500;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/*선택 상자를 닫을 때 항목 숨기기*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
        /* 체크박스 */
        .container {
	  display: block;
	  position: relative;
	  padding-left: 35px;
	  margin-bottom: 12px;
	  cursor: pointer;
	  font-size: 1rem;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	/* Hide the browser's default radio button */
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	}
	/* Create a custom radio button */
	.checkmark {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 20px;
	  width: 20px;
	  background-color: #eee;
	  border-radius: 50%;
	}
	/* On mouse-over, add a grey background color */
	.container:hover input ~ .checkmark {
	  background-color: #ccc;
	}
	/* When the radio button is checked, add a blue background */
	.container input:checked ~ .checkmark {
	  background-color: #FEA500;
	}
	/* Create the indicator (the dot/circle - hidden when not checked) */
	.checkmark:after {
	  content: "";
	  position: absolute;
	  display: none;
	}
	/* Show the indicator (dot/circle) when checked */
	.container input:checked ~ .checkmark:after {
	  display: block;
	}
	/* Style the indicator (dot/circle) */
	.container .checkmark:after {
	 	top: 6px;
		left: 6px;
		width: 8px;
		height: 8px;
		border-radius: 50%;
		background: white;
	}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
	<h2>교환/반품 신청</h2>
	<div class="form_header">
	<h3>1) 신청서 작성</h3>
	<h3>2) 환불 정보 확인</h3>
	<h3>3) 신청 완료</h3>
	</div>
	
	<table class="step1">
		<tr>
			<th>상품 선택</th>
			<!--<td><select><option>X5 런닝머신</option></select></td>-->
			<td><div class="custom-select" style="width:200px;">
	<select>
    <option value="0">상품 선택</option>
    <!-- TODO: 구매한 상품에서 불러오기 -->
    <option value="1">웨이크보드</option>
    <option value="2">스피닝 사이클</option>
    <!-- <option value="3">Citroen</option>
    <option value="4">Ford</option>
    <option value="5">Honda</option>
    <option value="6">Jaguar</option>
    <option value="7">Land Rover</option>
    <option value="8">Mercedes</option>
    <option value="9">Mini</option>
    <option value="10">Nissan</option>
    <option value="11">Toyota</option>
    <option value="12">Volvo</option>  -->
  </select>
	</div></td>
		</tr>
		<tr>
			<th rowspan='8'>교환/반품 사유</th>
			<td><label class="container" for="reason1"><input type='radio' checked="checked" name="why" id="reason1">품질 불만<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason2"><input type='radio' name="why" id="reason2">구성품이 누락됨<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason3"><input type='radio' name="why" id="reason3">필요 없어짐<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason4"><input type='radio' name="why" id="reason4">상품이 설명과 다름<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason5"><input type='radio' name="why" id="reason5">상품이 파손됨<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason6"><input type='radio' name="why" id="reason6">오배송<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason7"><input type='radio' name="why" id="reason7">배송 중 분실<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason8"><input type='radio' name="why" id="reason8">그 외 기타<span class="checkmark"></span></label></td></tr>
		
		<tr>
			<th rowspan='2'>교환/반품 선택</th>
			<td><label class="container" for="exchange"><input type='radio' checked="checked" name='choice' id="exchange">교환<span class="checkmark"></span></label></td></tr>
			<tr><td><label class="container" for="refund"><input type='radio' name='choice' id="refund">반품<span class="checkmark"></span></label></td>
		</tr>
</table>
<!-- 2단계: 교환 -->
<table>
<tr>
<th>상품 회수 주소</th>
<td><a>배송지 목록</a></td>
</tr>
<tr>
<th>회수 시 요청사항</th>
<td><textarea></textarea></td>
</tr>
<tr>
<th>회수 예정일</th>
<td></td>
</tr>
</table>
<!-- 2단계: 반품 -->
<h3>환불 정보</h3>
<table>
<tr><th>상품 금액</th><td></td></tr>
<tr><th>배송비</th><td></td></tr>
<tr><th>반품비</th><td></td></tr>
<tr><th>환불 예상 금액</th><td></td></tr>
</table>
<!-- 3단계 -->
<h3>교환/반품 신청이 접수되었습니다.</h3>
<p>상품 회수 정보: 서울시 성동구 XX동</p>
<h3>회수 요청사항: 부재시 문 앞</h3>
<h3>상품 회수일: 9월 22일(수)</h3>

<div id="btngroup">
<a href="#" class="nextbtn">다음 단계</a>
<!-- 2단계 버튼 -->
<a href="#" class="nextbtn">이전 단계</a>
<a href="#" class="nextbtn">신청하기</a>
<!-- 3단계 버튼 -->
<a href="#">목록</a>
</div>
</section>
</body>
<script>
// 상품 선택
var x, i, j, l, ll, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < ll; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>
</html>