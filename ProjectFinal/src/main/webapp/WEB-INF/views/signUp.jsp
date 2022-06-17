<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- date picker ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<%@include file="./header.jsp" %>
<style type="text/css">

tbody, td, tfoot, th, thead, tr {
    FONT-WEIGHT: 100;
    border-color: inherit;
    border-style: solid;
    border-width: 2.5;
}
tbody{
    height: 505px;
}

.navb{
	height: 100px;
}

.wrapper{
	width: 1020px;
}

.home{
	margin: 0 auto;
/* 	border: 2px solid black; */
	width: 1400px;
	height: 600px;
		}
	


table .type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}


table .type02 td{
  width: 200px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

h3{
	font-weight: 400px;
	text-align: center;
}

h2{
	font-weight: 300px;
	margin-top: 20px;
	text-align: center;
	font-size: 40px;
}

.form-control{
  	width:200px;
    font-size:20px;
}



</style>
<title>Insert title here</title>

</head>




<body><div class="home">
	<div class="wrapper">
	<div class="container">
    <form action="./singUp.do" method="post" class="form-inline" >
    
                            <h2>회원가입</h2>
    <table id="type02" class="type02">
<!--                     <tr> -->
<!--                         <td colspan="12"> -->
<!--                         </td> -->
<!--                     </tr> -->
                    <tr>
                        <th colspan="2">
                            <h3 id="h3">아이디</h3>
                        </th>
                        <td colspan="5">
                           <input type="text" class="form-control" id="memberId" name="memberId" required>
                        </td>
                        <th colspan="2">
                            <h3 id="h3">이 름</h3>
                        </th>
                        <td colspan="3">
                             <input type="text" class="form-control" id="name" name="memName" required> <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="12">
                            <span class="checkIdComment">ID는 영문소문자 + 숫자로 작성가능하며  6자 이상 16자 이하로 설정해주시기 바랍니다.(공백불가)</span>
                        </td>
                    </tr>
                     <tr>
                        <th colspan="2">
                            <h3 id="h3">비밀번호</h3>
                        </th>
                        <td colspan="3">
                            <input type="Password" class="form-control" id="memPw" name="memPw" required>
                        </td>
                        <td colspan="2">
                            <input type="Password"  class="form-control" id="validPassword" required>
                        </td>
                        <td colspan="4">
                            <span class="point checkPwdComment"></span>
            				<input type="hidden" id="doubleCheckPwd"/>
                        </td>
<!--                         <td colspan="2"> -->
<!--                             <span class="point checkPwdComment"></span> -->
<!--             				<input type="hidden" id="doubleCheckPwd"/> -->
<!--                         </td> -->
                    </tr>
                    <tr>
                        <th colspan="2">
                            <h3 id="h3">이메일</h3>
                        </th>
                        <td colspan="8">
                            <input id="email" class="form-control" type="text" name="memEmail"  required/>
                        </td>
                        <td colspan="2" style="text-align: center;">
                            <input type="button" id="checkEmailBtn" class="btn btn-outline-primary btn-lg" value="인증번호 보내기"><br>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <h3 id="h3">인증번호 확인</h3>
                        </th>
                        <td colspan="4">
                            <input id="validEmail" class="form-control" type="text" name="sm_email2" title="인증번호 입력" required/>
                        </td>
                        <td colspan="2" style="text-align: center;">
                            <input type="button" value="인증번호 확인" id="validEmailBtn" class="btn btn-outline-primary btn-lg">
                        </td>
                        <td colspan="4">
<!--                             <span id="validEmailBtn" class="btn btn-info">이메일인증</span> -->
				             <span class="point checkEmailComment">이메일 입력후 인증번호 보내기를 해주십시오.</span>
				             <input type="hidden" id="doubleCheckEmail"/> 
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <h3 id="h3">생년월일</h3>
                        </th>
                        <td colspan="9">
<!--                         <label for="datepicker">생년월일</label> -->
                            <input type="date"  class="form-control" id="datepicker" name="memBirth">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <h3 id="h3">주소</h3>
                        </th>
                        <td colspan="9">
                            <input type="text" class="form-control" id="address_kakao" name="memAddr" readonly />
                        </td>
<!--                         <td colspan="5"> -->
<!--                             <input type="text" class="form-control" name="memAddr" placeholder="상세주소"/> -->
<!--                         </td> -->
                    </tr>
                    <tr>
                        <th colspan="2" rowspan="2">
                            <h3 id="h3">폰번호</h3>
                        </th>
                        <td colspan="6">
                            <input id="Hp" class="form-control" type="text" name="memPhone"  required />
                        </td>
                        <td colspan="4" style="text-align: center;">
                            <input type="button" id="checkHpBtn" class="btn btn-outline-primary btn-lg" value="인증번호 보내기"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="validHp" class="form-control" type="text" name="sm_Hp2" title="인증번호 입력" required/>
                        </td>
                        <td colspan="4">
                            <span id="validHpBtn" class="btn btn-outline-primary btn-lg">핸드폰인증</span><br>
					        <span class="point checkHpComment">핸드폰번호 인증번호 보내기를 해주십시오.</span>
					        <input type="hidden" id="doubleCheckHp"/>
                        </td>
                        <td colspan="4">
                        	<input type="hidden" id="doubleCheckHp"/>
                            <h3>인증번호 확인 여부</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="12" style="text-align: center;">
                            <input type="submit" value="회원가입" class="btn btn-outline-primary btn-lg">
                        </td>
                    </tr>
    				
                </table>
    </form>

	</div>
	</div>
</div>
	
</body>



<script type="text/javascript">




//  $("#memberId").focus();
 
//  var chkUserId = false;
//  var chkUserPw = false;
//  var chkUserEmail = false;
//  var chkUserHp = false;
 
	$("#memberId").blur(function() {
		// 아이디 정규화
		var regId = /^[a-z]+[a-z0-9]{5,15}$/;
		 
		var inputUserName = $("#memberId").val();
		console.log(inputUserName, typeof inputUserName);
		
		console.log(regId.test(inputUserName));
		if (inputUserName == "" || !regId.test(inputUserName)) {
// 			alert("아이디를 입력해주세요");
			$("#memberId").focus();
			$(".checkIdComment").text("ID를 6자 이상 16자 이하로 설정해주세요 :)");
			$(".checkIdComment").css("color", "red");
// 			$("#doubleCheckId").val("false");
		} else {
			$.ajax({
				url : './chkUserId.do?id=' + inputUserName,
				type : 'get',
				//async : true,
				success : function(data) {
					if (data == 0) {
						$(".checkIdComment").text("사용가능한 ID입니다.");
						$(".checkIdComment").css("color", "green");
// 						$("#doubleCheckId").val("true");
// 						$("#memberId").attr("disabled", true);
// 						$("#doubleCheckId").val(true);
// 						checkUserId=true;
					} else {
						$(".checkIdComment").text("사용중인 ID입니다");
						$(".checkIdComment").css("color", "red");
						$("#memberId").focus();
// 						$("#doubleCheckId").val("false");
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		}
	});

$("#name").blur(function(){
	var regName = /[가-힣]{2,7}/;
	var inputName = $("#name").val();
	console.log(inputName);
	console.log(inputName.length)
// 	console.log(regName.test(inputName) && !inputName.length <= 2 || inputName.trim() == ""); //수정필요
	console.log(!inputName.trim() == "");
	if(!regName.test(inputName || !inputName.trim() == "") ){
		console.log($("#name").val());
		$("#name").val("");
// 		alert("이름은 공백 및 영어로 작성이 불가합니다");
		$("#name").focus();
// 		return false;
	}
});

	$("#validPassword").blur(function() {
	var password = $("#memPw").val();
	console.log(password);
//		비밀번호 정규화 8 ~ 16 영문 숫자
	var regPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
	console.log(regPw.test(password));
		if(regPw.test(password)){
			$(".checkPwdComment").text("비밀번호는 영문 소문자 포함 8~16만 가능합니다(공백불가)");
			$(".checkPwdComment").css("color", "red");
			$("#memPw").focus();
			$("#validPassword").val("");
			$("#memPw").val("");
		}else if ($("#validPassword").val() == $("#memPw").val()) {
			$(".checkPwdComment").text("비밀번호가 일치합니다.");
			$(".checkPwdComment").css("color", "green");
// 			$("#doubleCheckPwd").val("true");
// 			$("#validPassword").attr("disabled", true);
// 			$("#memPw").attr("disabled", true);
		} else {
			$(".checkPwdComment").text("비밀번호가 일치하지 않습니다.");
			$(".checkPwdComment").css("color", "red");
// 			$("#doubleCheckPwd").val("false");
			$("#memPw").focus();
			$("#memPw").val("");
		}
	});

	var code = "";
	$("#checkEmailBtn").click(function() {
	// 이메일 정규화 
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var inputEmail = $("#email").val();
	if(regEmail.test(inputEmail) || !inputEmail.includes("")){
		
	$.ajax({
			type : "GET",
			url : "./checkMail.do?email=" + inputEmail,
			cache : false,
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
// 		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
// 			$("#email").attr("autofocus", true);
			$(".checkEmailComment").text("유효한 이메일 주소를 입력해주세요.");
			$(".checkEmailComment").css("color", "red");
			$("#email").focus();
			$("#email").val("");
	}
});

	//이메일 인증번호 대조
	$("#validEmailBtn").click(function() {
		
		if ($("#validEmail").val() == code && code != "") {
			$(".checkEmailComment").text("인증번호가 일치합니다.");
			$(".checkEmailComment").css("color", "green");
			$("#doubleCheckEmail").val("true");
			$("#validEmail").attr("disabled", true);
			$("#email").attr("disabled", true);
			chkUserEmail = true;
		} else {
			$(".checkEmailComment").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".checkEmailComment").css("color", "red");
			$("#doubleCheckEmail").val("false");
			$("#validEmail").attr("autofocus", true);
			$("#validEmail").focus();
			$("#validEmail").val("");
		}
	});

	var codeHP = "";
	$("#checkHpBtn").click(function() {
		 // 핸드폰 번호 정규화
		 var regHp = /^[\+]?[(]?[0-1]{3}[)]?[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4}$/;
		var inputHP = $("#Hp").val();
		console.log(regHp.test(inputHP));
		if(regHp.test(inputHP)){
	
		$.ajax({
			type : "GET",
			url : "./checkHp.do?Hp=" + inputHP,
			cache : false,
			success : function(data) {
				if (data == "error") {
					console.log(data)
// 					alert("핸드폰 번호가 올바르지 않습니다. 유효한 핸드폰 번호를 입력해주세요.");
// 					$("#Hp").attr("autofocus", true);
// 					$(".checkHpComment").text("유효한 핸드폰번호를 입력해주세요.");
// 					$(".checkHpComment").css("color", "red");
				} else {
					alert("인증번호 발송이 완료되었습니다.\n입력한 핸드폰에서 인증번호 확인을 해주십시오.");
					$("#validHp").attr("disabled", false);
					$("#validHpBtn").css("display", "inline-block");
					$(".checkHpComment").text("인증번호를 입력한 뒤 핸드폰 인증을 눌러주십시오.");
					$(".checkHpComment").css("color", "green");
					codeHP = data;
				}
			}
		})
			
		}else{
			alert("핸드폰 번호가 올바르지 않습니다. 유효한 핸드폰 번호를 입력해주세요.");
			$("#Hp").attr("autofocus", true);
			$(".checkHpComment").text("유효한 핸드폰번호를 입력해주세요.");
			$(".checkHpComment").css("color", "red");
			$("#Hp").focus();
			$("#Hp").val("");
		}
		
	});

	//핸드폰 인증번호 대조
	$("#validHpBtn").click(function() {
		if ($("#validHp").val() == codeHP && codeHP != "") {
			$(".checkHpComment").text("인증번호가 일치합니다.");
			$(".checkHpComment").css("color", "green");
			$("#doubleCheckHp").val("true");
// 			$("#validHpBtn").attr("disabled", true);
// 			$("#validHp").attr("disabled", true);
			chkUserHp = true;
		} else {
			$(".checkHpComment").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".checkHpComment").css("color", "red");
			$("#doubleCheckHp").val("false");
			$("#validHp").attr("autofocus", true);
			$("#validHp").focus();
			$("#validHp").val("");
		}
	});
	
	window.onload = function() {
		document
		.getElementById("address_kakao")
		.addEventListener("click",function() { //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode(
		{
		oncomplete : function(data) { //선택시 입력값 세팅
		document.getElementById("address_kakao").value = data.address; // 주소 넣기
				}
		}).open();
	});
	}
	
	

</script>



</html>