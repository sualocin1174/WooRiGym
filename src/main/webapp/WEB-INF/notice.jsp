   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.ArrayList"%>
<%@page import = "woorigym.admin.model.vo.NoticeTable" %>
<!--<a href = "${path}/shop/product/list.do">상품목록</a>-->
<!--<a href = "${path}/shop/product/write.do">상품등록</a>-->
<%
	ArrayList<NoticeTable> volist = (ArrayList<NoticeTable>)request.getAttribute("noticelist");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 페이지</title>
	<style>
			section {
                width: 900px;
                padding: 0 0 30px 0;
                position: relative;
		        bottom: 250px;
		        left: 260px;
            }
            
          	/* 10/19 추가*/
         	input{
         	pre-line;
			width:200px;
			border: 2px solid #e7e7e7;
			}
			
			input,
			.btn {
			  padding: 8px;
			  border-radius: 4px;
			  margin: 5px 0;
			  opacity: 0.85;
			  display: inline-block;
			  font-size: 17px;
			  line-height: 20px;
			  text-decoration: none;
			}
			
			input:hover,
			.btn:hover {
			  opacity: 1;
			}
			
			/*검색, 추가, 수정, 삭제 버튼*/
			.button{
	        padding: 5px;
	        text-align: center;
	        text-decoration: none;
	        font-size: 16px;
	        margin: 5px;
	        transition-duration: 0.3s;
	        cursor: pointer;
	        background-color: white;
	        color: black;
	        border: 2px solid #e7e7e7;
	        }

	        .button:hover {
	            background-color: #e7e7e7;
	        }
	        
			/* 공지사항 테이블 */
			.notice_table{
			width: 700px;
			}
			
			.notice_table td {
			margin: 0 0 30px 0;
			}
			
			#n_content{
				width:400px;
				height:100px;
			}
			.tsearch{
			width: 400px;
			}
			
			.tsearch td {
			margin: 0 0 30px 0;
			}
			
			/*등록, 취소 버튼*/
			.btn_collection {
			text-align: center;
			}
			
			.btn_collection input, .btn_collection button {
			padding: 6px 32px;
	        margin: 10px 2px;
	        background-color: white;
	        color: black;
	        border: 2px solid #555555;
	        cursor: pointer;
			}
			
			.btn_collection input:hover, .btn_collection button:hover {
			background-color: #555555;
       		color: white;
			}
			/* 사이드바 */
			aside{
	        display: inline-block;
			 padding: 30px 0 0 30px;
			 }
		 	#side-menu>ul>li{
		        padding: 5px;
		        list-style-type: none;
		     }
		     /* 메인페이지 폰트 크게 */
		    #side-menu>ul>li:first-child{
		         font-size: 25px;
		    }
	</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
 	<!-- 10/10 메인페이지 사이드바 추가: <aside>~</aside>
 	추후 template_admin_aside.jsp로 따로 생성하고 include해서 쓰시는걸 추천합니다  -->
 	<aside>
 		<div id="side-menu">
     		<ul>
         		<li>메인페이지</li>
         		<li><a href="amain">상품관리</a></li>
         		<li><a href="apupage">팝업공지</a></li>
         		<li><a href="#">매출관리</a></li>
         		<li><a href="#">주문내역 확인</a></li>
         		<li><a href="#">배송현황 관리</a></li>
         		<li><a href="#">교환/반품/환불 승인</a></li>
         		<li><a href="#">Q&A 문답관리</a></li>
     		</ul>
 		</div>
	</aside>
	
	<section>
		<button type="button" id="btn_list"  class="button" name="btn_list">리스트</button>
		<button type="button" id="btn_insert" class="button" name="btn_insert">추가</button>
		<button type="button" id="btn_update" class="button" name="btn_update">수정</button>
		<button type="button" id="btn_delete" class="button" name="btn_delete">삭제</button>
		<br><br>
	</section>
	
	<section>
		<div id="noticeList" style="display:none"></div>
	</section>
	
	<section>
		<div id="noticeInsert" style="display:none">
			<form id="formInsert" name="formInsert" action="apuadd" method="post">
				<table id="notice_insert" class="notice_table">
					<tr>
						<td>제목</td>
						<td><input type="text" name="n_title" id="n_title" class = "input" required="required" placeholder="제목을 입력해주세요."><br><br></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><input type="text" name="n_content" id="n_content" class = "input" required="required" placeholder="내용을 입력해주세요."><br><br></td>
					</tr>
				</table>
		
				<div class="btn_collection"><br>
					<input type="submit" id="save" value="등록">
					<button type="reset" id="cancle">취소</button>
				</div>
			</form>
		</div>
	</section>
	
	<section>
		<div id="noticeSelect" style="display:none">
			<form id="formSelect" name="formSelect" action="#" method="post">
				<table id="notice_Select" class="notice_Select">
					<tr>
						<td>공지사항 번호</td>
						<td><input type="text" name="notice_no1" id="notice_no1" class = "input" required="required" placeholder="번호를 입력해주세요."><br><br></td>	
						<td><input type="button" id="checkNo" value="확인">
						<span id="check_NN"></span>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	
	<section>
		<div id="noticeUpdate" style="display:none">
			<form id="formUpdate" name="formUpdate" action="apuupdate" method="post">
				<table id="notice_Update" class="notice_Update">
					<tr>
						<td>제목</td>
						<td><input type="text" name="notice_no2" id="notice_no2" class="input"><br><br></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><input type="text" name="notice_content" id="notice_content" class="input"><br><br></td>
					</tr>
				</table>
				<div class="btn_collection"><br>
					<input type="submit" id="save" value="등록">
					<button type="reset" id="cancle">취소</button>
				</div>
			</form>
		</div>
	</section>
	
	<section>
		<div id="noticeDelete" style="display:none">
		<form id="formDelete" name="formDelete" method="post" action="apudelete">
				<table id="notice_delete" class="notice_table">
					<tr>
						<td>공지사항 번호</td>
						<td><input type="text" name="notice_no2" id="notice_no2" class = "input" required="required" placeholder="번호를 입력해주세요."><br><br></td>
					</tr>
				</table>
			<div class="btn_collection"><br>
				<input type="submit" id="delete" value="삭제">
				<button type="reset" id="cancle">취소</button>
			</div>
		</form>
		</div>
	</section>
	
	<script>
	$("#btn_list").click(listF1);
	
	function listF1(){
		ajaxF1();
		$("#noticeInsert").hide();
		$("#noticeDelete").hide();
		$("#noticeSelect").hide();
		$("noticeUpdate").hide();
	}
	
	function ajaxF1(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/apulist.ajax",
			data:{
				notice_no:0,
				n_title:"",
				n_content:"",
				n_date:""
			},
			dataType:"json",
			success:function(data){
				resultHtml(data);
			},
			error:function(request, status, error){
 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			}
		});
		$("#noticeList").show();
	}
	
	function resultHtml(data){
		var html="<table border='1' id='tsearch'>";
		html += "<tr>";
		html += "<th>공지사항번호</th>";
		html += "<th>제목</th>";
		html += "<th>내용</th>";
		html += "<th>작성일</th>";
		html += "</tr>";
		
		$.each(data, function(key, value){
			html += "<tr>";
			html += "<td>" + value.notice_no + "</td>";
			html += "<td>" + value.n_title + "</td>";
			html += "<td>" + value.n_content + "</td>";
			html += "<td>" + value.n_date + "</td>";
			html += "</tr>";
		});
		
		html += "</table>";
		$("#noticeList").empty(); 
		$("#noticeList").append(html);
	}
	
	$("#btn_insert").click(InsertShow);
	function InsertShow(){
		$("#noticeInsert").show();
		$("#noticeList").hide();
		$("#noticeDelete").hide();
		$("#noticeSelect").hide();
		$("noticeUpdate").hide();
	};
	
	$("#btn_delete").click(DeleteShow);
	function DeleteShow(){
		$("#noticeDelete").show();
		$("#noticeInsert").hide();
		$("#noticeList").hide();
		$("#noticeSelect").hide();
		$("noticeUpdate").hide();
	};
	
	$("#btn_update").click(UpdateShow);
	function UpdateShow(){
		$("#noticeSelect").show();
		$("#noticeDelete").hide();
		$("#noticeInsert").hide();
		$("#noticeList").hide();
		$("noticeUpdate").hide();
	}
	</script>
	
	<script type="text/javascript">
	var NN = "${result}";
	$("#checkNo").click(select);
	
	function select(){
		var notice_no1 = $('#notice_no1').val();
		console.log("받아온 result: "+ NN);
		console.log(notice_no1);
		$.ajax({
			type: "post",
			url : "<%=request.getContextPath()%>/SelectNotice",
			data : {
					notice_no1 : notice_no1
			},
			
			success : function(NN) {
					console.log("1 = 중복o / 0 = 중복x : "+ NN);							
					
					if(NN == 2){
						$("#check_NN").html("공지사항 번호를 입력해주세요");
						$("#check_NN").css("color","red");
					}
					else if (NN == 1) {
						$("noticeUpdate").show();
						$("noticeSelect").hide();
					}
					else if(idck == 0){
						$("#check_NN").html("존재하지 않는 공지사항입니다.");
						$("#check_NN").css("color","green");
					}
				}, 
			error:function(request,status,error){
	    			alert("code:"+request.status+"\n"+"message:"+request.responseText+
	    					"\n"+"error:"+error);
				}
			});
		};
	</script>
</body>
</html>