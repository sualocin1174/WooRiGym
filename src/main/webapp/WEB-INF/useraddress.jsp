<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "woorigym.user.model.vo.UserTable" %>
<%
   UserTable user = (UserTable)session.getAttribute("loginSS");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지관리</title>
<style>
 /* reset */
 * {
            margin: 0;
            padding: 0;
}
 body{
    font-family: 'Noto Sans KR', sans-serif;
}
	table {
		 border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
	}
	
	table tr th{
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: rgb(140, 130, 228) ;
	
  }
  table tr td:nth-of-type(1){
  width: 65px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
		
	}
  table tr td:nth-of-type(2){
  width: 200px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
		
	}
  table tr td:nth-of-type(3){
  width: 150px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
		
	}
  table tr td:nth-of-type(5){
  width: 50px;
  padding: 10px;
  vertical-align: top;
		
	}
  table tr td:nth-of-type(6){
  width: 50px;
  padding: 10px 0px;
  vertical-align: top;
		
	}

	td button{
	border: 1px solid rgb(140, 130, 228);
	background-color:rgba(0,0,0,0);
	color: rgb(140, 130, 228);
	padding :  5px;
	border-radius: 5px;
	font-size:15px;
	}
	td button:hover{
	background-color:rgb(140, 130, 228);
	color: white;
	padding :  5px;
	border-radius: 5px;
	cursor : pointer;
	font-size:15px;
	}
	#newaddr{
	border: 1px solid rgb(140, 130, 228);
	background-color:rgba(0,0,0,0);
	color: rgb(140, 130, 228);
	padding :  5px;
	border-radius: 5px;
	font-size:15px;
	}
	#newaddr:hover{
	background-color:rgb(140, 130, 228);
	color: white;
	padding :  5px;
	border-radius: 5px;
	cursor : pointer;
	font-size:15px;
	}
	
</style>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">
    // 배송지 정보 불러오기
    $(document).ready(function () {
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "orderaddress",
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                console.log("주소지 정보 호출 성공");
                var addressinfo = data;
                var p = 0;
                for (p in addressinfo) {
                    var seladdr = "<tr id='tr"+p+"'><td id='postcode"+p+"'>"+addressinfo[p].postcode + "</td> <td id='basicaddr"+p+"'>" + addressinfo[p].basic_address + "</td> <td id='detailaddr"+p+"'>" + addressinfo[p].detail_address+"</td><td id='addressno"+p+"' style='display:none'>" + addressinfo[p].address_no+"</td><td><button onclick='setAddrInfo("+p+")'>선택</button></td><td><button onclick='delAddr("+p+")'>삭제</button></td></tr>";
                    $("#addrtable").append(seladdr);
                    
                    p++;
                }
                
            }
        });
        
    }); // ready
    function setAddrInfo(n){
    	
    	console.log("setAddrInfo 호출");
        console.log($("#postcode"+n+"").text());
        
        opener.document.getElementById("postcode").value = $("#postcode"+n+"").text();
        opener.document.getElementById("basicaddr").value = $("#basicaddr"+n+"").text();
        opener.document.getElementById("detailaddr").value = $("#detailaddr"+n+"").text();
        opener.document.getElementById("addressno").value = $("#addressno"+n+"").text();
        
        window.close();
    }
   
    function delAddr(n){
    	if(n==0){
    		alert("회원정보에 등록된 주소는 삭제할 수 없습니다.")
    	} else {
    		console.log($("#postcode"+n+"").text());
        	$.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
                type: "get",
                url: "orderdeleteaddress",
                data: { user_id: "<%=user.getUser_id()%>",
             		   postcode : $("#postcode"+n+"").text(),
             		   basicaddr : $("#basicaddr"+n+"").text(),
             		   detailaddr : $("#detailaddr"+n+"").text(),
            		   addressno : $("#addressno"+n+"").text()
                },
                success: function (data) {
             	  window.location.reload();
                    }
                });
    	}
    	
    };
    	 
    
    	
    	
    
    
    function insertAddr(){
    	
    	  // window.name = "부모창 이름"; 
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("insertaddressview",
                "childForm", "width=570, height=350, resizable = no, scrollbars = no, left=400px , top=300px" );  
    }

    </script>

</head>
<body>
<section>
&nbsp&nbsp&nbsp<button onclick="insertAddr()" id="newaddr">새 주소지 추가</button>
<table id="addrtable">
	<tr>
	<th>우편번호</th><th>기본주소</th><th>상세주소</th>
</tr>
</table>
<br>



</section>

</body>
</html>