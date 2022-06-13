<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./header.jsp" %>
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<body>  

<h1>회원정보 수정</h1>
	<form action="./modifyMember.do" method="post">
		<div>
			<label>아이디</label>
			<input type="text" id="" name="memberId" value="${loginVo.memberId}" readonly>
		</div>
		
<!-- 		<div class="form-group"> -->
<!--             <label for="password">새로운 비밀번호 입력</label> -->
<!--             <input type="Password" placeholder="Enter password" id="password" name="memPw" value="$"> -->
<!--         </div> -->
<!--         <div class="form-group"> -->
<!--             <label for="password">비밀번호 확인</label> -->
<!--             <input type="Password" placeholder="Enter password" id="validPassword"> -->
<!--             <span class="point checkPwdComment"></span> -->
<!--             <input type="hidden" id="doubleCheckPwd"/> -->
<!--         </div> -->
        
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" class="email" type="text" name="memEmail" value="${loginVo.memEmail}" title="이메일 주소를 입력해주세요." required/>
            <button><span id="checkEmailBtn" class="btn btn-info">인증번호 보내기</span><br/></button><br>
     	 <label for="validEmail">Validation Email</label>
             <input id="validEmail" class="number" type="text" name="sm_email2" title="인증번호 입력" required/> -->
             <span id="validEmailBtn" class="btn btn-info">이메일인증</span> -->
             <span class="point checkEmailComment">이메일 입력후 인증번호 보내기를 해주십시오.</span> -->
             <input type="hidden" id="doubleCheckEmail"/> 
        </div>
        
        <div class="form-group">
            <label for="username">address</label>
            <input type="text" id="address_kakao" name="memAddr" readonly />
            <input type="text" name="address_detail" />
<!--             <input type="text" placeholder="Enter ID" id="id" name="mem_addr"> -->
<!--             <span class="point checkNameComment">ID은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span> -->
<!--             <input type="hidden" id="doubleCheckName"/> -->
        </div>
        
        <div class="form-group">
              <label for="Hp">H.P</label>
            <input id="Hp" class="Hp" type="text" name="memPhone"  required/>
            <button><span id="checkHpBtn" class="btn btn-info">인증번호 보내기</span><br/></button><br>
          <label for="validHp">H.P 인증하기</label>
            <input id="validHp" class="number" type="text" name="sm_Hp2" title="인증번호 입력"  required/>
            <span id="validHpBtn" class="btn btn-info">핸드폰인증</span>
            <span class="point checkHpComment">핸드폰번호 인증번호 보내기를 해주십시오.</span>
            <input type="hidden" id="doubleCheckHp"/>
        </div>
       <input type="submit" value="회원정보 수정">
	
	</form>
	
              
</body>

<script type="text/javascript">
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

//비밀번호 확인 정규화적용해야함
$("#validPassword").blur(function() {
//		비밀번호 정규화 8 ~ 16 영문 숫자 
var regPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
console.log(regPw.test($("#memPw")))
	if ($("#validPassword").val() == $("#memPw").val()) {
		$(".checkPwdComment").text("비밀번호가 일치합니다.");
		$(".checkPwdComment").css("color", "green");
//			$("#doubleCheckPwd").val("true");
//			$("#validPassword").attr("disabled", true);
//			$("#memPw").attr("disabled", true);
	} else {
		$(".checkPwdComment").text("비밀번호가 일치하지 않습니다.");
		$(".checkPwdComment").css("color", "red");
//			$("#doubleCheckPwd").val("false");
//			$("#memPw").focus();
	}
});



var code = "";
$("#checkEmailBtn").click(function(){
    var inputEmail = $("#email").val();
    $.ajax({
        type:"GET",
        url:"./checkMail.do?email=" + inputEmail,
        cache : false,
        success:function(data){
            if(data == "error"){
                alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
                $("#email").attr("autofocus",true);
                $(".checkEmailComment").text("유효한 이메일 주소를 입력해주세요.");
                $(".checkEmailComment").css("color","red");
            }else{
                alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                $("#validEmail").attr("disabled",false);
                $("#validEmailBtn").css("display","inline-block");
                $(".checkEmailComment").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                $(".checkEmailComment").css("color","green");
                code = data;
            }
        }
    });
});

//이메일 인증번호 대조
$("#validEmailBtn").click(function(){
    if($("#validEmail").val() == code && code != ""){
        $(".checkEmailComment").text("인증번호가 일치합니다.");
        $(".checkEmailComment").css("color","green");
        $("#doubleCheckEmail").val("true");
        $("#validEmail").attr("disabled",true);
    }else{
        $(".checkEmailComment").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".checkEmailComment").css("color","red");
        $("#doubleCheckEmail").val("false");
        $("#validEmail").attr("autofocus",true);
    }
});


var codeHP = "";
$("#checkHpBtn").click(function(){
    var inputHP = $("#Hp").val();
    $.ajax({
        type:"GET",
        url:"./checkHp.do?Hp=" + inputHP,
        cache : false,
        success:function(data){
            if(data == "error"){
                alert("핸드폰 주소가 올바르지 않습니다. 유효한 핸드폰 주소를 입력해주세요.");
                $("#Hp").attr("autofocus",true);
                $(".checkHpComment").text("유효한 이메일 주소를 입력해주세요.");
                $(".checkHpComment").css("color","red");
            }else{
                alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                $("#validHp").attr("disabled",false);
                $("#validHpBtn").css("display","inline-block");
                $(".checkHpComment").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                $(".checkHpComment").css("color","green");
                codeHP = data;
            }
        }
    });
});

//핸드폰 인증번호 대조
$("#validHpBtn").click(function(){
    if($("#validHp").val() == codeHP && codeHP != ""){
        $(".checkHpComment").text("인증번호가 일치합니다.");
        $(".checkHpComment").css("color","green");
        $("#doubleCheckHp").val("true");
        $("#validHp").attr("disabled",true);
    }else{
        $(".checkHpComment").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".checkHpComment").css("color","red");
        $("#doubleCheckHp").val("false");
        $("#validHp").attr("autofocus",true);
    }
});


</script>
</html>