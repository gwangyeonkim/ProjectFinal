<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
   <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/projectMain.css">
        <script src="js/index.js"></script>
    </head>
    <body>
		<a href="./modifyMember.do"> 회원정보 수정페이지 이동</a>
        <div class="wrapper">

            <div class="nav">
                <a href="#" class="logo">Home</a>
                <div class="dropdown">
                    <button class="dropbtn">Document</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Calendar</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Member</button>
                    <div class="dropdown-content">
                     	<a href="./memberlistAll.do">사용자 검색</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Template</button>
                    <div class="dropdown-content">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
                <div class="nav-right">
                    <a id="loginInfo">
                    	loginInfo 
                        <img id="chatIcon" alt="chat" src="img/chat.png"  onclick="goSocket('S','${loginVo.memberId}')"/>
                        <img id="notiIcon" alt="notification" src="img/notification.png"/>
                        <span id="notiNonCheck">&#128308;</span>
                        <!-- 이 notiCount가 미확인 알림 숫자임 -->
                        <span id="notiCount">1</span>
                    </a>
                    <a href="./mamberInfo.do"> ${loginVo.memberId} 님 환영합니다</a>
                    <a class="active" href="./logout.do">logout</a>
                </div>
            </div>
            <div class="content">
                <!--여기 넣으면 됨-->
                <div class="child1"></div>
            </div>
        </div>
    </body>  
   <script>
	function goSocket(gr_id, mem_id){
		//CH001++++++++++++++++++++++++++데이터베이스 일치시켜야함++++++++++++++++++++++++++++++
		 window.open("./socketOpenGr.do?mem_id="+"CH001","그룹체팅", "width=500px, height=735px, toolbar=no, menubar=no, left=300px, top=50px")
	}
   </script> 
</html>