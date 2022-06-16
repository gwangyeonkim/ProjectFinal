<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- date picker ui css -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<style type="text/css">
.home{
			margin: 0 auto;
			border: 2px solid black;
			width:1400px;
			height: 600px;
		}

		#joinTable{
			padding-top:50px;
			margin: 0 auto;
            text-align: center;
		}

        #joinTable > tr,td {
            border: 2px solid black;
            border-collapse: collapse;
            width: 200px;
            height: 50px;
        }

        input[type=text] { 
            width: 100%;
            height: 100%; 
            font-size: 20px;
            font-weight: 1000;
        }


</style>
<title>Insert title here</title>
</head>



<%@include file="./header.jsp" %>
<body>

<div class="home">
	<div class="wrapper">
    <form action="./singUp.do" method="post" class="joinForm" >
    <table id="joinTable">
                    <tr>
                        <td colspan="12">
                            <h2>회원가입</h2>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>아이디</h3>
                        </td>
                        <td colspan="5">
                           <input type="text" placeholder="Enter ID" class="comm" id="memberId" name="memberId" required>
                        </td>
                        <td colspan="2">
                            <h3>이름</h3>
                        </td>
                        <td colspan="3">
                             <input type="text" placeholder="Enter name" class="comm" id="name" name="memName" required> <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="12">
                            <span class="checkIdComment">ID는 영문소문자 + 숫자로 작성가능하며  6자 이상 16자 이하로 설정해주시기 바랍니다.(공백불가)</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>비밀번호</h3>
                        </td>
                        <td colspan="3">
                            <input type="Password" placeholder="Enter password" class="comm" id="memPw" name="memPw" required>
                        </td>
                        <td colspan="2">
                            <input type="Password" placeholder="Enter password" class="comm" id="validPassword" required>
                        </td>
                        <td colspan="3">
                            <input type="text" name="" id="">
                        </td>
                        <td colspan="2">
                            <span class="point checkPwdComment"></span>
            				<input type="hidden" id="doubleCheckPwd"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>이메일</h3>
                        </td>
                        <td colspan="8">
                            <input id="email" class="comm" type="text" name="memEmail"  required/>
                        </td>
                        <td colspan="2">
                            <input type="button" id="checkEmailBtn" class="btn" value="인증번호 보내기"><br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>인증번호 확인</h3>
                        </td>
                        <td colspan="4">
                            <input id="validEmail" class="comm" type="text" name="sm_email2" title="인증번호 입력" required/>
                        </td>
                        <td colspan="2">
                            <input type="button" value="확인">
                        </td>
                        <td colspan="4">
                            <span id="validEmailBtn" class="btn btn-info">이메일인증</span>
				             <span class="point checkEmailComment">이메일 입력후 인증번호 보내기를 해주십시오.</span>
				             <input type="hidden" id="doubleCheckEmail"/> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>생년월일</h3>
                        </td>
                        <td colspan="10">
                            <input type="text" placeholder="Enter birthDay" class="comm" id="datepicker" name="memBirth">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>주소</h3>
                        </td>
                        <td colspan="5">
                            <input type="text" class="comm" id="address_kakao" name="memAddr" readonly />
                        </td>
                        <td colspan="5">
                            <input type="text" class="comm" name="address_detail" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>폰번호</h3>
                        </td>
                        <td colspan="6">
                            <input id="Hp" class="comm" type="text" name="memPhone"  required />
                        </td>
                        <td colspan="4">
                            <input type="button" id="checkHpBtn" class="btn" value="인증번호 보내기"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="validHp" class="comm" type="text" name="sm_Hp2" title="인증번호 입력" required/>
                        </td>
                        <td colspan="3">
                            <input type="text" name="" id="">
                        </td>
                        <td colspan="3">
                            <span id="validHpBtn" class="btn btn-info">핸드폰인증</span>
					        <span class="point checkHpComment">핸드폰번호 인증번호 보내기를 해주십시오.</span>
					        <input type="hidden" id="doubleCheckHp"/>
                        </td>
                        <td colspan="4">
                        	<input type="hidden" id="doubleCheckHp"/>
                            <h3>인증번호 확인 여부</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="12">
                            <input type="submit" value="Sign up" class="btn">
                        </td>
                    </tr>
                </table>
    
			
    </form>
	</div>
</div>
	
</body>



<script type="text/javascript">


// function joinform_check(){
	
 
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
//     $("#userId").focus();  작동안됨..



$("#name").blur(function(){
	var regName = /[ㄱ-힣]/;
	var inputName = $("#name").val();
	console.log(inputName);
	console.log(inputName.length)
	console.log(regName.test(inputName) && inputName.length < 2 || inputName.trim() == ""); //수정필요
	if(!regName.test(inputName) ){
		console.log($("#name").val());
// 		alert("공백불가");
		$("#name").val("");
// 		$("#name").focus();
// 		return false;
	}
});

	//비밀번호 확인 정규화적용해야함
	$("#validPassword").blur(function() {
// 		비밀번호 정규화 8 ~ 16 영문 숫자 
	var regPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
	console.log(regPw.test($("#memPw")))
		if ($("#validPassword").val() == $("#memPw").val()) {
			$(".checkPwdComment").text("비밀번호가 일치합니다.");
			$(".checkPwdComment").css("color", "green");
// 			$("#doubleCheckPwd").val("true");
// 			$("#validPassword").attr("disabled", true);
// 			$("#memPw").attr("disabled", true);
		} else {
			$(".checkPwdComment").text("비밀번호가 일치하지 않습니다.");
			$(".checkPwdComment").css("color", "red");
// 			$("#doubleCheckPwd").val("false");
// 			$("#memPw").focus();
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
		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
			$("#email").attr("autofocus", true);
			$(".checkEmailComment").text("유효한 이메일 주소를 입력해주세요.");
			$(".checkEmailComment").css("color", "red");
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
		}
	});
	
// 	$("#join_form").click(function () {
// 	  	$("form").submit();
// 	  });
	
// }

	window.onload = function() {
		document
		.getElementById("address_kakao")
		.addEventListener("click",function() { //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode(
		{
		oncomplete : function(data) { //선택시 입력값 세팅
		document.getElementById("address_kakao").value = data.address; // 주소 넣기
		document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
				}
		}).open();
	});
	}
	
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker").datepicker(
		{dateFormat : 'yy-mm-dd' //달력 날짜 형태
		,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시  
		,showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
		,changeYear : true //option값 년 선택 가능
		,changeMonth : true //option값  월 선택 가능                
		,showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		,buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		,buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
		,buttonText : "선택" //버튼 호버 텍스트              
		,yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
		,monthNamesShort : [ '1월', '2월', '3월', '4월', '5월','6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
		,monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
		,dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
		,dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일','금요일', '토요일' ] //달력의 요일 Tooltip
		//            ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,maxDate : "0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
		,yearRange : "1960:2022"
		});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});

</script>



</html>