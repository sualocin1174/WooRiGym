   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css"/>
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
    <title>우리짐 벤치페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* reset */
        * {
            margin: 0;
            padding: 0;
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
			top: 0;
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
		  padding: 5px 10px;
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
        border: 2px solid #2F4858;
        border-radius: 5px;
        }

        #searchBtn:hover {
        border: 2px solid #FEA500;
           background: #FEA500;
      	color: white;
        }
		/* 페이징 버튼 */
      	#paging{
      	text-align: center;
      	}
      	#paging a{
      	padding: 4px 4px 4px 8px;
      	margin: 5px;
      	background: #2F4858;
      	color: white;
      	}
      	#paging a:last-child {
      	padding: 4px 8px;
      	}
      	#paging a:hover{
      	background: #FEA500;
      	}
	/* 2021.10.22 추가완료 SH */
    </style> <!-- 2021.10.08 1차 추가완료 -->
    </head>
<body>

	<%@ include file="template_header.jsp"%> <!-- 2021-10-08 1차 추가시작 및 완료 -->
    <aside>
    </aside>
    <section>
    	<h2 id="productlist">벤치 상품목록</h2>
    	<div id="productItems"></div>
		<div id="paging"></div>
    </section>
    <footer>
    	<%@ include file="template_footer.jsp"%>
    </footer>
    <input type="text" id="parentlist" style="display: none;">
	<input type="text" id="childList" style="display: none;">
<script>
// 디버깅용
console.log("${startPage}");
console.log("${endPage}");
console.log("${pageCount}");
console.log($("#producttest").val());
</script>
    <script>
    var trashParam;
    var parentValue;
    var childValue;
    		
    $(".parent_category").click(function(){
    	trashParam = $(this).attr('id');
    	console.log(trashParam);
    });
    
    $(".child_category").click(function(){
    	trashParam = $(this).attr('id');
    	console.log(trashParam);
  		var newsDeleteList = [];
  		childValue = trashParam.filter(function(item){
       		return item !== "";
       	});
  		
  		$("#childList").val(childValue);
  		console.log(typeof childValue);
    });
    
    	$(document).ready(ajaxf1);
    	console.log($("#childList").val());
    	function ajaxf1() {
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/ppage",
				data: {
					childCategory: "BC"
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
		};
    
    	function resultHtml(data){
			var html="<table border='1' id='pageview'>";
			
			$.each(data.productlist, function(i, value){
				console.log(i);
				console.log(value);
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
			
			// 페이징
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
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/ppage",
				data: {
					childCategory: "BC"
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
    </script>
</body>
</html>