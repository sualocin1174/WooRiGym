<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 검색페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* reset */
        * {
            margin: 0;
            padding: 0;
        }
        body{
        font-family: 'Noto Sans KR', sans-serif;
        }
      	/* On smaller screens, decrease text size */
			@media only screen and (min-width: 960px) and (max-width: 1200px){
			  .text {font-size: 11px}
			}
    </style>
    <style> /* 2021.10.08 1차 추가시작 */
        /* content */
        section {
            width: 900px;
            padding: 30px 0 30px 0;
            position: relative;
            bottom: 170px;
            left: 300px;
        }
        aside {
            padding: 30px 0 0 30px;
        }
		
		div#searchmenubar > div {
			padding: 30px 0 0 30px;
			float: left;
		}

		h2#productlist {
			/* padding-top: 250px; */
			text-align: center;
		}
		
		/* 2021.10.11 1차 추가시작 */
		section {
			position: relative; 
			top: 100px;
			text-align: center;
		}
		/* 2021.10.11 1차 추가완료 */
        /* 2021.10.22 추가시작 SH */
        /* 검색 테이블 */
        #search_detail th {
        padding: 10px;
        }
        /* 상품명 입력*/
        #search_
        detail td:last-child {
        width: 330px; /* 간격 맞추려고 width 설정 TODO: 간격 이쁘게 맞추기 */
        padding: 16px;
        }
        #price {
        width: 400px;
        }
        .custom-select {
		  position: relative;
		  font-family: Arial;
		}
		
		.custom-select select {
		  display: none; /*hide original SELECT element:*/
		}
		
		.select-selected {
		background-color: #DFE0DF;
        color: black;
		 border: 2px solid #DFE0DF;
        border-radius: 5px;
		
		}
		/*삼각형*/
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
		  /*카테고리별 검색 - 옵션*/
		  color: black;
		  padding: 5px 10px;
		  border: 1px solid transparent;
		  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
		  cursor: pointer;
		  user-select: none;
		}
		
		/*style items (options):*/
		.select-items {
		  position: absolute;
		  background-color: #FFF8F0;
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
		/* 선택목록 끝 */
		input,
		.btn {
		  padding: 8px;
		  border-radius: 4px;
		  opacity: 0.85;
		  display: inline-block;
		  font-size: 1rem;
		  line-height: 20px;
		  text-decoration: none;
		}
		input{
		border: 2px solid #e7e7e7;
		}
		
		input:hover,
		.btn:hover {
		  opacity: 1;
		}
		/* 최소금액 ~ 최대금액 */
		.price_input {
		width: 150px;
		}
		/* 검색 버튼*/
		#searchBtn{
      	padding: 6px 32px;
        margin: 4px 2px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        transition-duration: 0.3s;
        cursor: pointer;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        border-radius: 5px;
        }

        #searchBtn:hover {
          background-color: #555555;
        color: white;
        }
		/* 페이징 버튼 */
      	#pageview{
      	text-align: center;
      	}
      	#pageview a{
      	padding: 4px 4px 4px 8px;
      	margin: 5px;
      	background: #2F4858;
      	color: white;
      	}
      	#pageview a:last-child {
      	padding: 4px 8px;
      	}
      	#pageview a:hover{
      	background: #FEA500;
      	}
	/* 2021.10.22 추가완료 SH */
    </style> <!-- 2021.10.08 1차 추가완료 -->
    </head>
<body>

	<%@ include file="template_header.jsp"%> <!-- 2021-10-08 1차 추가시작 및 완료 -->
    <aside>
		<form>
			<div id="searchmenubar">
				<table id='search_detail'> <!-- 2021-10-22 div 삭제 후 table로 교체 SH -->
				<tr>
				<th>카테고리별 검색</th>
				<td><div class="custom-select" style="width:140px;">
				<select name="category" id="category">
						<option value="">선택목록</option>
						<option value="근력기구">근력기구</option>
						<option value="어시스트">어시스트</option>
						<option value="웨이트리프팅">웨이트리프팅</option>
						<option value="유산소기구">유산소기구</option>
						<option value="전시상품">전시상품</option>
					</select>
				</div></td>
				<th>순위별 검색</th>
				<td><div class="custom-select" style="width:140px;">
				<select name="rank" id="rank">
						<option value="">선택목록</option>
						<option value="인기순">인기순</option>
						<option value="평점순">평점순</option>
					</select>
					</div></td>
					<td id=""><input type="text" name = "minprice" class="price_input" id="minprice_input" placeholder="최소금액"> ~ 
					<input type="text" name = "maxprice" class="price_input" id="maxprice_input" placeholder="최대금액"> 원</td>
					<!-- 2021.10.11 1차 내용수정 -->
					<td><input type = "text" name = "keyword" class = "keyword_input" id = "keyword_input" placeholder="상품명 입력">
					<input type = "button" class = "button" id = "searchBtn" value = "검색"> <!-- 2021.10.07 추가 --></td>
				</tr>
				</table>
			</div>
		</form>
		<!-- <button type="submit" class="btn_search">검색</button>  2021.10.07 삭제-->
    </aside>
    <section>
    	<h2 id="productlist">상품목록</h2> <!-- 2021.10.08 1차 내용추가 및 추가완료 -->
    	<!-- 2021.10.11 1차 추가완료 -->
    	<div id="productItems"></div>  <!-- 2021.10.22 추가 SH -->
		<div id="paging"></div> <!-- 2021.10.22 추가 SH -->
    </section>
    <footer>
    <%@ include file="template_footer.jsp"%>
    </footer>
