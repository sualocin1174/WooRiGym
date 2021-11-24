<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
 body{
        font-family: 'Noto Sans KR', sans-serif;
        }
</style>
</head>
<body>
	<script>
		$(function(){
			//아이디 유효성 검사(1 = 중복 / 0 != 중복)
			var idck = "${result}";
			var result = false;
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
					var regex  = /^[A-Za-z0-9]{7,17}$/;
					result = regex.test($("#user_pwd").val());
					console.log("유효검사-> " + result);
					
					if(result == false){
						$(".user_pwd.regex").html("영대소문자나 숫자를 이용하여 최소 8~16자 까지 입력하세요.");
						$(".user_pwd.regex").css("color", "red");
					} else {
						$(".user_pwd.regex").html("");
						return result;
					}
				};
			// 비밀번호 확인
			$("#user_pwdtest").on("input", pwdAgreement);
			function pwdAgreement(){
				var user_pwd = $("#user_pwd").val();
				var user_pwdTest = $("#user_pwdtest").val();
				console.log("비밀번호->" + user_pwd);
				console.log("비밀번호확인->" + user_pwdTest);
				if($("#user_pwd").val() == $("#user_pwdtest").val()){
					$(".user_pwdtest.regex").html("비밀번호가 일치합니다.");
					$(".user_pwdtest.regex").css("color", "green");
				} else{
					$(".user_pwdtest.regex").html("비밀번호가 일치하지 않습니다.");
					$(".user_pwdtest.regex").css("color", "red");
					result = false;
					return result;
				}
			};
			
			// 이름 유효성 검사
			$("#name").on("input", function(){
				var regex = /[가-힣]{2,}/;
				result = regex.test($("#name").val())
				
				if(result == false){
					$(".name.regex").html("한글만 입력 가능합니다.");
					$(".name.regex").css("color","red");
				} else{
					$(".name.regex").html("");
					return result;
				}
			});
			// 주민등록번호 확인
			$("#identity_number").on("input", function(){
				
				var regex = /^[1-4][0-9]{6}$/;
				result = regex.test($("#identity_number").val());
				var identity_number = $("#identity_number").val();
				console.log("주민등록번호->" + $("#identity_number").val());
				console.log("result 값 -> " + result);
				console.log(identity_number.charAt(0));
				if(result == false){
					$(".identity_number.regex").html("올바르게 입력하세요");
					$(".identity_number.regex").css("color", "red");
					return result;
				} else{
					$(".identity_number.regex").html("");	
				}
			});
			// 성별 체크
			/* $(".gender").checked("radio", function (){
				var val = $(".gender").val();
				console.log(val);
				if(val == null){
					$(".genderT.regex").html("체크해주세요.");
					$(".genderT.regex").css("color","red");
					return false;
				} else{
					$(".genderT.regex").html("체크해주세요.");
					return true;
				}
			}); */
			//휴대폰 번호 확인
			$("#phone01").on("input", function (){
			var regex = /^01[016789]$/;
			result = regex.test($("#phone01").val());
			console.log(result);
			if(result == false){
				$(".phone01.regex").html("010, 011, 016, 017, 018, 019 유효 조건에 맞게 입력해주세요");
				$(".phone01.regex").css("color", "red");
			} else{
				$(".phone01.regex").html("");
			}
				
			});
			//빈칸이 있을 때 다시 유효성 검사진행
			
			$("#joinbtn").on("click", function(){
				
			 /* 	var name = $("#name").val();
				var phone1 = $("#phone01").val();
				var phone2 = $("#phone02").val();
				var phone3 = $("#phone03").val();
				var identity_number = $("identity_number").val();
				
				var male = $("male").val();
				var female = $("female").val();
				var birthday_yy = $("birthday_yy").val();
				var birthday_mm = $("birthday_mm").val();
				var birthday_dd = $("birthday_dd").val();
				var email_1 = $("email_1").val();
				var email_2 = $("email_2").val();
				var email_yes = $("email_yes").val();
				var email_no = $("email_no").val();
				var sample6_postcode $("sample6_postcode").val();
				
				
				var nameregex = /[가-힣]{2,}/;
				var phone1regex = /^01[016789]$/;
				var phone2regex = /[0-9]{3}$/;
				var phone3regex = /[0-9]{3}$/;
				var identity_numberregex = /^[1-4][0-9]{6}$/;
				  */
				/* nameregex = nameregex.test(name);
				if(nameregex == false){
					alert("이름을 다시 확인해주세요");
					return;
				}
				phone1regex = phone1regex.test(phone1);
				if(phone1regex == false){
					alert("휴대폰 번호 앞 3자리를 확인해주세요");
					return;
				}
				phone2regex == phone2regex.test(phone2);
				if(phone2regex == false){
					alert("휴대폰  번호를 확인해주세요");
					return;
				}
				phone3regex == phone2regex.test(phone3);
				if(phone3regex == false){
					alert("휴대폰  번호를 확인해주세요");
					return;
				}
				identity_numberregex == identity_numberregex.test(identity_numberregex);
				if(identity_numberregex == false){
					alert("주민등록번호를 확인해주세요");
					return;
				} */
				
				/* console.log(male);
				console.log(female);
				console.log(birthday_yy);
				console.log(birthday_mm);
				console.log(birthday_dd);
				console.log(email_1);
				console.log(email_2);
				console.log(email_yes);
				console.log(email_no);
				console.log(sample6_postcode);
 */
				
				  if(result == true && idck == 0 && genderck != null && emailyn != null){
					alert("회원가입이 완료되었습니다.");
					$("#joinform").submit();
				} else{
					alert("정보를 다시한번 확인해주세요.");
					return;
				
				}
				
			});
		});
	</script>
</body>
</html>