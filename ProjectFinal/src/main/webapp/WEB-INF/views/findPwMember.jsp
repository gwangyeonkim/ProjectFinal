<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
  #container{
  	margin-top: 50px;
  }
  
  #btn {
  	padding-top: 20px;
  	margin-left: 200px;
  }


</style>
</head>
<body>
<form action="./findPwMember.do" method="post">
<div id="container" class="form-horizontal">
			<label class="control-label col-sm-2"> ID: </label>
			<div id="name" class="col-sm-10">
 				<input type="text" class="form-control"  id="memberId" name="memberId" required>
			</div>
			<label class="control-label col-sm-2"> 이름 : </label>
			<div id="email" class="col-sm-10">
				<input type="text" class="form-control"id="memName" name="memName" required>
			</div>
			<label class="control-label col-sm-2"> Email : </label>
			<div id="email" class="col-sm-10">
				 <input id="memEmail" class="form-control" type="text" name="memEmail"  required/>
			</div>
		
			<div class="form-group" id="btn">        
		     <div class="col-sm-offset-2 col-sm-10">
			 <input type="button" id="checkEmailBtn" class="btn btn-info" value="임시비밀번호 보내기">
		      </div>
		    </div>
</div>
</form>

<!-- <form action=""> -->
<!-- <div class="containser"> -->
<!-- 	<div class="form-group"> -->
<!--             <label for="userId">User id</label> -->
<!--             <input type="text" placeholder="Enter ID" id="memberId" name="memberId" required> -->
<!--         </div> -->

<!-- 	 <div class="form-group"> -->
<!--             <label for="userId">User name</label> -->
<!--             <input type="text" placeholder="Enter NAME" id="memName" name="memName" required> -->
<!--         </div> -->
<!--         <div class="form-group"> -->
<!--             <label for="email">Email</label> -->
<!--             <input id="memEmail" class="email" type="text" name="memEmail"  required/> -->
<!--             <input type="button" id="checkEmailBtn" class="btn btn-info">임시비밀번호 보내기<br/><br> -->
<!--         </div> -->
<!-- 	</div> -->
<!-- </form> -->
</body>

<script type="text/javascript">
$("#checkEmailBtn").click(function() {
	// 이메일 정규화 
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	
	var inputName = $("#memName").val();
	var inputId = $("#memberId").val();
	var inputEmail = $("#memEmail").val();
	
	console.log(inputEmail);
	var sendData= {
		"memName": inputName,
		"memberId" : inputId,
		"memEmail" : inputEmail
	}
	if(inputEmail != null){
	$.ajax({
		 	contentType: "application/json; charset=utf-8",
			type : "POST",
			url : "./findPwMember.do",
			cache : false,
			dataType : "json",
			data: JSON.stringify(sendData),
			success : function(data) {
			if (data == "error") {
						console.log(data)
// 						alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
// 						$("#email").attr("autofocus", true);
// 						$(".checkEmailComment").text("유효한 이메일 주소를 입력해주세요.");
// 						$(".checkEmailComment").css("color", "red");
					     } else {
						alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
						$("#validEmail").attr("disabled",false);
						$("#validEmailBtn").css("display","inline-block");
						$(".checkEmailComment").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
						$(".checkEmailComment").css("color", "green");
						code = data;
						}
					}
		});
	}else {
		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
			$("#memEmail").attr("autofocus", true);
			$(".checkEmailComment").text("유효한 이메일 주소를 입력해주세요.");
			$(".checkEmailComment").css("color", "red");
	}
});

</script>





</html>