<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<h1>마이페이지</h1>

${loginVo.memberId}
<div class="container">
				<div class="form-control">아이디 : ${loginVo.memName}</div>
				<div class="form-control">아이디 : ${loginVo.memberId}</div>
				<div class="form-control">이메일 : ${loginVo.memEmail}</div>
				<div class="form-control">주소 : ${loginVo.memAddr}</div>
				<div class="form-control">핸드폰번호 : ${loginVo.memPhone}</div>
			
			
			<div>
				<input class="btn btn-primary" type="button" value="내정보 수정하기" onclick="modifyMember()">
			</div>
			
			</div>
			
</body>
<script type="text/javascript">
function modifyMember(){
	location.href='./modifyMember.do';
}

</script>
</html>