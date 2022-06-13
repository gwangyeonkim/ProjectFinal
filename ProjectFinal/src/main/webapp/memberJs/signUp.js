	
//  비밀번호 정규화
//  var regPw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
 $("#userId").focus();
 // 이메일 정규화 
 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
 
 // 핸드폰 번호 정규화
 var regHp = /^[\+]?[(]?[0-1]{3}[)]?[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4}$/;
 
//  var chkUserId = false;
//  var chkUserPw = false;
//  var chkUserEmail = false;
//  var chkUserHp = false;
 
	

	$("#userId").blur(function() {
		// 아이디 정규화
		var regId = /^[a-z]+[a-z0-9]{5,15}$/;
		 
		var inputUserName = $("#userId").val();
		console.log(inputUserName, typeof inputUserName);
		console.log(regId.test(inputUserName));
		if (inputUserName == "" || !regId.test(inputUserName)) {
// 			alert("아이디를 입력해주세요");
			$("#userId").focus();
			$(".checkIdComment").text("ID를 6자 이상 16자 이하로 설정해주세요 :)");
			$(".checkIdComment").css("color", "red");
			$("#doubleCheckId").val("false");
		} else {
			$.ajax({
				url : './chkUserId.do?id=' + inputUserName,
				type : 'get',
				//async : true,
				success : function(data) {
					if (data == 0) {
						$(".checkIdComment").text("사용가능한 ID입니다.");
						$(".checkIdComment").css("color", "green");
						$("#doubleCheckId").val("true");
						$("#userId").attr("disabled", true);
// 						$("#doubleCheckId").val(true);
// 						checkUserId=true;
					} else {
						$(".checkIdComment").text("사용중인 ID입니다");
						$(".checkIdComment").css("color", "red");
// 						$("#doubleCheckId").val("false");
					}
				},
				error : function() {
					console.log("실패");
				}
			});
		}
	});