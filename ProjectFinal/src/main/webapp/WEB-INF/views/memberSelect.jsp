<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

${vo.memberId}
${vo.memName}
${vo.memEmail}
${loginVo.memberId}

<form action="./inviteMember.do" method="post">
<input type="text" name="memberId" value="${loginVo.memberId}">
<input type="text" name="memEmail" value="${vo.memEmail}">
<input type="submit" id="joinEmail"  value="메일보내기"> 
</form>

</body>


</html>