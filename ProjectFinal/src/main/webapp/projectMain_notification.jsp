<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/index.css">
        <script src="js/index.js"></script>
        <script src="js/noti/noti.js"></script>
    </head>
    <body>

        <div class="wrapper">  
            
            <div class="nav">
                <a href="#" class="logo">Home</a>
                <div class="nav-right">
                    <a id="loginInfo">
                        loginInfo
                        <img id="chatIcon" alt="chat" src="img/chat.png"/>
                        <a href="#" onclick="arlimList()"><img id="notiIcon" alt="notification" src="img/notification.png"/></a>
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
                <div class="child1"></div>
            </div>
        </div>
    </body>
    <script>
/////////////////////////NOTIFICATION/////////////////////////////////
    window.onload = function() {
    	// 알림 권한 요청
    	Notification.requestPermission();
    	var arr = new Array();
    		<c:forEach var="post" items="${lists}"   varStatus="status">
    			arr.push({
    				projectName:"${post.proj_name}", 
    				content :"${post.noti_content}",
    				notifided:"${post.noti_notifided}",
    				regdate: "${post.noti_regdate}",
    				notiId:"${post.noti_id}"
    						});
    		</c:forEach>
    	for (var j = 0; j < arr.length; j++) {
    		var regdate = moment(arr[j].regdate).format('YYYY-MM-DD')
    		var tomorrow = moment().add("1","d").format('YYYY-MM-DD')
    		console.log(regdate);
    		console.log(tomorrow);
    		if(regdate == tomorrow && arr[j].notifided=="N" && localStorage.getItem("Arlim") == "yes"){
    			notify();
//     			notifieded(arr[j].notiId);
    		}
    		
    		
    		function notify() {
                    var notification = new Notification(arr[j].content, {
                        icon: 'https://data1.pokemonkorea.co.kr/newdata/pokedex/full/072201.png',
                        body: arr[j].content + "의 마감이 하루 남았어요!"
                    });
               
                    notification.onclick = function () {
                    	   window.location.href = "https://www.naver.com";
                    };
    		}		
    	}
    }

    function notifieded(notiId){
    	$.ajax({
    		url : "./notifieded.do",
    		type:"post",
    		data: "notiId="+notiId
    	});
    }// function
    </script>
</html>