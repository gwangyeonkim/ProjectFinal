<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>
</head>
<body>
<style>

body{
max-width:500px;
max-height:600px;
background-color: black;
}

#arlim_container{
	width : 500px;
	height: 500px;
	background-color: #F6F6F6;
	overflow: scroll;
	 text-overflow: ellipsis;
}

ul{
	background-color: #FFFFFF;
	margin : 0px;
	padding:0px;
	border: 1px solid black;
}
ul>li{
	list-style: none;
 	margin : 20px;
 	font-size: 15px; 
}

#delete{
	display: inline-block;
	float: right;
	
}

#content{
	font-size: 20px;
}

h3{
	color: white;
	font-weight: bold;
}
</style>
<h3>알림함</h3>

<div id="arlim_container">
	 <c:forEach var="post" items="${AllLists}"  varStatus="status">
		<ul id="${post.notiId}" onclick="confirmNoti('${post.notiId}')">
			<li id="title">${post.projName}<a href="#" id="delete" onclick="deleteArlim('${post.notiId}')">X</a></li>
			<li id="content">${post.notiContent}의 마감일은 <p id="InRegdate${status.count}" style="display: inline-block;">@@@@@</p>입니다</li>
		</ul>
	</c:forEach>
</div>


</body>
<script>
//만약 Y이면 회색
window.onload = function() {
	var arr = new Array();
	<c:forEach var="post" items="${AllLists}"   varStatus="status">
		arr.push({
			notifided:"${post.notiNotifided}",
			regdate: "${post.notiRegdate}",
			notiId:"${post.notiId}"
					});
	</c:forEach>
	
	
	for(var i=0; i<arr.length; i++){
		var notifided = arr[i].notifided;
		var notiId = arr[i].notiId;
		
		var cn = document.getElementById(notiId);
		if(notifided=="Y"){
			cn.style.backgroundColor="#D5D5D5";
		}
		var aa = "InRegdate"+(i+1);
		var regdate = moment(arr[i].regdate).format('YYYY년 MM월 DD일');
		document.getElementById(aa).innerText=regdate;
		
	}
}

function deleteArlim(notiId){
// 	$.ajax({
// 		url : "./deleteArlim.do",
// 		type:"post",
// 		data: "notiId="+notiId,
// 		success:function(data){
// 			alert(data.isc);
// 		}
// 	});
	var container = document.getElementById("arlim_container");
	var notiId2 = document.getElementById(notiId);
 	container.removeChild(notiId2);

}

function confirmNoti(notiId){
	var cn = document.getElementById(notiId);
	cn.addEventListener('click',notifieded(notiId));
	cn.style.backgroundColor="#D5D5D5";
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