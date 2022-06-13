<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
   <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/projectMain.css">
        <script src="js/index.js"></script>
    </head>
    <body>
		<a href="./modifyMember.do"> 회원정보 수정페이지 이동</a>

            <div class="nav">
			<a href="#" class="logo">Home</a>
			<div class="dropdown">
				<button class="dropbtn">Document</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Calendar</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Member</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Template</button>
				<div class="dropdown-content">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
				</div>
			</div>
			<div class="nav-right">
				<a id="loginInfo"> ${loginVo.memberId}님 
				 <img id="chatIcon" alt="chat" src="img/chat.png"  onclick="goSocket('${loginVo.memberId }')"/>
                  <img id="notiIcon" alt="notification" src="img/notification.png" onclick="arlimList()"/>
				<span id="notiNonCheck">&#128308;</span>
					<!-- 이 notiCount가 미확인 알림 숫자임 --> 
					<span id="notiCount">${count}</span>
                <a class="active" href="./logout.do">logout</a>
                </a>
			</div>
		</div>
    </body>  
<script>
function goSocket(mem_id){
	console.log(mem_id);
	 window.open("./socketOpenGr.do?mem_id="+mem_id,"채팅", "width=500px, height=735px, toolbar=no, menubar=no, left=300px, top=50px")
}
function arlimList(){	
	window.open("./ArlimList.do" ,"", "width=500,height=600,scrollbars=no, fullscreen=yes, resizable=no");  
}

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
//    			notifieded(arr[j].notiId);
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