<script>
// 디버깅용
console.log("${startPage}");
console.log("${endPage}");
console.log("${pageCount}");
</script>
    <script>
    /* 2021-10-07 수정 */
    	$("#searchBtn").click( function () {
			/* 2021.10.11 1차 내용삭제시작 // 상품명 검색을 안해도 카테고리나 금액 순위로 검색할 수 있기때문에 삭제함
			if($("#keyword_input").val() == "") {
				alert("상품명을 검색창에 입력 후 검색버튼을 눌러주세요");
				return;
			} 
			2021.10.11 1차 내용삭제완료*/
			console.log($("#minprice_input").val());
			console.log($("#maxprice_input").val());
			//console.log(${product_img});
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/slist.ajax",
				data: {
					/* 2021.10.11 1차 수정시작 */
					productName : $("#keyword_input").val(),
					parentCategory: $("#category option:selected").val(),
					selectRank: $("#rank option:selected").val(), 
					/* childCategory: "", */
					minPrice: $("#minprice_input").val(),
					maxPrice: $("#maxprice_input").val()
					/* 2021.10.11 1차 수정완료 */
				},
				datatype:"json",
				success: function(data){
					console.log(data.product_img);
					console.log(data.product_test);
					//console.log(data.product_test.index());
					console.log(data);
					/* for(var i = 0 ; i < data.productlist.lehgth; i++) {
						console.log(data.productlist[i].productName);
					} */
					alert("상품이 검색되었습니다."); /* 2021.10.11 1차 내용수정 */
					resultHtml(data);
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
			});
		});
    
    	function resultHtml(data){
			var html="<table border='1' id='pageview'>";
				
			/* var test_img;
			$.each(data.product_img, function(a, img){
				console.log(a);
				console.log(img);
					test_img = img;			
				}); */
			$.each(data.productlist, function(i, value){
				console.log(i);
				console.log(value);
				// console.log(data.product_img);
					html += "<tr>";
					html += "<td>이미지 : <img src="+value.imagesFilePath+" width='200' height='200'><br>";
					html += "상품명 : " + value.productName + "<br>";
					html += "옵션 : " + value.productOption + "<br>";
					html += "가격 : " + value.price + "<br>";
					html += "적립금 : " + value.price*0.05 + "<br><br>";
					html += "</td></tr>";
			});
			html += "</table>";
			$("#productItems").empty(); 
			$("#productItems").append(html);
			
			
			/* 2021-10-22 추가 paging */
			$("#paging").empty();
			var pageHtml = "";
			if(data.startPage>1){
				pageHtml+='<a href="javascript:clickBtnPage('+data.startPage+');"> 이전 </a>';
			}
			for(var i=data.startPage; i<=data.endPage; i++){
				pageHtml+='<a href="javascript:clickBtnPage('+i+');"> '+i+'</a>';
			}
			if(data.endPage < data.pageCount){
				pageHtml+='<a href="javascript:clickBtnPage('+data.endPage+');"> 다음 </a>';
			}
			$("#paging").append(pageHtml);
		}
    	
    	
    	function clickBtnPage(selectedPageNum) {
			console.log($("#minprice_input").val());
			console.log($("#maxprice_input").val());
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/slist.ajax",
				data: {
					/* 2021.10.11 1차 수정시작 */
					productName : $("#keyword_input").val(),
					parentCategory: $("#category option:selected").val(),
					selectRank: $("#rank option:selected").val(), 
					/* childCategory: "", */
					minPrice: $("#minprice_input").val(),
					maxPrice: $("#maxprice_input").val()
					/* 2021.10.11 1차 수정완료 */
					, pagenum: selectedPageNum					
				},
				datatype:"json",
				success: function(data){
					console.log(data);
					for(var i = 0 ; i < data.productlist.lehgth; i++) {
						console.log(data.productlist[i].productName);
					}
					resultHtml(data);
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
			});
		}
    	
    	/* 2021-10-07 수정완료 */
    	
    	
    	
    	
    	
    	
    	
    	
    	/*2021-10-22 추가 SH*/
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
</body>
</html>