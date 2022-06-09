<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<!-- <form action="./singUpSc.do" method="post"> -->
<!-- 아이디 : <input type="text" name="id"> -->
<!-- 비밀번호 :<input type="text" name="pw"> -->
<!-- 이름 : <input type="text" name="name"> -->
<!-- <input type="submit" value="회원가입"> -->
<!-- </form> -->
<div class="container">
    <form action="./singUp.do" method="post">
        <div class="form-group">
            <label for="userId">User id</label>
            <input type="text" placeholder="Enter ID" id="userId" name="memberId">
            <span class="checkIdComment">ID은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span>
            <input type="hidden" id="doubleCheckId"/>
        </div>
        <div class="form-group">
            <label for="username">User name</label>
            <input type="text" placeholder="Enter name" id="name" name="memName">
            <span class="point checkNameComment">name은 2자 이상 10자 이하로 설정해주시기 바랍니다.</span>
            <input type="hidden" id="doubleCheckName"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="Password" placeholder="Enter password" id="password" name="memPw">
        </div>
        <div class="form-group">
            <label for="password">Validation Password</label>
            <input type="Password" placeholder="Enter password" id="validPassword">
            <span class="point checkPwdComment"></span>
            <input type="hidden" id="doubleCheckPwd"/>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" class="email" type="text" name="memEmail" title="이메일 주소를 입력해주세요." required/>
            <button><span id="checkEmailBtn" class="btn btn-info">인증번호 보내기</span><br/></button><br>
      <label for="validEmail">Validation Email</label>
             <input id="validEmail" class="number" type="text" name="sm_email2" title="인증번호 입력" disabled required/> -->
             <span id="validEmailBtn" class="btn btn-info">이메일인증</span> -->
             <span class="point checkEmailComment">이메일 입력후 인증번호 보내기를 해주십시오.</span> -->
             <input type="hidden" id="doubleCheckEmail"/> 
        </div>
        <div class="form-group">
            <label for="datepicker">birthDay</label>
            <input type="text" placeholder="Enter birthDay" id="datepicker" name="memBirth">
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
            <input id="validHp" class="number" type="text" name="sm_Hp2" title="인증번호 입력" disabled required/>
            <span id="validHpBtn" class="btn btn-info">핸드폰인증</span>
            <span class="point checkHpComment">핸드폰번호 인증번호 보내기를 해주십시오.</span>
            <input type="hidden" id="doubleCheckHp"/>
        </div>
       <input type="submit" value="Sign up">
    </form>

</div>

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


$("#userId").blur(function(){
    var inputUserName = $("#userId").val();
    console.log(inputUserName , typeof inputUserName);
    if(inputUserName == "" || inputUserName.length < 2){
        $(".checkIdComment").text("ID를 2자 이상 8자 이하로 설정해주세요 :)");
        $(".checkIdComment").css("color", "red");
        $("#doubleCheckId").val("false");
    }else{
        $.ajax({
            url : './chkUserId.do?id='+ inputUserName,
            type : 'get',
//             async : true,
            success : function(data) {
                if (data == 0) {
                    $(".checkIdComment").text("사용가능한 이름입니다.");
                    $(".checkIdComment").css("color", "green");
                    $("#doubleCheckId").val("true");
                } else {
                    $(".checkIdComment").text("사용중인 이름입니다 :p");
                    $(".checkIdComment").css("color", "red");
                    $("#doubleCheckId").val("false");
                }
            }, error : function() {
                console.log("실패");
            }
        });
    }
});

//비밀번호 확인
$("#validPassword").blur(function(){
    if($("#validPassword").val() == $("#password").val()){
        $(".checkPwdComment").text("비밀번호가 일치합니다.");
        $(".checkPwdComment").css("color", "green");
        $("#doubleCheckPwd").val("true");
    }else{
        $(".checkPwdComment").text("비밀번호가 일치하지 않습니다.");
        $(".checkPwdComment").css("color", "red");
        $("#doubleCheckPwd").val("false");
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

//이멩ㄹ 인증번호 대조
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