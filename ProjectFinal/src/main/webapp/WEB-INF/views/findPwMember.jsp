<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>


<form action="">
<div class="containser">
	 <div class="form-group">
            <label for="userId">User id</label>
            <input type="text" placeholder="Enter ID" id="memberId" name="memberId" required>
<!--             <span class="checkIdComment">ID는 영문소문자 + 숫자로 작성가능하며  6자 이상 16자 이하로 설정해주시기 바랍니다.(공백불가)</span> -->
            <input type="hidden" id="doubleCheckId" name="checkId"/>  
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" class="email" type="text" name="memEmail"  required/>
            <input type="button" id="checkEmailBtn" class="btn btn-info">임시비밀번호 보내기<br/><br>
     		 <label for="validEmail">Validation Email</label>
             <input id="validEmail" class="number" type="text" name="sm_email2" title="인증번호 입력" required/> -->
             <span id="validEmailBtn" class="btn btn-info">이메일인증</span> -->
             <span class="point checkEmailComment">임시비밀번호를 입력해주세요</span> -->
             <input type="hidden" id="doubleCheckEmail"/>
             <input type="button" value="로그인"> 
        </div>
	</div>
</form>


</body>
</html>