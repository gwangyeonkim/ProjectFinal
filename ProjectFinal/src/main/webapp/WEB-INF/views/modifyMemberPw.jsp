<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 100px; 
}

#cPw {
	margin-top: 30px;
}

#btn{
	margin-top: 15px;
	padding-left: 20%;
}


</style>
<script>
function closeW(){
	window.close();
}
</script>
</head>
<body>


<div class="container">
	<form action="./modifyMemberPw.do" method="post">
	<input type="hidden" class="form-control" id="memberId" name="memberId" value="${loginVo.memberId}">
	<input type="text" class="form-control" id="pw" name="memPw" placeholder="새 비밀번호 입력하기" required>
	<input type="text" class="form-control" id="cPw" placeholder="비밀번호 확인" required>
	<div id="btn">
	 <input type="submit" value="비밀번호 변경"  class="btn btn-outline-secondary btn-lg" onclick="closeW()">
	 </div>
	</form>
</div>

</body>
</html>