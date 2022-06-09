<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/index.css">
        <script src="js/index.js"></script>
    </head>
    <body>
		<a href="./modifyMember.do">회원정보 수정 페이지 이동</a>
        <div class="wrapper">  
        <h1>${loginVo} 안녕하세요</h1>
		<h1>${memberVo} 안녕하세요</h1>
            
            <div class="nav">
                <a href="#" class="logo">Home</a>
                <div class="nav-right">
                    <a id="loginInfo">
<%--                         loginInfo${loginVo.id} --%>
                        <img id="chatIcon" alt="chat" src="img/chat.png"/>
                        <img id="notiIcon" alt="notification" src="img/notification.png"/>
                        <span id="notiNonCheck">&#128308;</span>
                        <!-- 이 notiCount가 미확인 알림 숫자임 -->
                        <span id="notiCount">1</span>
                    </a>
                    <a class="active" href="#home">logout</a>
                </div>
            </div>
            <div id="mySidenav" class="sidenav">
                <a href="#" id="Document" onclick="openNav()">Document</a>
                <a href="#" id="Calendar" onclick="openNav()">Calendar</a>
                <a href="#" id="Member" onclick="openNav()">Member</a>
                <a href="#" id="Template" onclick="openNav()">Template</a>
            </div>
            <div class="content">
                <!--여기 넣으면 됨-->
                <div class="child1">
                    
                </div>
            </div>
        </div>
    </body>
</html>