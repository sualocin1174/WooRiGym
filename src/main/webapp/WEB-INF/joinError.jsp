<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(function(){
			//아이디 유효성 검사(1 = 중복 / 0 != 중복)
			var idck = "${result}";
			$("#checkId").click(function() {
				// name = "user_id"
				var user_id = $('#user_id').val();
				console.log("받아온 result: "+ idck);
				console.log(user_id);
				$.ajax({
					type: "post",
					url : "<%=request.getContextPath()%>/DupIdChkServlet" ,
					data : {user_id : user_id} ,
					
					success : function(idck) {
							console.log("1 = 중복o / 0 = 중복x : "+ idck);							
							
							if(idck == 2){
								// 2 : 아이디를 입력하지 않았을 때
								$("#id_check").html("아이디를 입력해주세요");
								$("#id_check").css("color","red");
							} else if (idck == 1) {
								// 1 : 아이디가 중복되었을 때
								$("#id_check").html("중복된 아이디입니다.");
								$("#id_check").css("color","red");
							} else if(idck == 0){
								// 0 : 아이디 사용가능할 때
								$("#id_check").html("중복확인 완료");
								$("#id_check").css("color","green");
							}
						}, 
					error:function(request,status,error){
			    			alert("code:"+request.status+"\n"+"message:"+request.responseText+
			    					"\n"+"error:"+error);
						}
					});
				});
			
			// 비밀번호 유호성검사
			$("#user_pwd").on("input" , pwdTest);
			 function pwdTest(){
					var regex  = /^[A-Za-z0-9]{7,15}$/;
					var result = regex.exec($("#user_pwd").val());
					console.log("유효검사-> " + result);
					
					if(result != null){
						$(".user_pwd.regex").html("");
					} else {
						$(".user_pwd.regex").html("영어 대소문자 + 숫자  조건에 맞게 입력해주세요.");
						$(".user_pwd.regex").css("color", "red");
					}
				};
			// 비밀번호 확인
			$("#user_pwdTest").on("input" , function(){
				var regex  = /^[A-Z][A-za-z0-9]{7,15}$/;
				if(!regex .test(pw1)){
					alert("영어 대소문자 + 숫자  조건에 맞게 입력해주세요.");
					return false;
				}
			});
			
			// 이름 유효성 검사
			$("#name").on("input", function(){
				var regex = /[가-힣]{2,}/;
				var result = regex.exec($("#name").val())
				
				if(result != null){
					$(".name.regex").html("");
				} else{
					$(".name.regex").html("한글만 입력 가능합니다.");
					$(".name.regex").css("color","red");
				}
			});
			// 비밀번호 유효성 검사
			$("#pw1").on("input" , function(){
				var regex = /^[a-zA-Z0-9]{9,17}$/;
				var result = regex.exec()
			
				if(result != null){
					$(".pw1.regex").html("");
				} else {
					$(".pw1.regex").html("영대소문자 및 숫자를 이용하여 최소 8~16자 까지 입력하세요");
					$(".pw1.regex").css("color","red");
				}
			});
			// 비밀번호 확인
			$("#pw2").on("input" , function(){
				var regex = /^[a-zA-Z0-9]{9,17}$/;
				var result = regex.exec()
			
				if(result != null){
					$(".pwd1.regex").html("");
				} else {
					$(".user_pwd.regex").html("영대소문자 및 숫자를 이용하여 최소 8~16자 까지 입력하세요");
					$(".user_pwd.regex").css("color","red");
				}
			});
			$("#joinbtn").on("click", function(){
				
				
			});
		});
	</script>
</body>
</html>