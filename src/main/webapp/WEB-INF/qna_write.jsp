<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 푸터 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의(Q&A) 작성</title>
<style>
  /* reset */
        * {
            margin: 0;
            padding: 0;
        }
  body{
        font-family: 'Noto Sans KR', sans-serif;
        }
     section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
   /* 상품문의(Q&A) */
      section > h2 {
          margin: 20px;
          text-align: center;
      }
   #btngroup{
          text-align: center;
          margin-bottom: 20px;
      }
    /* 상품문의 테이블 */
    #qna_table {
    width: 850px;
    text-align: center;
    margin-bottom: 15px;
    border-top: 1.5px solid black;
    border-bottom: 1px solid black;
    }
    #qna_table th{
   	padding: 10px;
    }
    #qna_table td {
    padding: 16px;
    }
    select#category{
    padding: 5px;
    }
    input#title {
    width: 400px;
    padding: 12px;
	border-radius: 4px;
	}
	input#content {
	padding: 12px;
	width: 600px;
	height: 400px;
	border-radius: 4px;
	}
	#btngroup{
          text-align: center;
          margin-bottom: 20px;
      }
     .button{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 25px 10px;
        transition-duration: 0.3s;
        cursor: pointer;
        background-color: white;
        color: black;
        border: 2px solid #DFE0DF;
        border-radius: 5px;
        }

        .button:hover {
            background-color: #DFE0DF;
        }
		/* 등록하기 버튼 */
        #qna_btn {
        padding: 6px 32px;
        margin: 4px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        }
        #qna_btn:hover {
        background-color: #555555;
        color: white;
        }
</style>
<script>
function write1(){
	var category = $("#category").val();
	var title = $("#title").val();
	var content = $("#content").val();
	console.log(category+title+content);
	
	$.ajax({
		type: "post",
		url: "<%=request.getContextPath()%>/qna_write",
		data: {
			category : category,
			title	: title,
			content : content
		},
		dataType: "json", //전달받을 객체는 json이다.
		success: function(data){
			console.log(data);
			console.log(data.length);
			alert("상품문의글이 등록되었습니다.")
			location.href ="<%=request.getContextPath()%>/qnalist"
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
		}
	});
};

</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
<h2>상품문의(Q&A)</h2>
<table id="qna_table">
<tr>
<th>카테고리</th>
<td><select id="category">
<option value="교환">교환</option>
<option value="환불">환불</option>
<option value="기타">기타</option>
</select></td>
<th>문의 제목</th>
<td colspan="2"><input type='text' id="title"></td>
</tr>
<!--  <tr>
<th colspan="4">문의 내용</th>
</tr>-->
<tr>
<th>문의<br>내용</th>
<td colspan="3"><input type='text' id="content"></td>
</tr>
</table>
<div id="btngroup">
<input type="submit" class="button" value="등록하기" id="qna_btn" onclick="write1()" placeholder="제목을 입력하세요">
</div>
</section>
<!-- 공통푸터 템플릿 -->
<%@ include file="template_footer.jsp"%>
</body>
</html>