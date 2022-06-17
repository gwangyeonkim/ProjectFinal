<%@ page language="java" contentType="text/html; charset=UTF-8"	
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/projectMain.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>
<!-- notification 추가 script -->
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>

<script src="js/index.js"></script>
</head>
<body>
	<div class="navb">
		<a href="./scheboard.do" class="logo">Home</a>
		<div class="dropdown"> 
			<button class="dropbtn" onclick="location.href='./drop.do'">Document</button>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='./calendar.do'">Calendar</button>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='./memberlistAll.do'">Member</button>
			<div class="dropdown-content">
				<a href="./memberlistAll.do">회원조회하기</a> <a href="#">2</a> <a href="#">3</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn" onclick="location.href='./moveFixhistory.do'">Template</button>
		</div>
		<div class="navb-right">

			<a href="./modifyMember.do" id="loginInfo"> ${loginVo.memberId}님
				<img id="chatIcon" alt="chat" src="img/chat.png" onclick="goSocket('${loginVo.memberId }')" /> 
				<img id="notiIcon" alt="notification" src="img/notification.png" onclick="arlimList()"/>
				<span id="notiNonCheck">&#128308;</span>
				 <!-- 이 notiCount가 미확인 알림 숫자임 -->
				<span id="notiCount">${count}</span> 
			 </a> 

				<a class="active" href="./logout.do">logout</a>
		</div>
	</div>
</body>
<script>
	function goSocket(mem_id) {
		console.log(mem_id);
		window.open("./socketOpenGr.do?mem_id=" + mem_id, "채팅","width=500px, height=735px, toolbar=no, menubar=no, left=300px, top=50px")
	}
	function arlimList() {
		window.open("./ArlimList.do", "","width=500,height=600,scrollbars=no, fullscreen=yes, resizable=no");
	}

	function callHeader(id) {
		var arr = new Array();
		$.ajax({
			url : "./callHeader.do",
			type : "post",
			data : "notiId="+id,
			success : function(result) {
// 				console.log(result.lists);
// 				console.log(result.count);
				$("#notiCount").append().text(result.count)
				for (var k in result.lists) {
// 					console.log(result.lists[k].notiContent);
					arr.push({
						projectName :result.lists[k].projName, 
						content : result.lists[k].notiContent,
						notifided :result.lists[k].notiNotifided,
						regdate :result.lists[k].notiRegdate ,
						notiId :result.lists[k].notiId 
					});
// 					console.log(arr[k]);
				}//for문
				for (var j = 0; j < arr.length; j++) {
					var regdate = moment(arr[j].regdate).format('YYYY-MM-DD')
					var tomorrow = moment().add("1", "d").format('YYYY-MM-DD')
// 					console.log(regdate);
// 					console.log(tomorrow);
					if (regdate == tomorrow && arr[j].notifided == "N"&& localStorage.getItem("Arlim") == "yes") {
// 						notify();
// 			   			notifieded(arr[j].notiId);
					}//for문	
				}	
				function notify() {
					var notification = new Notification(
							arr[j].content,
							{
								icon : './img/gun.PNG',
								body : arr[j].content +"의 마감이 하루 남았어요!"
							});
					notification.onclick = function() {
						window.location.href = "https://www.naver.com";
					};
				}
			}, // success
			error : function(data) {
				alert("fail");
// 				console.log(data);;
			} // error
		});
	}//callHeader
	
	window.addEventListener('DOMContentLoaded',function() {
			callHeader('${loginVo.memberId}');
			// 알림 권한 요청
			Notification.requestPermission();
	});

	function notifieded(notiId) {
		$.ajax({
			url : "./notifieded.do",
			type : "post",
			data : "notiId="+notiId
		});
	}// function
</script>

</html>