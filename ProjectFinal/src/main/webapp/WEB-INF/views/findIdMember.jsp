<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


<script type="text/javascript">
function findId(){
	var memName = document.getElementById("memName").value;
	var memEmail = document.getElementById("memEmail").value;
	var info = document.getElementById("info");
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	console.log(memName);
	console.log(memEmail);
	if(memEmail.match(regExp)){
		$.ajax({
			url: "./findIdMember.do",
			type: "post",
			async: true,
			data : {"memName":memName,"memEmail":memEmail},
			success: function(data){
				if(data==""){
					info.innerHTML = "아이디를 찾을 수 없습니다";
				}else{
					info.innerHTML ="회원님의 아이디는 ["+data+"]입니다";
				}
			},
			
			error: function(){
				alert('통신실패');
			}
		});
	}else{
		info.innerHTML ="이메일 형식이 아닙니다";
	}
	
}
</script>

이름 :<input type="text" id="memName" name="mamName">
이메일 :<input type="text" id="memEmail" name="memEmail">
<input type="button" onclick="findId()" value="아이디 찾기">
<p id="info"></p>
</body>
</html>