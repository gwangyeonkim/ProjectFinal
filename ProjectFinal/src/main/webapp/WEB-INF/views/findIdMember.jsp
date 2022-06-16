<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  #container{
  	margin-top: 50px;
  }
  
  #btn {
  	margin-left: 250px;
  }
  
  </style>
  
  
</head>
<body>

		<div id="container" class="form-horizontal">
			<label class="control-label col-sm-2"> 이름: </label>
			<div id="name" class="col-sm-10">
			<input type="text" class="form-control" id="memName" name="mamName">
			</div>
			<label class="control-label col-sm-2"> Email : </label>
			<div id="email" class="col-sm-10">
			<input type="text" class="form-control" id="memEmail" name="memEmail">
			</div>
			<p id="info"></p>
		
		
				<div class="form-group" id="btn">        
		      	<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-default" onclick="findId()" value="아이디 찾기">
		      </div>
		    </div>
</div>	
</body>

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
</html>